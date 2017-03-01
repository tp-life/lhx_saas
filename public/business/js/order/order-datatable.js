var TableDatatablesAjax = function() {
    var datatableAjax = function(){
        dt = $('.dataTablesAjax');
        params={ '_token':$('meta[name="_token"]').attr('content')};
        ajax_datatable = dt.DataTable({
            "processing": true,
            "serverSide": true,
            "searching" : true,
            "searchDelay": 800,
            "search": {
                "regex": true
            },
            "ajax": {
                'url' : '/business/order/getdata',
                type:'POST',
                data:function(param){
                    var data = Object.assign(param,params);
                    return data;
                }
            },
            'ordering':false,
                "pagingType": "full_numbers",
            "dom" : '<"html5buttons"B>lTfgitp',
            "buttons": [
                {extend: 'copy',title: '复制'},
                {extend: 'csv',title: '导出订单'},
                {extend: 'excel', title: '导出订单'},
                {extend: 'pdf', title: '导出订单'},
                {extend: 'print',
                    customize: function (win){
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
                    "orderable" : false
                },
                {
                    "data": "buyer_name",
                    "name": "buyer_name",
                    "orderable" : false
                },
                {
                    "data": "order_amount",
                    "name": "order_amount",
                    "orderable" : false
                },
                {
                    "data": "pay_status_text",
                    "name": "pay_status_text",
                    "orderable" : false
                },
                {
                    "data": "status_text",
                    "name": "status_text",
                    "orderable" : false
                },
                {
                    "data": "created_at",
                    "name": "created_at",
                    "orderable" : false
                },
                {
                    "data": "action",
                    "name": "action",
                    "type": "html",
                    "orderable" : false
                }
            ],
            "drawCallback": function( settings ) {
                ajax_datatable.$('.tooltips').tooltip( {
                    placement : 'top',
                    html : true
                });
            },
            "language": {
                url: '/admin/i18n'
            }
        })

    };
    return {
        init : datatableAjax
    }
}();
$(function () {
    TableDatatablesAjax.init();
});