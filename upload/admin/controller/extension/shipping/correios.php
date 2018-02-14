<?php

class ControllerExtensionShippingCorreios extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('extension/shipping/correios');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->model_setting_setting->editSetting('shipping_correios', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=shipping', true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_all_zones'] = $this->language->get('text_all_zones');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');

        $data['entry_servicos'] = $this->language->get('entry_servicos');
        $data['entry_codigo'] = $this->language->get('entry_codigo');
        $data['entry_nome'] = $this->language->get('entry_nome');
        $data['entry_a_cobrar'] = $this->language->get('entry_a_cobrar');
        $data['entry_postcode'] = $this->language->get('entry_postcode');
        $data['entry_contrato_codigo'] = $this->language->get('entry_contrato_codigo');
        $data['entry_contrato_senha'] = $this->language->get('entry_contrato_senha');
        $data['entry_max_declarado'] = $this->language->get('entry_max_declarado');
        $data['entry_min_declarado'] = $this->language->get('entry_min_declarado');
        $data['entry_max_soma_lados'] = $this->language->get('entry_max_soma_lados');
        $data['entry_min_soma_lados'] = $this->language->get('entry_min_soma_lados');
        $data['entry_max_lado'] = $this->language->get('entry_max_lado');
        $data['entry_max_peso'] = $this->language->get('entry_max_peso');
        $data['entry_mao_propria'] = $this->language->get('entry_mao_propria');
        $data['entry_aviso_recebimento'] = $this->language->get('entry_aviso_recebimento');
        $data['entry_declarar_valor'] = $this->language->get('entry_declarar_valor');
        $data['entry_total'] = $this->language->get('entry_total');
        $data['entry_prazo_adicional'] = $this->language->get('entry_prazo_adicional');
        $data['entry_adicional'] = $this->language->get('entry_adicional');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_tax_class'] = $this->language->get('entry_tax_class');
        $data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $data['help_codigo'] = $this->language->get('help_codigo');
        $data['help_nome'] = $this->language->get('help_nome');
        $data['help_a_cobrar'] = $this->language->get('help_a_cobrar');
        $data['help_postcode'] = $this->language->get('help_postcode');
        $data['help_contrato_codigo'] = $this->language->get('help_contrato_codigo');
        $data['help_contrato_senha'] = $this->language->get('help_contrato_senha');
        $data['help_max_declarado'] = $this->language->get('help_max_declarado');
        $data['help_min_declarado'] = $this->language->get('help_min_declarado');
        $data['help_max_soma_lados'] = $this->language->get('help_max_soma_lados');
        $data['help_min_soma_lados'] = $this->language->get('help_min_soma_lados');
        $data['help_max_lado'] = $this->language->get('help_max_lado');
        $data['help_max_peso'] = $this->language->get('help_max_peso');
        $data['help_mao_propria'] = $this->language->get('help_mao_propria');
        $data['help_aviso_recebimento'] = $this->language->get('help_aviso_recebimento');
        $data['help_declarar_valor'] = $this->language->get('help_declarar_valor');
        $data['help_total'] = $this->language->get('help_total');
        $data['help_prazo_adicional'] = $this->language->get('help_prazo_adicional');
        $data['help_adicional'] = $this->language->get('help_adicional');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_add_servico'] = $this->language->get('button_add_servico');

        $data['tab_general'] = $this->language->get('tab_general');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['required'])) {
            $data['error_warning'] = $this->error['required'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=shipping', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/shipping/correios', 'user_token=' . $this->session->data['user_token'], true)
        );

        $data['action'] = $this->url->link('extension/shipping/correios', 'user_token=' . $this->session->data['user_token'], true);

        $data['cancel'] = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'] . '&type=shipping', true);


        if (isset($this->request->post['shipping_correios_servicos'])) {
            $data['correios_servicos'] = $this->request->post['shipping_correios_servicos'];
        } else {
            $data['correios_servicos'] = $this->config->get('shipping_correios_servicos');
        }

        if (empty($data['correios_servicos'])) {
            $data['correios_servicos'] = array();
        }

        if (isset($this->request->post['correios_status'])) {
            $data['correios_status'] = $this->request->post['shipping_correios_status'];
        } else {
            $data['correios_status'] = $this->config->get('shipping_correios_status');
        }

        if (isset($this->request->post['shipping_correios_tax_class_id'])) {
            $data['correios_tax_class_id'] = $this->request->post['shipping_correios_tax_class_id'];
        } else {
            $data['correios_tax_class_id'] = $this->config->get('shipping_correios_tax_class_id');
        }

        if (isset($this->request->post['shipping_correios_tax_class_id'])) {
            $data['correios_geo_zone_id'] = $this->request->post['shipping_correios_geo_zone_id'];
        } else {
            $data['correios_geo_zone_id'] = $this->config->get('shipping_correios_geo_zone_id');
        }

        if (isset($this->request->post['shipping_correios_sort_order'])) {
            $data['correios_sort_order'] = $this->request->post['shipping_correios_sort_order'];
        } else {
            $data['correios_sort_order'] = $this->config->get('shipping_correios_sort_order');
        }

        $this->load->model('localisation/tax_class');

        $data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

        $this->load->model('localisation/geo_zone');

        $data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');


        $this->response->setOutput($this->load->view('extension/shipping/correios', $data));

    }

    protected function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/shipping/correios')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!empty($this->request->post['shipping_correios_servicos'])) {
            foreach ($this->request->post['shipping_correios_servicos'] as $servico) {
                if ((utf8_strlen($servico['codigo']) == 0) || (utf8_strlen($servico['nome']) == 0) || (utf8_strlen($servico['postcode']) == 0) || (utf8_strlen($servico['max_declarado']) == 0) || (utf8_strlen($servico['min_declarado']) == 0) || (utf8_strlen($servico['max_soma_lados']) == 0) || (utf8_strlen($servico['min_soma_lados']) == 0) || (utf8_strlen($servico['max_lado']) == 0) || (utf8_strlen($servico['max_peso']) == 0)) {
                    $this->error['required'] = $this->language->get('error_required');
                    break;
                }
            }
        }

        return !$this->error;
    }
}
