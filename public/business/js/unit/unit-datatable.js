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
                'url' : '/business/unit/getdata',
                type:'POST',
                data:function(param){
                    var data = Object.assign(param,params);
                    return data;
                }
            },
            ordering:false,
                "pagingType": "full_numbers",
            "dom" : '<"html5buttons"B>lTfgitp',
            "buttons": [
                {extend: 'copy',title: '商品单位管理'},
                {extend: 'csv',title: '商品单位管理'},
                {extend: 'excel', title: '商品单位管理'},
                {extend: 'pdf', title: '商品单位管理'},
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
                    "data": "ck",
                    "name" : "ck",
                    "orderable" : false,
                },
                {
                    "data": "name",
                    "name": "name",
                    "orderable" : false,
                },
                {
                    "data": "class",
                    "name": "class",
                    "orderable" : false,
                },

                {
                    "data": "action",
                    "name": "action",
                    "type": "html",
                    "orderable" : false,
                },
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
        });

    };
    return {
        init : datatableAjax
    }
}();
$(function () {
    TableDatatablesAjax.init();
});