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
                'url' : '/admin/article_class/getdata',
                data:function(param){ //console.log(param);
                    var data = Object.assign(param,params);
                    return data;
                }
            },
            ordering:false,
                "pagingType": "full_numbers",
            "dom" : '<"html5buttons"B>lTfgitp',
            "buttons": [
                {extend: 'copy',title: '文章分类管理'},
                {extend: 'csv',title: '文章分类管理'},
                {extend: 'excel', title: '文章分类管理'},
                {extend: 'pdf', title: '文章分类管理'},
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
                // {
                //     "data": "ac_code",
                //     "name" : "ac_code",
                //     "orderable" : false,
                // },
                {
                    "data": "ac_name",
                    "name" : "ac_name",
                    "orderable" : false
                },
                {
                    "data": "ac_parent_name",
                    "name" : "ac_parent_name",
                    "orderable" : false,
                },
                {
                    "data": "ac_sort",
                    "name": "ac_sort",
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