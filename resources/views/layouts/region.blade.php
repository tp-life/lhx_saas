@inject('RegionPresenter','App\Presenters\Admin\RegionPresenter')
{!! $RegionPresenter->getHtml($city_html_data) !!}
<input type="hidden" name="pca" value="{{old('pca', isset($model->pca) ? $model->pca : '')}}" id="pca" />
@section('city_js')
    <script>
        var city_url = "{{ route('api.ajaxRegion',['id'=>'']) }}"+'/';
    </script>
    <script type="text/javascript" src="{{asset('admin/js/region.js')}}"></script>
@stop