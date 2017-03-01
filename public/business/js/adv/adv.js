var TableDatatablesAjax = function() {
    var datatableAjax = function(){
        dt = $('.dataTablesAjax');
        params={};
        ajax_datatable = dt.DataTable({
            "processing": true,
            "serverSide": true,
            "searching" : true,
            "searchDelay": 800,
            "search": {
                "regex": true
            },
            "ajax": {
                'url' : '/business/adv/getdata',
                data:function(param){ //console.log(param);
                    var data = Object.assign(param,params);
                    return data;
                }
            },
            ordering:false,
                "pagingType": "full_numbers",
            "dom" : '<"html5buttons"B>lTfgitp',
            "buttons": [
                {extend: 'copy',title: '广告管理'},
                {extend: 'csv',title: '广告管理'},
                {extend: 'excel', title: '广告管理'},
                {extend: 'pdf', title: '广告管理'},
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
                    "data": "adv_img",
                    "name" : "adv_img",
                    "orderable" : false
                },
                {
                    "data": "adv_title",
                    "name": "adv_title",
                    "orderable" : false,
                },
                {
                    "data": "ap_id",
                    "name": "ap_id",
                    "orderable" : false,
                },
                {
                    "data": "adv_time",
                    "name": "",
                    "orderable" : false,
                },
                {
                    "data": "adv_sort",
                    "name": "adv_sort",
                    "orderable" : false,
                },
                {
                    "data": "action",
                    "name": "action",
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