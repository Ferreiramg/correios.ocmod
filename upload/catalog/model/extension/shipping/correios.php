<?php

require_once __DIR__ . '/lib/CorreioIterator.php';

class ModelExtensionShippingCorreios extends Model
{
    private $quote_data = array();

    public function getQuote($address)
    {
        $this->addrcep = preg_replace("/[^0-9]/", '', $address['postcode']);
        $this->load->language('extension/shipping/correios');

        $query = $this->db->query(
            "SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '"
            . (int)$this->config->get('shipping_correios_geo_zone_id') . "' AND country_id = '"
            . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')"
        );

        if (!$this->config->get('shipping_correios_geo_zone_id')) {
            $status = true;
        } elseif ($query->num_rows) {
            $status = true;
        } else {
            $status = false;
        }

        $method_data = array();
        if ($status) {
            $this->cartValues();//iterator
            $method_data = array(
                'code' => 'correios',
                'title' => $this->language->get('text_title'),
                'quote' => $this->quote_data,
                'sort_order' => $this->config->get('shipping_correios_sort_order'),
                'error' => false
            );
        }

        return $method_data;

    }

    private function cartValues()
    {
        $iterator = new CorreioIterator($this->cart->getProducts(), $this);

        foreach ($iterator as $product) {
            $this->serviceRequest($product);
        }

    }

    private function serviceRequest($products)
    {

        $correios_servicos = $this->config->get('shipping_correios_servicos');
        foreach ($correios_servicos as $services) {
            $params = [
                'nCdServico' => $services['codigo'],
                'nCdEmpresa' => '',
                'sDsSenha' => '',
                'sCepOrigem' => preg_replace("/[^0-9]/", '', $services['postcode']),
                'sCepDestino' => $this->addrcep,
                /* default*/
                'nCdFormato' => '1',
                'nVlPeso' => $products['weight'] < 0.3 ? 0.3 : $products['weight'],//Kg
                'nVlComprimento' => $products['length'] < 16 ? 16 : $products['length'],//cm
                'nVlLargura' => $products['width'] < 11 ? 11 : $products['width'],//cm
                'nVlAltura' => $products['height'] < 2 ? 2 : $products['height'],//cm
                'nVlDiametro' => 0,//cm
                'sCdMaoPropria' => 'S',//S | N
                'nVlValorDeclarado' => 0,
                'sCdAvisoRecebimento' => 'S',//S | N
                'StrRetorno' => 'xml',
            ];
            $url = "http://ws.correios.com.br/calculador/CalcPrecoPrazo.asmx/CalcPrecoPrazo?" . http_build_query($params);

            $xml = simplexml_load_file($url);

            if ($xml instanceof \SimpleXMLElement) {
                $title = $services['nome'] . ' - ' . sprintf($this->language->get('text_prazo_estimado'),
                        ($xml->Servicos->cServico->PrazoEntrega + 3)//+ 3 dias uteis
                    );

                $text = $this->currency->format(
                    $this->tax->calculate(
                        $xml->Servicos->cServico->ValorSemAdicionais + 5,//+ R$5,00 adcionais no valor
                        $this->config->get('shipping_correios_tax_class_id'),
                        $this->config->get('config_tax')),
                    $this->session->data['currency']);

                $code = 'C' . $xml->Servicos->cServico->Codigo;

                $this->quote_data[$code] = [
                    'code' => 'correios.' . $code,
                    'title' => $title,
                    'cost' => round($xml->Servicos->cServico->ValorSemAdicionais + 5, 2),
                    'tax_class_id' => $this->config->get('shipping_correios_tax_class_id'),
                    'text' => $text
                ];
            }
        }
    }
}