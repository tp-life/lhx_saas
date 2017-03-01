<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  <h4 class="modal-title">批发商信息</h4>
</div>
<div class="modal-body">
  <form class="form-horizontal">
    <div class="hr-line-dashed no-margins"></div>
    <div class="form-group">
      <label class="col-sm-3 control-label">主账号</label>
      <div class="col-sm-8">
        <p class="form-control-static">{{$account->account_name}}</p>
      </div>
    </div>
    <div class="hr-line-dashed no-margins"></div>
    <div class="form-group">
      <label class="col-sm-3 control-label">认证手机号</label>
      <div class="col-sm-8">
        <p class="form-control-static">{{$account->mobile}}</p>
      </div>
    </div>
    <div class="hr-line-dashed no-margins"></div>
    <div class="form-group">
      <label class="col-sm-3 control-label">客户名称</label>
      <div class="col-sm-8">
        <p class="form-control-static">{{$business->business_name}}</p>
      </div>
    </div>
    <div class="hr-line-dashed no-margins"></div>
    <div class="form-group">
      <label class="col-sm-3 control-label">详细地址</label>
      <div class="col-sm-8">
        <p class="form-control-static">{{$business->pca}}{{$business->address}}</p>
      </div>
    </div>
    <div class="hr-line-dashed no-margins"></div>
    <div class="form-group">
      <label class="col-sm-3 control-label">所属行业</label>
      <div class="col-sm-8">
        <p class="form-control-static">{{$business->classification->name}}</p>
      </div>
    </div>
    <div class="hr-line-dashed no-margins"></div>
    <div class="form-group">
      <label class="col-sm-3 control-label">姓名</label>
      <div class="col-sm-8">
        <p class="form-control-static">{{$business->contact_name}}</p>
      </div>
    </div>
    <div class="hr-line-dashed no-margins"></div>
    <div class="form-group">
      <label class="col-sm-3 control-label">职位</label>
      <div class="col-sm-8">
        <p class="form-control-static">{{$business->contact_job}}</p>
      </div>
    </div>
    <div class="hr-line-dashed no-margins"></div>
    <div class="form-group">
      <label class="col-sm-3 control-label">手机</label>
      <div class="col-sm-8">
        <p class="form-control-static">{{$business->contact_mobile}}</p>
      </div>
    </div>
    <div class="hr-line-dashed no-margins"></div>
    <div class="form-group">
      <label class="col-sm-3 control-label">签约时间</label>
      <div class="col-sm-8">
        <p class="form-control-static">{{date('Y-m-d',$business->start_time)}} 至 {{ date('Y-m-d',$business->end_time) }}</p>
      </div>
    </div>
      <div class="hr-line-dashed no-margins"></div>
      <div class="form-group">
          <label class="col-sm-3 control-label">注册时间</label>
          <div class="col-sm-8">
              <p class="form-control-static">{{$business->created_at}}</p>
          </div>
      </div>
      <div class="hr-line-dashed no-margins"></div>
      <div class="form-group">
          <label class="col-sm-3 control-label">状态</label>
          <div class="col-sm-8">
              <p class="form-control-static">{{$business->getStatus($business->status)}}</p>
          </div>
      </div>
      <div class="hr-line-dashed no-margins"></div>
      <div class="form-group">
          <label class="col-sm-3 control-label">开户银行</label>
          <div class="col-sm-8">
              <p class="form-control-static">{{$business->bank_name}}</p>
          </div>
      </div>
      <div class="hr-line-dashed no-margins"></div>
      <div class="form-group">
          <label class="col-sm-3 control-label">开户名称</label>
          <div class="col-sm-8">
              <p class="form-control-static">{{$business->bank_user}}</p>
          </div>
      </div>
      <div class="hr-line-dashed no-margins"></div>
      <div class="form-group">
          <label class="col-sm-3 control-label">银行账号</label>
          <div class="col-sm-8">
              <p class="form-control-static">{{$business->bank_card}}</p>
          </div>
      </div>
      <div class="hr-line-dashed no-margins"></div>
      <div class="form-group">
          <label class="col-sm-3 control-label">营业执照</label>
          <div class="col-sm-8">
              <img style="height: 100px;" class="zoomify" src="{{ $business->business_license }}"   />
          </div>
      </div>
  </form>
</div>
<div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal">{!!trans('admin/action.actionButton.close')!!}</button>
</div>
<script>
    $('.zoomify').zoomify();
</script>