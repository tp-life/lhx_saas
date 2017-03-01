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
                'url' : '/business/adv_recommend_class/getdata',
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
                    "data": "img",
                    "name" : "img",
                    "orderable" : false
                },
                {
                    "data": "ap_name",
                    "name": "ap_name",
                    "orderable" : false,
                },
                {
                    "data": "goods_group_name",
                    "name": "goods_group_name",
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