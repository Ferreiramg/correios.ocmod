<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-correios" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-correios"
                      class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-status" data-toggle="tab">Default</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-responsive active" id="tab-general">
                            <h4><?php echo $entry_servicos; ?></h4>
                            <a href="https://www.correios.com.br/para-voce/correios-de-a-a-z/limites-de-dimensoes-e-peso"
                               target="_blank">Clique aqui para mais informações sobre limites de dimensões e peso no
                                site dos Correios</a>
                            <table id="servicos" class="table table-responsive">
                                <thead>
                                <tr>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_codigo; ?>"><?php echo $entry_codigo; ?></span></label>
                                    </td>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_nome; ?>"><?php echo $entry_nome; ?></span></label>
                                    </td>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_a_cobrar; ?>"><?php echo $entry_a_cobrar; ?></span></label>
                                    </td>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_postcode; ?>"><?php echo $entry_postcode; ?></span></label>
                                    </td>
                                    <td class="text-left"><label><span data-toggle="tooltip"
                                                                       title="<?php echo $help_contrato_codigo; ?>"><?php echo $entry_contrato_codigo; ?></span></label>
                                    </td>
                                    <td class="text-left"><label><span data-toggle="tooltip"
                                                                       title="<?php echo $help_contrato_senha; ?>"><?php echo $entry_contrato_senha; ?></span></label>
                                    </td>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_max_declarado; ?>"><?php echo $entry_max_declarado; ?></span></label>
                                    </td>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_min_declarado; ?>"><?php echo $entry_min_declarado; ?></span></label>
                                    </td>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_max_soma_lados; ?>"><?php echo $entry_max_soma_lados; ?></span></label>
                                    </td>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_min_soma_lados; ?>"><?php echo $entry_min_soma_lados; ?></span></label>
                                    </td>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_max_lado; ?>"><?php echo $entry_max_lado; ?></span></label>
                                    </td>
                                    <td class="text-left required"><label><span data-toggle="tooltip"
                                                                                title="<?php echo $help_max_peso; ?>"><?php echo $entry_max_peso; ?></span></label>
                                    </td>
                                    <td class="text-left"><label><span data-toggle="tooltip"
                                                                       title="<?php echo $help_mao_propria; ?>"><?php echo $entry_mao_propria; ?></span></label>
                                    </td>
                                    <td class="text-left"><label><span data-toggle="tooltip"
                                                                       title="<?php echo $help_aviso_recebimento; ?>"><?php echo $entry_aviso_recebimento; ?></span></label>
                                    </td>
                                    <td class="text-left"><label><span data-toggle="tooltip"
                                                                       title="<?php echo $help_declarar_valor; ?>"><?php echo $entry_declarar_valor; ?></span></label>
                                    </td>
                                    <td class="text-left"><label><span data-toggle="tooltip"
                                                                       title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
                                    </td>
                                    <td class="text-left"><label><span data-toggle="tooltip"
                                                                       title="<?php echo $help_prazo_adicional; ?>"><?php echo $entry_prazo_adicional; ?></span></label>
                                    </td>
                                    <td class="text-left"><label><span data-toggle="tooltip"
                                                                       title="<?php echo $help_adicional; ?>"><?php echo $entry_adicional; ?></span></label>
                                    </td>
                                    <td></td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php $servico_row = 0; ?>
                                <?php foreach ($correios_servicos as $servico_info) { ?>
                                <tr id="servico-row<?php echo $servico_row; ?>">
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][codigo]"
                                                                 value="<?php echo $servico_info['codigo']; ?>"
                                                                 class="form-control" style="width:80px"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][nome]"
                                                                 value="<?php echo $servico_info['nome']; ?>"
                                                                 class="form-control"/></td>

                                    <td class="text-left">
                                        <select name="shipping_correios_servicos[<?php echo $servico_row; ?>][a_cobrar]"
                                                class="form-control" style="width:50px; padding:8px 0;">
                                            <?php if ($servico_info['a_cobrar']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                            <option value="0"><?php echo $text_no; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_yes; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                            <?php } ?>
                                        </select>
                                    </td>

                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][postcode]"
                                                                 value="<?php echo $servico_info['postcode']; ?>"
                                                                 class="form-control" style="width:90px"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][contrato_codigo]"
                                                                 value="<?php echo $servico_info['contrato_codigo']; ?>"
                                                                 class="form-control"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][contrato_senha]"
                                                                 value="<?php echo $servico_info['contrato_senha']; ?>"
                                                                 class="form-control"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][max_declarado]"
                                                                 value="<?php echo $servico_info['max_declarado']; ?>"
                                                                 class="form-control" style="width:80px"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][min_declarado]"
                                                                 value="<?php echo $servico_info['min_declarado']; ?>"
                                                                 class="form-control" style="width:80px"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][max_soma_lados]"
                                                                 value="<?php echo $servico_info['max_soma_lados']; ?>"
                                                                 class="form-control" style="width:50px"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][min_soma_lados]"
                                                                 value="<?php echo $servico_info['min_soma_lados']; ?>"
                                                                 class="form-control" style="width:50px"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][max_lado]"
                                                                 value="<?php echo $servico_info['max_lado']; ?>"
                                                                 class="form-control" style="width:50px"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][max_peso]"
                                                                 value="<?php echo $servico_info['max_peso']; ?>"
                                                                 class="form-control" style="width:50px"/></td>

                                    <td class="text-left">
                                        <select name="shipping_correios_servicos[<?php echo $servico_row; ?>][mao_propria]"
                                                class="form-control" style="width:50px; padding:8px 0;">
                                            <?php if ($servico_info['mao_propria']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                            <option value="0"><?php echo $text_no; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_yes; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                            <?php } ?>
                                        </select>
                                    </td>
                                    <td class="text-left">
                                        <select name="shipping_correios_servicos[<?php echo $servico_row; ?>][aviso_recebimento]"
                                                class="form-control" style="width:50px; padding:8px 0;">
                                            <?php if ($servico_info['aviso_recebimento']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                            <option value="0"><?php echo $text_no; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_yes; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                            <?php } ?>
                                        </select>
                                    </td>
                                    <td class="text-left">
                                        <select name="shipping_correios_servicos[<?php echo $servico_row; ?>][declarar_valor]"
                                                class="form-control" style="width:50px; padding:8px 0;">
                                            <?php if ($servico_info['declarar_valor']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                            <option value="0"><?php echo $text_no; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_yes; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                            <?php } ?>
                                        </select>
                                    </td>

                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][total]"
                                                                 value="<?php echo $servico_info['total']; ?>"
                                                                 class="form-control" style="width:80px"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][prazo_adicional]"
                                                                 value="<?php echo $servico_info['prazo_adicional']; ?>"
                                                                 class="form-control" style="width:50px"/></td>
                                    <td class="text-left"><input type="text"
                                                                 name="shipping_correios_servicos[<?php echo $servico_row; ?>][adicional]"
                                                                 value="<?php echo $servico_info['adicional']; ?>"
                                                                 class="form-control" style="width:50px"/></td>
                                    <td class="text-left">
                                        <button type="button"
                                                onclick="$('#servico-row<?php echo $servico_row; ?>').remove();"
                                                data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                                                class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                                    </td>
                                </tr>
                                <?php $servico_row++; ?>
                                <?php } ?>
                                </tbody>
                                <tfoot>
                                <tr>

                                    <td colspan="0" class="text-right">
                                        <button type="button" onclick="addServico();" data-toggle="tooltip"
                                                title="<?php echo $button_add_servico; ?>" class="btn btn-primary"><i
                                                    class="fa fa-plus-circle"></i></button>
                                    </td>
                                    <td colspan="18"></td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="tab-pane " id="tab-status">
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-tax-class"><?php echo $entry_tax_class; ?></label>
                                <div class="col-sm-10">
                                    <select name="shipping_correios_tax_class_id" id="input-tax-class" class="form-control">
                                        <option value="0"><?php echo $text_none; ?></option>
                                        <?php foreach ($tax_classes as $tax_class) { ?>
                                        <?php if ($tax_class['tax_class_id'] == $correios_tax_class_id) { ?>
                                        <option value="<?php echo $tax_class['tax_class_id']; ?>"
                                                selected="selected"><?php echo $tax_class['title']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
                                <div class="col-sm-10">
                                    <select name="shipping_correios_geo_zone_id" id="input-geo-zone" class="form-control">
                                        <option value="0"><?php echo $text_all_zones; ?></option>
                                        <?php foreach ($geo_zones as $geo_zone) { ?>
                                        <?php if ($geo_zone['geo_zone_id'] == $correios_geo_zone_id) { ?>
                                        <option value="<?php echo $geo_zone['geo_zone_id']; ?>"
                                                selected="selected"><?php echo $geo_zone['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="shipping_correios_status" id="input-status" class="form-control">
                                        <?php if ($correios_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"
                                       for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="shipping_correios_sort_order"
                                           value="<?php echo $correios_sort_order; ?>"
                                           placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order"
                                           class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
    var servico_row =<?php echo $servico_row;?>;

    function addServico() {
        html = '<tr id="servico-row' + servico_row + '">';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][codigo]" value="" class="form-control" style="width:80px" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][nome]" value="" class="form-control" /></td>';
        html += '  <td class="text-left">';
        html += '  <select name="shipping_correios_servicos[' + servico_row + '][a_cobrar]" class="form-control" style="width:50px; padding:8px 0;">';
        html += '  <option value="0"><?php echo $text_no; ?></option>';
        html += '  <option value="1"><?php echo $text_yes; ?></option>';
        html += '  </select>';
        html += '  </td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][postcode]" value="" class="form-control" style="width:90px" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][contrato_codigo]" value="" class="form-control" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][contrato_senha]" value="" class="form-control" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][max_declarado]" value="3000" class="form-control" style="width:80px" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][min_declarado]" value="18" class="form-control" style="width:80px" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][max_soma_lados]" value="200" class="form-control" style="width:50px" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][min_soma_lados]" value="29" class="form-control" style="width:50px" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][max_lado]" value="105" class="form-control" style="width:50px" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][max_peso]" value="30" class="form-control" style="width:50px" /></td>';

        html += '  <td class="text-left">';
        html += '  <select name="shipping_correios_servicos[' + servico_row + '][mao_propria]" class="form-control" style="width:50px; padding:8px 0;">';
        html += '  <option value="0"><?php echo $text_no; ?></option>';
        html += '  <option value="1"><?php echo $text_yes; ?></option>';
        html += '  </select>';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <select name="shipping_correios_servicos[' + servico_row + '][aviso_recebimento]" class="form-control" style="width:50px; padding:8px 0;">';
        html += '  <option value="0"><?php echo $text_no; ?></option>';
        html += '  <option value="1"><?php echo $text_yes; ?></option>';
        html += '  </select>';
        html += '  </td>';
        html += '  <td class="text-left">';
        html += '  <select name="shipping_correios_servicos[' + servico_row + '][declarar_valor]" class="form-control" style="width:50px; padding:8px 0;">';
        html += '  <option value="0"><?php echo $text_no; ?></option>';
        html += '  <option value="1"><?php echo $text_yes; ?></option>';
        html += '  </select>';
        html += '  </td>';

        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][total]" value="" class="form-control" style="width:80px"/></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][prazo_adicional]" value="" class="form-control" style="width:50px" /></td>';
        html += '  <td class="text-left"><input type="text" name="shipping_correios_servicos[' + servico_row + '][adicional]" value="" class="form-control" style="width:50px" /></td>';

        html += '  <td class="text-left"><button type="button" onclick="$(\'#servico-row' + servico_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#servicos tbody').append(html);

        servico_row++;
    }

    //--></script>
<?php echo $footer; ?>
