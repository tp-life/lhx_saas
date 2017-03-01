var trade_id;
var spec_index = 1;
var value_obj = {};
$(function () {
    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    }).on('ifChecked', function (event) {
        var status = $('input[name="spec_type"]:checked').val();
        if (status == 1) {
            $('#show_more_spec').addClass('hide');
            $('#show_spec').removeClass('hide');
            $('.more_spec').addClass('hide');
            $('#show_more_goods').addClass('hide');
        } else if (status == 2) {
            $('#show_spec').addClass('hide');
            $('#show_more_spec').removeClass('hide');
            $('.more_spec').removeClass('hide');
            $('#show_more_goods').removeClass('hide');
        }
    });

    $('.i-box-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    }).on('ifChecked', function (event) {
        var obj = $(this).parents('.i-box-checks').find('.show_spec_val').children('span');
        var spec = obj.text();
        spec_edit(spec, obj);
        groupGoods();
    }).on('ifUnchecked', function (event) {
        var obj = $(this).parents('.i-box-checks').find('.show_spec_val').children('input');
        complate_spec(obj);
        groupGoods();
    });


    //编辑器
    UE.getEditor('goods_content');


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

    //多规格选择
    $('#spec').on('change', function () {
        var spec = $(this).val();
        if ($('input[name="spec_type"]:checked').val() != 2) {
            return false;
        }
        if (!spec) {
            return false;
        }
        if (spec == 'add') {
            trade_id = $('#class_ids').val();
            $('#myModal').modal({
                keyboard: false,
                remote: createSpecUrl + '?trade_id=' + trade_id
            })
            return true;
        }
        $.post(moreSpecUrl, {_token: $('meta[name="_token"]').attr('content'), id: spec}, function (data) {
            if (data.status == 1) {
                moreTrade(data.data);
            } else {
                showToastr('error', data.msg);
            }
        });
    })

    $('#myModal').on('hidden.bs.modal', function (e) {
        document.getElementById("sepc_form").reset();
        $('#spec_createAttrBody').html('');
        $(this).removeData("bs.modal");
    })

    var setting = {
        check: {
            enable: true,
            chkStyle: "radio",
            radioType: "all"
        },
        view: {
            dblClickExpand: false
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onCheck: checkGate,
            onClick: onClick
        }
    };

    //商品分类
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);

    $('div[data-uploadr="up_img"]').each(function () {
        var cl = $(this).attr('class');
        var size = $(this).attr('data-size');
        uploaderButton('.' + cl, size);
    })

})

//分类树回调处理选择数据
function checkGate(event, treeId, treeNode) {
    var name = id = '';
    if (treeNode.checked) {
        name = treeNode.name;
        id = treeNode.f_id + '@' + treeNode.f_name;
    }
    $('#citySel').val(name);
    $('#hiddenSp').val(id);
}


//动态上传图片组件
function uploaderButton(button, mom) {
    button = button || false;
    if (!button) {
        return false;
    }
    WebUploader.create(Object.assign(uploadConfig, {pick: button})).on('uploadSuccess', function (file, response) {
        createImg(file, response, button, this, mom);
    });
}

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
                '<label><input type="checkbox" class="spec_real_val" name="spec_val[' + i + '][' + j + ']" data-index="' + i + '" data-key="' + j + '"  value="' + spec_val[j] + '"></label>&nbsp;&nbsp;<span class="show_spec_val" ><span ondblclick="spec_edit(\'' + spec_val[j] + '\',this)">' + spec_val[j] + '</span></span> ' +
                '</div></div>';
        }
        html += '</div></div><div class="hr-line-dashed"></div>';
    }
    html += '</div>';
    $('#show_more_spec').html(html);
    $('.i-box-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    }).on('ifChecked', function (event) {
        var obj = $(this).parents('.i-box-checks').find('.show_spec_val').children('span');
        var spec = obj.text();
        spec_edit(spec, obj);
        groupGoods();
    }).on('ifUnchecked', function (event) {
        var obj = $(this).parents('.i-box-checks').find('.show_spec_val').children('input');
        complate_spec(obj);
        groupGoods();
    });
}

//重新渲染多规格表格
function groupGoods() {
    var spec = [];
    $('.spec_real_val:checked').each(function () {
        var index = $(this).attr('data-index');
        var key = $(this).attr('data-key');
        var val = index + '-' + key + '-' + $(this).val();
        typeof spec[index] == 'object' ? spec[index].push(val) : spec[index] = [val];
    });
    for (var i = 0; i < spec.length; i++) {
        if (!spec[i]) {
            spec.splice(i, 1);
        }
    }
    spec = spec.length < 2 ? handleOne(spec) : mergeArr(spec);
    var size = spec.length;
    var html = '';
    $('#spec_createMoreAttrBody tr').each(function () {
        var key = $(this).find('.tr_spec').attr('data-index');
        var index = $(this).attr('data-index');
        var spec_val = $(this).find('.tr_spec').val();
        var spec_num = $(this).find('.tr_num').val();
        var spec_price = $(this).find('.tr_price').val();
        var pic = $(this).find('.good_spec_pic').attr('data-img');
        var cell_id = $(this).find('.cell_ids').val();
        var price = [];
        $(this).find('.good_leavel_map').each(function () {
            price.push({
                num: $(this).find('.tr_le_num').val(),
                price: $(this).find('.tr_le_price').val()
            })
        });
        value_obj[key] = {
            key: key,
            spec_val: spec_val,
            spec_num: spec_num,
            spec_price: spec_price,
            pic: pic,
            leve_price: price,
            cell_id: cell_id
        };
    });

    var up_button = [];
    for (var i = 0; i < size; i++) {
        var len = spec[i].length;
        var v_text = [];
        var v_index = [];
        for (var j = 0; j < len; j++) {
            var temp = spec[i][j].split('-');
            v_index.push(temp[0] + '-' + temp[1]);
            v_text.push(temp[2]);
        }
        up_button.push('.spec_more_uploader' + spec_index);
        var k = v_index.join('@');
        var v = getVal(value_obj, k);
        var spec_v = v_text.join(' + ');
        var spec_n = '',
            spec_p = '',
            img = '',
            cell_html = '';
        if (v) {
            spec_n = v.spec_num;
            spec_p = v.spec_price;
            if (v.pic) {
                img += '<span style="position: absolute; left: 1px; top: 1px">' +
                    '<img src="' + v.pic + '" style="height: 96px;width: 96px"/>' +
                    '<input type="hidden" name="one_pic[' + spec_index + ']" value="' + v.pic + '"/>' +
                    '</span>'
            }
            if (v.cell_id) {
                cell_html += '<input type="hidden" name="cell_ids[' + spec_index + ']" value="' + v.cell_id + '">';
            }
        }
        html += '<tr class="spec_more_show_row" data-index="' + spec_index + '">' +
            '<td align="center" style="vertical-align:middle;">' + cell_html +
            '<div class="good_pic" >' + img +
            '<div class="spec_more_uploader' + spec_index + ' good_spec_pic" data-name="one_pic[' + spec_index + ']" data-uploadr="up_img" style="height: 100%"></div>' +
            '</div>' +
            '</td>' +
            '<td style="vertical-align:middle;" >' +
            '<input  type="text" readonly value="' + spec_v + '" data-index="' + k + '" class="form-control tr_spec">' +
            '<input type="hidden"  name="more_spec[' + spec_index + ']" value="' + spec_v + ',' + k + '" > ' +
            '</td>' +
            '<td style="vertical-align:middle;">' +
            '<input name="one_spec_num[' + spec_index + ']" value="' + spec_n + '" min="0" step="1" type="number" class="form-control tr_num">' +
            '</td>' +
            '<td style="vertical-align:middle;" class="level_price_con">';
        var is_level = $('.more_level_pric').get(0).checked;
        if (!is_level) {
            html += '<input name="one_spec_price[' + spec_index + ']" min="0.00" value="' + spec_p + '" type="number" class="form-control tr_price">';
        } else {
            html += getLevelDom(spec_index, v.leve_price);
        }
        html += '</td>' +
            '<td style="vertical-align:middle;">' +
            '<button type="button" class="btn btn-sm btn-warning" onclick="removeRow(this,\'.spec_more_show_row\')">删除</button>' +
            '</td>' +
            '</tr>';
        spec_index++;
    }
    $('#spec_createMoreAttrBody').html(html);
    $('#show_more_goods').removeClass('hide');
    $.each(up_button, function (index, val) {
        uploaderButton(val, 0.625);
    });
    return spec;
}


//多规格只有一个属性
function handleOne(arr) {
    if (arr.length < 1) return [];
    var spec = [];
    var len = arr[0].length;
    for (var i = 0; i < len; i++) {
        spec[i] = [arr[0][i]];
    }
    return spec;
}

//获取input 值
function getVal(obj, key) {
    return obj[key] ? obj[key] : '';
}

//多规格互相组合
function mergeArr(arr) {
    if (arr.length >= 2) {
        one = arr.shift();
        two = arr.shift();
        merge = [];
        var len1 = one.length;
        var len2 = two.length;
        for (var i = 0; i < len1; i++) {
            for (var j = 0; j < len2; j++) {
                var ind = merge.length;
                if (typeof one[i] == 'object') {
                    merge[ind] = one[i].concat([two[j]]);
                } else {
                    merge[ind] = [one[i], two[j]];
                }
            }
        }
        arr2 = [merge].concat(arr);
        return mergeArr(arr2);
    } else {
        return arr.shift();
    }
}


//规格编辑
function spec_edit(spec, obj) {
    var html = '<input type="text" class="form-control" style="display: inline;width: 70%" value="' + spec + '" onblur="complate_spec(this)">';
    $(obj).parent().html(html);
}

//完成编辑
function complate_spec(obj) {
    var sepc = $(obj).val();
    $(obj).parent().parent().find('.spec_real_val').val(sepc);
    var html = '<span ondblclick="spec_edit(\'' + sepc + '\',this)">' + sepc + '</span>';
    $(obj).parent().html(html);
    groupGoods();
}

//获取行业ID
function getTrade() {
    return trade_id;
}


//图片上传预览图片
function createImg(file, response, elem, uploader, mom) {
    mom = mom || 1;
    var size = 160 * mom - 4;
    if (response.result) {
        var name = $(elem).attr('data-name');
        $(elem).attr('data-img', response.result);
        $(elem).prev().remove();
        $(elem).before('<span style="position: absolute; left: 1px; top: 1px">' +
            '<img src="' + response.result + '" style="height: ' + size + 'px;width: ' + size + 'px"/>' +
            '<input type="hidden" name="' + name + '" value="' + response.result + '"/>' +
            '</span>');
        uploader.removeFile(file);
    } else {
        showToastr('error', response.error.message);
    }
}


function onClick(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
    zTree.checkNode(treeNode, !treeNode.checked, null, true);
    return false;
}


function showMenu() {
    var cityObj = $("#citySel");
    var cityOffset = $("#citySel").offset();
    $("#menuContent").slideDown("fast");
    $("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
    $("#menuContent").fadeOut("fast");
    $("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
    if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
        hideMenu();
    }
}

//单规格添加规格
function spec_createOneAttr() {

    var html = '<tr class="spec_one_show_row" data-index="' + spec_index + '">' +
        '<td align="center" style="vertical-align:middle;">' +
        '<div class="good_pic" >' +
        '<div class="spec_one_uploader_' + spec_index + ' " data-name="one_pic[' + spec_index + ']" data-uploadr="up_img" style="height: 100%"></div>' +
        '</div>' +
        '</td>' +
        '<td style="vertical-align:middle;" >' +
        '<input name="one_spec[' + spec_index + ']" type="text" class="form-control">' +
        '</td>' +
        '<td style="vertical-align:middle;">' +
        '<input name="one_spec_num[' + spec_index + ']" min="0" step="1" type="number" class="form-control">' +
        '</td><td style="vertical-align:middle;" class="level_price_con">';
    var is_level = $('.one_level_pric').get(0).checked;
    if (!is_level) {
        html += '<input name="one_spec_price[' + spec_index + ']" min="0.00" type="number" class="form-control">';
    } else {
        html += getLevelDom(spec_index);
    }
    html += '</td><td style="vertical-align:middle;">' +
        '<button type="button" class="btn btn-sm btn-warning" onclick="removeRow(this)">删除</button>' +
        '</td>' +
        '</tr>';
    $('#spec_createOneAttrBody').append(html);
    uploaderButton('.spec_one_uploader_' + spec_index, 0.625);
    spec_index++;
}


function removeRow(obj, className) {
    className = className || '.spec_one_show_row';
    $(obj).parents(className).remove();
}

//阶梯定价
function levelPrice(obj, status, name) {
    name = name || 'one_spec_price';

    if (status) {
        $(obj + ' tr').each(function () {
            var index = $(this).attr('data-index');
            var tr_price = $(this).find('.tr_price').val();
            var l_price = value_obj[index] ? value_obj[index].leve_price : []
            value_obj[index] = value_obj[index] || {};
            value_obj[index] = Object.assign(value_obj[index], {
                leve_price: l_price,
                tr_price: tr_price
            });
            var html = getLevelDom(index, l_price);
            $(this).find('.level_price_con').html(html);
        })
    } else {
        $(obj + ' tr').each(function () {
            var index = $(this).attr('data-index');
            var price = [];
            var tr_price = value_obj[index] ? value_obj[index].tr_price : ''
            $(this).find('.good_leavel_map').each(function () {
                price.push({
                    num: $(this).find('.tr_le_num').val(),
                    price: $(this).find('.tr_le_price').val()
                })
            });
            value_obj[index] = value_obj[index] || {};
            value_obj[index] = Object.assign(value_obj[index], {
                leve_price: price,
                tr_price: tr_price
            });
            var html = '<input name="' + name + '[' + index + ']" value="' + tr_price + '" min="0.00"  type="number" class="form-control tr_price">';
            $(this).find('.level_price_con').html(html);
        })
    }

}

//阶梯定价Dom
function getLevelDom(index, p) {
    p = p || [];
    var html = '<div class="col-sm-12 ">';
    for (var i = 0; i < 4; i++) {
        html += '<div class="form-group"><div class="col-sm-10 good_leavel_map">' +
            '<label>满&nbsp;</label>' +
            '<input type="number" class="form-control tr_le_num" value="' + (p[i] ? p[i].num : '') + '"  min="0" step="1" style="display: inline;width: 35%" name="level_goods_num[' + index + '][]">' +
            '<label>&nbsp;件，售价&nbsp;</label>' +
            '<input type="number" class="form-control tr_le_price" min="0.00"  value="' + (p[i] ? p[i].price : '') + '" style="display: inline;width: 35%" name="level_goods_pric[' + index + '][]">' +
            '<label>&nbsp;元</label>' +
            '</div></div><div class="hr-line-dashed"></div>';
    }
    html += '</div>';
    return html;
}

