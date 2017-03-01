var TableDatatablesAjax = function() {
  var datatableAjax = function(){
    dt = $('.dataTablesAjax');
		ajax_datatable = dt.DataTable({
     "processing": true,
      "serverSide": true,
      "searching" : false,
      //"iDisplayLength" : 1,
      "searchDelay": 800,
      "search": {
        "regex": true
      },
      "paging": false,
      "ajax": {
        'url' : '/business/business_customer_level/ajaxIndex',
          //data:function(param){
          //    var da = $('#searchForm').serializeArray();
          //    for(var i in da) {
          //        param[da[i]['name']] = da[i]['value'];
          //    }
          //}
      },
        "initComplete": function( settings, json ) {
            //绑定查询按钮事件
            //$("#filter-button").click(function(){
            //    ajax_datatable.draw();//刷新数据
            //});
        },
      //"pagingType": "full_numbers",
      "orderCellsTop": true,
      "dom" : '<"html5buttons"B>lTfgitp',
      "buttons": [
        {extend: 'copy',title: 'user'},
        {extend: 'csv',title: 'user'},
        {extend: 'excel', title: 'user'},
        {extend: 'pdf', title: 'user'},
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
        	"data": "level_name",
        	"name" : "level_name",
            "orderable" : false
      	},
        {
        	"data": "discount",
        	"name" : "discount",
            "render": function(val){
                return val + '%';
            },
        	"orderable" : false
        },
        {
          "data": "actionButton",
          "name": "actionButton",
          "type": "html",
          "orderable" : false
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
      // 关闭modal清空内容
      $(".modal").on("hidden.bs.modal",function(e){
          $(this).removeData("bs.modal");
      });
  };
	return {
		init : datatableAjax
	}
}();
$(function () {
  TableDatatablesAjax.init();
});