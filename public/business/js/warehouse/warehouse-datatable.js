var TableDatatablesAjax = function () {
    var datatableAjax = function () {
        dt = $('.dataTablesAjax');
        params = {'_token': $('meta[name="_token"]').attr('content')};
        ajax_datatable = dt.DataTable({
            "processing": true,
            "serverSide": true,
            "searching": true,
            "searchDelay": 800,
            "search": {
                "regex": true
            },
            "ajax": {
                'url': '/business/warehouse/getdata',
                type: 'POST',
                data: function (param) {
                    var data = Object.assign(param, params);
                    return data;
                }
            },
            ordering: false,
            "pagingType": "full_numbers",
            "dom": '<"html5buttons"B>lTfgitp',
            "buttons": [
                {extend: 'copy', title: '仓库中的商品'},
                {extend: 'csv', title: '仓库中的商品'},
                {extend: 'excel', title: '仓库中的商品'},
                {extend: 'pdf', title: '仓库中的商品'},
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
                    "data": "ck",
                    "name": "ck",
                    "orderable": false,
                },
                {
                    "data": "name",
                    "name": "name",
                    "orderable": false,
                },
                {
                    "data": "brand",
                    "name": "brand",
                    "orderable": false,
                },
                {
                    "data": "price",
                    "name": "price",
                    "orderable": false,
                },
                {
                    "data": "sales_number",
                    "name": "sales_number",
                    "orderable": false,
                },
                {
                    "data": "goods_store",
                    "name": "goods_store",
                    "orderable": false,
                },
                {
                    "data": "action",
                    "name": "action",
                    "type": "html",
                    "orderable": false,
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
        }).on('init.dt', function () {
            $('<select name="orderby" class="form-control form-filter" style="margin-right: 8px;">' +
                '<option value="">排序方式</option>' +
                '<option value="time_little">上架时间由近到远</option>' +
                '<option value="time_many">上架时间由远到近</option>' +
                '<option value="salf_many">销售数量由多到少</option>' +
                '<option value="salf_little">销售数量由少到多</option>' +
                '</select>').prependTo('#DataTables_Table_0_filter').on('change', function () {
                var val = $.fn.dataTable.util.escapeRegex(
                    $(this).val()
                );
                params.orderby = val;
                ajax_datatable.draw();
            });

        });
        ;

    };
    return {
        init: datatableAjax
    }
}();
$(function () {
    TableDatatablesAjax.init();
});