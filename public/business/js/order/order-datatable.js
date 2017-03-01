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
                'url': '/business/order/getdata',
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
                    '<option value="order_sn">订单编号</option>' +
                    '<option value="retail_business_name">客户名称</option>' +
                    '</select>' +
                    '<input type="text" name="keyword" placeholder="关键词" class="form-control form-filter" style="vertical-align:top">' +
                    '<button type="button" class="btn btn-info" id="filter-button" style="padding:5px 12px;margin-right:5px;">查询</button>' +
                    '</form>' +
                    '</div>';
//注入查询框
                $("#DataTables_Table_0_length").after(filter_html);
                $("#filter-button").click(function () {
                    ajax_datatable.draw();//刷新数据
                });
            },
            "pagingType": "full_numbers",
            "orderCellsTop": true,
            "dom": '<"html5buttons"B>lTfgitp',
            "buttons": [
                {extend: 'copy', title: 'order'},
                {extend: 'csv', title: 'order'},
                {extend: 'excel', title: 'order'},
                {extend: 'pdf', title: 'order'},
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
                    "data": "order_sn",
                    "name": "order_sn",
                    "orderable": false
                },
                {
                    "data": "retail_business_name",
                    "name": "retail_business_name",
                    "orderable": false
                },
                {
                    "data": "order_amount",
                    "name": "order_amount",
                    "orderable": false
                },
                {
                    "data": "pay_state",
                    "name": "pay_state",
                    "orderable": false
                },
                {
                    "data": "order_state",
                    "name": "order_state",
                    "orderable": false
                },
                {
                    "data": "created_at",
                    "name": "created_at",
                    "orderable": false
                },
                {
                    "data": "action",
                    "name": "action",
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