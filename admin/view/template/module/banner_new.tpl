<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table id="module" class="list">
                    <thead>
                    <tr>
                        <td class="left"><?php echo $entry_title; ?></td>
                        <td class="left"><?php echo $entry_description; ?></td>
                        <td class="left"><?php echo $entry_image; ?></td>
                        <td class="left"><span class="required">*</span> <?php echo $entry_dimension; ?></td>
                        <td class="left"><?php echo $entry_category; ?></td>
                        <td class="left"><?php echo $entry_layout; ?></td>
                        <td class="left"><?php echo $entry_position; ?></td>
                        <td class="left"><?php echo $entry_status; ?></td>
                        <td class="right"><?php echo $entry_sort_order; ?></td>
                        <td></td>
                    </tr>
                    </thead>
                    <?php $module_row = 0; ?>
                    <?php if ($modules) { ?>
                    <?php foreach ($modules as $module) { ?>
                    <tbody id="module-row<?php echo $module_row; ?>">
                    <tr>
                        <td class="left">
                            <input type="text" name="banner_new_module[<?php echo $module_row; ?>][title]" value="<?php echo $module['title']; ?>" size="15" />
                        </td>
                        <td class="left">
                            <textarea name="banner_new_module[<?php echo $module_row; ?>][description]" rows="5" cols="10" ><?php echo $module['description']; ?></textarea>
                        </td>
                        <td class="left">
                            <img src="<?php echo $module['thumb']; ?>" alt="" id="thumb<?php echo $module_row; ?>" />
                            <input type="hidden" name="banner_new_module[<?php echo $module_row; ?>][image]" value="<?php echo $module['image']; ?>" id="image<?php echo $module_row; ?>" />
                            <br/>
                            <a onclick="image_upload('image<?php echo $module_row; ?>', 'thumb<?php echo $module_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a onclick="$('#thumb<?php echo $module_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $module_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
                        </td>
                        <td class="left"><input type="text" name="banner_new_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" />
                            <input type="text" name="banner_new_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" />
                            <?php if (isset($error_image[$module_row])) { ?>
                            <span class="error"><?php echo $error_image[$module_row]; ?></span>
                            <?php } ?>
                        </td>

                        <td class="left">
                            <input id="category<?php echo $module_row; ?>" onfocus="auto_complete(<?php echo $module_row; ?>);" type="text" name="banner_new_module[<?php echo $module_row; ?>][category_name]" value="<?php echo $module['category_name']; ?>"/>
                            <input id="category-hidden<?php echo $module_row; ?>" type="hidden" name="banner_new_module[<?php echo $module_row; ?>][category_id]" value="<?php echo $module['category_id']; ?>"/>
                        </td>

                        <td class="left">
                            <select name="banner_new_module[<?php echo $module_row; ?>][layout_id]">
                                <?php foreach ($layouts as $layout) { ?>
                                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left">
                            <select name="banner_new_module[<?php echo $module_row; ?>][position]">
                                <?php if ($module['position'] == 'content_top') { ?>
                                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                                <?php } else { ?>
                                <option value="content_top"><?php echo $text_content_top; ?></option>
                                <?php } ?>
                                <?php if ($module['position'] == 'content_bottom') { ?>
                                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                                <?php } else { ?>
                                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                                <?php } ?>
                                <?php if ($module['position'] == 'column_left') { ?>
                                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                                <?php } else { ?>
                                <option value="column_left"><?php echo $text_column_left; ?></option>
                                <?php } ?>
                                <?php if ($module['position'] == 'column_right') { ?>
                                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                                <?php } else { ?>
                                <option value="column_right"><?php echo $text_column_right; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="left"><select name="banner_new_module[<?php echo $module_row; ?>][status]">
                                <?php if ($module['status']) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="right">
                            <input type="text" name="banner_new_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" />
                        </td>
                        <td class="left">
                            <a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a>
                        </td>
                    </tr>
                    </tbody>
                    <?php $module_row++; ?>
                    <?php } ?>
                    <?php } ?>
                    <tfoot>
                    <tr>
                        <td colspan="6"></td>
                        <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
                    </tr>
                    </tfoot>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
    var module_row = '<?php echo $module_row; ?>';

    function addModule() {
        html  = '<tbody id="module-row' + module_row + '">';
        html += '<tr>';
        html += '<td class="left">' +
                    '<input type="text" name="banner_new_module[' + module_row + '][title]" value="" size="15" />' +
                '</td>';
        html += '<td class="left">' +
                    '<textarea name="banner_new_module[' + module_row + '][description]" rows="5" cols="10" ></textarea>' +
                '</td>'
        html += '<td class="left">' +
                    '<img src="<?php echo $no_image; ?>" alt="" id="thumb' + module_row + '" />' +
                    '<input type="hidden" name="banner_new_module[' + module_row + '][image]" value="" id="image' + module_row + '" /><br />' +
                    '<a onclick="image_upload(\'image' + module_row + '\', \'thumb' + module_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;' +
                    '<a onclick="$(\'#thumb' + module_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + module_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a>' +
                '</td>';
        html += '<td class="left">' +
                    '<input type="text" name="banner_new_module[' + module_row + '][image_width]" value="80" size="3" />' +
                    '<input type="text" name="banner_new_module[' + module_row + '][image_height]" value="80" size="3" />' +
                '</td>';

        html += '<td class="left">' +
                    '<input id="category' + module_row + '" onfocus="auto_complete(' + module_row + ');"  name="banner_new_module[<?php echo $module_row; ?>][category_name]" type="text" />' +
                    '<input id="category-hidden'+ module_row +'" type="hidden" name="banner_new_module[' + module_row + '][category_id]" value="" />' +
                '</td>';

        html += '<td class="left"><select name="banner_new_module[' + module_row + '][layout_id]">';
                '<?php foreach ($layouts as $layout) { ?>'
                    html += '<option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
                '<?php } ?>'
        html += '</select></td>';
        html += '    <td class="left"><select name="banner_new_module[' + module_row + '][position]">';
        html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
        html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
        html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
        html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
        html += '    </select></td>';
        html += '    <td class="left"><select name="banner_new_module[' + module_row + '][status]">';
        html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
        html += '      <option value="0"><?php echo $text_disabled; ?></option>';
        html += '    </select></td>';
        html += '    <td class="right"><input type="text" name="banner_new_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
        html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
        html += '  </tr>';
        html += '</tbody>';

        $('#module tfoot').before(html);

        module_row++;
    }

    //--></script>
<script type="text/javascript"><!--

    //Image upload
    function image_upload(field, thumb) {
        $('#dialog').remove();

        $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

        $('#dialog').dialog({
            title: '<?php echo $text_image_manager; ?>',
            close: function (event, ui) {
                if ($('#' + field).attr('value')) {
                    $.ajax({
                        url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
                        dataType: 'text',
                        success: function(text) {
                            $('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
                        }
                    });
                }
            },
            bgiframe: false,
            width: 800,
            height: 400,
            resizable: false,
            modal: false
        });
    };
    //--></script>

<script type="text/javascript"><!--

    //Autocomplete

function auto_complete (module_row) {
    $('#category' + module_row).autocomplete({
        delay: 500,
        source: function (request, response) {
            //Category
            $.ajax({
                url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function (json) {
                    response($.map(json, function (item) {
                        $('#category-hidden' + module_row).val(item.category_id);
                        return {
                            label: item.name,
                            value: item.name
                        }
                    }));
                }
            });
            //Product
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function (json) {
                    response($.map(json, function (item) {
                        $('#category-hidden' + module_row).val(item.product_id);
                        return {
                            label: item.name,
                            value: item.name
                        }
                    }));
                }
            });
            //Manufacturer
            $.ajax({
                url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
                dataType: 'json',
                success: function (json) {
                    response($.map(json, function (item) {
                        $('#category-hidden' + module_row).val(item.manufacturer_id);
                        return {
                            label: item.name,
                            value: item.name
                        }
                    }));
                }
            });
        }
    });
}

    //--></script>

<?php echo $footer; ?>