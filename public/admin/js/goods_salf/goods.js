$(function () {
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    }).on('ifChecked', function (event) {
        var status = $('input[name="spec_type"]:checked').val();
        if (status == 1) {
            $('#show_more_spec').addClass('hide');
            $('#show_spec').removeClass('hide')
            $('.more_spec').addClass('hide')
        } else if (status == 2) {
            $('#show_spec').addClass('hide');
            $('#show_more_spec').removeClass('hide')
            $('.more_spec').removeClass('hide')
        }
    });

    $('.i-box-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    })


    //编辑器
    UE.getEditor('goods_content');
    //上传组件
    WebUploader.create(Object.assign(uploadConfig, {pick: '.uploader_1'})).on('uploadSuccess', function (file, response) {
        createImg(file, response, '.uploader_1', this);
    });

    WebUploader.create(Object.assign(uploadConfig, {pick: '.uploader_2'})).on('uploadSuccess', function (file, response) {
        createImg(file, response, '.uploader_2', this);
    });
    WebUploader.create(Object.assign(uploadConfig, {pick: '.uploader_3'})).on('uploadSuccess', function (file, response) {
        createImg(file, response, '.uploader_3', this);
    });
    WebUploader.create(Object.assign(uploadConfig, {pick: '.uploader_4'})).on('uploadSuccess', function (file, response) {
        createImg(file, response, '.uploader_4', this);
    });
    WebUploader.create(Object.assign(uploadConfig, {pick: '.uploader_5'})).on('uploadSuccess', function (file, response) {
        createImg(file, response, '.uploader_5', this);
    });

    var up = $('.webuploader-pick').next();
    $('.webuploader-pick').css({width: '100%', height: '100%', background: 'rgba(255,255,255,.15)'})
    $('.webuploader-pick-hover').css({background: 'rgba(255,255,255,.15)'})
    up.each(function (index, ele) {
        $(this).css({width: '100%', height: '100%'});
    })

    //提交表单
    $("#demo_form").submit(function () {
        $(this).ajaxSubmit(function (e) {
            if (e.status == 1) {
                showToastr('success', e.msg);
                setTimeout(function () {
                    window.location.href = goodsIndex;
                }, 1500);
            } else {
                showToastr('error', e.msg);
            }
        });
        return false;
    });

    $('#spec').on('change', function () {
        var spec = $(this).val();
        if ($('input[name="spec_type"]:checked').val() != 2) {
            return false;
        }
        if (!spec) {
            return false;
        }
        if (spec == 'add') {
            $('#myModal').modal({
                keyboard: false,
                remote:createSpecUrl
            })
            return true;
        }
        $.post(moreSpecUrl,{_token: $('meta[name="_token"]').attr('content'), id: spec},function(data){
            if(data.status == 1){
                moreTrade(data.data);
            }else{
                showToastr('error',data.msg);
            }
        });
    })

    $('#myModal').on('hidden.bs.modal', function (e) {
        document.getElementById("sepc_form").reset();
        $('#spec_createAttrBody').html('');
    })

})

//新增多规格返回数据
function moreTrade(data) {
    if (!(data instanceof Array)) {
        return false;
    }

    var html = '<div class="alert alert-success ">';
    for (var i = 0; i < data.length; i++) {
        html += '<div class="form-group">' +
            '<label  class="col-sm-1 control-label">' + data[i].attribute_name + '</label><input type="hidden" name="spec_attr[' + i + ']" value="' + data[i].attribute_name + '">' +
            '<div class="col-sm-10"> ';
        var spec_val = data[i].attribute_value.split(',');
        for (var j = 0; j < spec_val.length; j++) {
            html += '<div class="col-sm-2">' +
                '<div class="i-box-checks">' +
                '<label><input type="checkbox" class="spec_real_val" name="spec_val[' + i + ']['+j+']"  value="' + spec_val[j] + '"></label>&nbsp;&nbsp;<span class="show_spec_val" ><span ondblclick="spec_edit(\'' + spec_val[j] + '\',this)">' + spec_val[j] + '</span></span> ' +
                '</div></div>';
        }
        html += '</div></div><div class="hr-line-dashed"></div>';
    }
    html+='</div>';
    $('#show_more_spec').html(html);
    $('.i-box-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    })
}


function spec_edit(spec, obj) {
    var html = '<input type="text" class="form-control" style="display: inline;width: 80%" value="' + spec + '" onblur="complate_spec(this)">';
    $(obj).parent().html(html);
}

function complate_spec( obj) {
    var sepc =obj.value;
    $(obj).parent().parent().find('.spec_real_val').val(sepc);
    var html = '<span ondblclick="spec_edit(\'' + sepc + '\',this)">' + sepc + '</span>';
    $(obj).parent().html(html);
}

//图片上传预览图片
function createImg(file, response, elem, uploader) {
    if (response.result) {
        $(elem).prev().remove();
        $(elem).before('<span style="position: absolute; left: 1px; top: 1px">' +
            '<img src="' + response.result + '" style="height: 156px;width: 157px"/>' +
            '<input type="hidden" name="pic[]" value="' + response.result + '"/>' +
            '</span>');
        uploader.removeFile(file);
    } else {
        showToastr('error', response.error.message);
    }
}

//创建单规格属性
function createAttrVal(dom, event, blur) {
    if (event.keyCode == 9 || event.keyCode == 13 || blur) {
        var value = $(dom).val();
        if (value) {
            var show_box = $(dom).parents('.attr_val_box').nextAll('.show_attr');
            var html = '<span class="show_label_row"><input type="hidden" name="attr_val[]" value="' + value + '">' +
                '<button class="btn btn-primary" type="button" style="margin: 0 10px 8px 0"> ' + value +
                '&nbsp;&nbsp;<span onclick="removeRow(this,\'.show_label_row\')"> <i class="fa fa-close"></i></span>' +
                '</button></span>';
            show_box.append(html);
            $(dom).val('');
        }
        event.preventDefault();
    }
}

//删除规格
function removeRow(dom, show) {
    var obj = $(dom).parents(show);
    obj.remove();
}

//选择行业
function selectTrade(val) {
    if (val) {
        $.post(createDataUrl, {_token: $('meta[name="_token"]').attr('content'), trade_id: val}, function (data) {
            if (data.status == 1) {
                var brand_html = '<option value="">请选择商品品牌</option>',
                    unit_html = '<option value="">请选择商品单位</option>',
                    spec_html = '<option value="">选择多规格模板</option>';
                var result = data.data;
                for (var i = 0; i < result.brand.length; i++) {
                    brand_html += '<option value="' + result.brand[i].id + ',' + result.brand[i].brand_name + '">' + result.brand[i].brand_name + '</option>';
                }
                for (var i = 0; i < result.unit.length; i++) {
                    unit_html += '<option value="' + result.unit[i].name + '">' + result.unit[i].name + '</option>';
                }
                for (var i = 0; i < result.spec.length; i++) {
                    spec_html += '<option value="' + result.spec[i].id + '">' + result.spec[i].title + '</option>';
                }
                spec_html += '<option value="add">添加多规格模板</option>';
                $('#brand_id').html(brand_html);
                $('#unit').html(unit_html);
                $('#spec').html(spec_html);
            }
        });
    }
}