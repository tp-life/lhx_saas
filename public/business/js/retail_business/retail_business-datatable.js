var TableDatatablesAjax = function () {
    var datatableAjax = function () {
        dt = $('.dataTablesAjax');
        ajax_datatable = dt.DataTable({
            "processing": true,
            "serverSide": true,
            "searching": false,
            //"iDisplayLength" : 1,
            "searchDelay": 800,
            "search": {
                "regex": true
            },
            ordering:false,
            "ajax": {
                'url': '/business/retail_business/ajaxIndex',
                data: function (param) {
                    var da = $('#searchForm').serializeArray();
                    for (var i in da) {
                        param[da[i]['name']] = da[i]['value'];
                    }
                    da = $('#searchForm2').serializeArray();
                    for (var i in da) {
                        param[da[i]['name']] = da[i]['value'];
                    }
                }
            },
            "initComplete": function (settings, json) {
                var filter_html =
                    '<div id="DataTables_Table_0_filter" class="dataTables_filter " >' +
                    '<form id="searchForm">' +
                    '<select name="search_type" class="form-control form-filter">' +
                    '<option value="account_name">商家主账号</option>' +
                    '<option value="phone">联系电话</option>' +
                    '<option value="business_name">商家名称</option>' +
                    '</select>' +
                    '<input type="text" name="keyword" placeholder="关键词" class="form-control form-filter" style="vertical-align:top">' +
                    '<button type="button" class="btn btn-info" id="filter-button" style="padding:5px 12px;margin-right:5px;">查询</button>' +
                    '</form>' +
                    '</div>';
//注入查询框
                $("#DataTables_Table_0_length").after(filter_html);
                //批量操作html
                //var checkBox = '<div style="float: left; text-align: left;line-height: inherit"><label><input type="checkbox" class="allCheck" value="" />全选</label> &emsp;<a href="javascript:;" id="show1" onclick="submitCheckBox(1)">批量开通</a>&emsp;<a href="javascript:;" id="show2" onclick="submitCheckBox(2)">批量冻结</a></div>'
                //$('#DataTables_Table_0_paginate').after(checkBox);
//绑定查询按钮事件
                $("#filter-button").click(function () {
                    ajax_datatable.draw();//刷新数据
                });
            },
            "pagingType": "full_numbers",
            "orderCellsTop": true,
            "dom": '<"html5buttons"B>lTfgitp',
            "buttons": [
                {extend: 'copy', title: 'retail_business'},
                {extend: 'csv', title: 'retail_business'},
                {extend: 'excel', title: 'retail_business'},
                {extend: 'pdf', title: 'retail_business'},
                {
                    extend: 'print',
                    customize: function (win) {
                        $(win.document.body).addClass('white-bg');
                        $(win.document.body).css('font-size', '10px');
                        $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    }
                }
            ],
            "columns": [
                {
                    "data": "business_id",
                    "name": "business_id",
                    "orderable": false
                },
                {
                    "data": "business_name",
                    "name": "business_name",
                    "orderable": false
                },
                {
                    "data": "pca",
                    "name": "pca",
                    "orderable": false
                },
                {
                    "data": "level_name",
                    "name": "level_name",
                    "orderable": false
                },
                {
                    "data": "name",
                    "name": "name",
                    "orderable": false
                },
                {
                    "data": "phone",
                    "name": "phone",
                    "orderable": false
                },
                {
                    "data": "status_name",
                    "name": "status_name",
                    "orderable": false
                },
                {
                    "data": "actionButton",
                    "name": "actionButton",
                    "type": "html",
                    "orderable": false
                },
            ],
            "drawCallback": function (settings) {
                ajax_datatable.$('.tooltips').tooltip({
                    placement: 'top',
                    html: true
                });
            },
            "language": {
                url: '/admin/i18n'
            }
        });
        // 关闭modal清空内容
        $(".modal").on("hidden.bs.modal", function (e) {
            $(this).removeData("bs.modal");
        });
    };
    return {
        init: datatableAjax
    }
}();
$(function () {
    TableDatatablesAjax.init();
});