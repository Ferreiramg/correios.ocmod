Módulo Correios Opencart 3.0
-----------------------------------------------

Parâmetros usados pelos correios:
--------------------------------

[Visite:] (http://www.correios.com.br/para-voce/precisa-de-ajuda/limites-de-dimensoes-e-de-peso)

Nota: Sedex Hoje tem peso e dimensões máximas menores que o mensionado pelo site dos Correios.
	
Requisitos
----------
1 - PHP ^5.6

2 - [Template Switcher]( https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=31589&filter_member=JNeuhoff)

Instalação
----------

1 - Instale o módulo pelo admin (Extensões -> Instalador).

2 - Configure as opções do módulo Correios (Extensões -> Fretes).

Observações:
-----------

1) Os valores dos fretes obtidos diretamente do site dos Correios são estimativas que devem ser confirmados no ato da postagem.

2) Para o correto funcionamento do módulo é essencial o cadastro correto das dimensões e pesos do produtos. 
   As dimensões podem ser em milímetros ou centímetros. O peso em gramas ou kilogramas.

3) Se as opções dos Correios não aparecerem consulte o log de erros do OpenCart para mais detalhes.

4) Nem todo CEP é coberto por alguns serviços, como o Sedex 10. Neste caso, a opção de entrega deste serviço não aparecerá para o cliente.

NOTA:
-----------

> O sistema ainda não está totalmente pronto, não havendo um tratamento de erros. Estude o codigo e teste antes de colocalo em produção.

Erros mais comuns
-----------

*** OPÇÃO DOS CORREIOS NÃO APARECE NA LOJA ***

Várias razões pode contribuir para que os Correios não aparece nas opções de entrega:

-> CEP de origem e destino incorretos 
-> Dimensões e pesos dos produtos em branco ou fora dos padrões dos Correios
-> Moeda (Real) não configurada na loja
-> Problemas com o webservice dos Correios (neste caso não tem muito o que fazer a não ser esperar o serviço voltar a normalidade)
-> Instalação da versão incorreta do módulo para a versão da sua loja.

----------------------------
Dúvidas, sugestões e avisos sobre bugs acessem o tópico do módulo no fórum do OpenCart Brasil:
http://forum.opencartbrasil.com.br/

----------------------------

Projeto Original de:
Júlio César Campos Guimarães
