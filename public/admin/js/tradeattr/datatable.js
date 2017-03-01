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
                'url' : '/admin/tradeattr/getdata',
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
                {extend: 'copy',title: '规格属性管理'},
                {extend: 'csv',title: '规格属性管理'},
                {extend: 'excel', title: '规格属性管理'},
                {extend: 'pdf', title: '规格属性管理'},
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
                    "name" : "name",
                    "orderable" : false,
                },
                {
                    "data": "class",
                    "name": "class",
                    "type": "html",
                    "orderable" : false,
                },
                {
                    "data": "status",
                    "name": "status",
                    "type": "html",
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
        }).on('init.dt', function (){

            $.post('/admin/tradeattr/index',{ '_token':$('meta[name="_token"]').attr('content')},function(data){
                if(data.status){
                    var option ='';
                    var map =data.data;
                    for(var i=0;i<map.length;i++){
                        option+='<option value="'+map[i].id+'">'+map[i].name+'</option>';
                    }
                    var select=$('<select name="class_id" class="form-control form-filter" style="margin-right: 8px;">'+
                        '<option value="-1">所属行业（全部）</option>'+
                        option+
                        '</select>').prependTo('#DataTables_Table_0_filter').on('change',function(){
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
                        params.class_id = val;
                        ajax_datatable.draw();
                    });
                }
            });

        });

    };
    return {
        init : datatableAjax
    }
}();
$(function () {
    TableDatatablesAjax.init();
});