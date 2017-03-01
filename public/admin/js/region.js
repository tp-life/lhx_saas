$(function(){
    $('#p_id').change(function(){
        var id = this.value;
        $.ajax({
            url:city_url + id,
            data:{_token:'{{csrf_token()}}'},
            dataType:'html',
            success:function (response) {
                $('#c_id').html(response);
                $('#a_id').html('<option value="">请选择</option>');
            }
        });
        var p = $('#p_id  option:selected').text();
        var c = $('#c_id  option:selected').text();
        var a = $('#a_id  option:selected').text();
        $('#pca').val(p + c + a);
    });
    $('#c_id').change(function(){
        var id = this.value;
        $.ajax({
            url:city_url + id,
            data:{_token:'{{csrf_token()}}'},
            dataType:'html',
            success:function (response) {
                $('#a_id').html(response);
            }
        });
        var p = $('#p_id  option:selected').text();
        var c = $('#c_id  option:selected').text();
        var a = $('#a_id  option:selected').text();
        $('#pca').val(p + c + a);
    });
    $('#a_id').change(function(){
        var p = $('#p_id  option:selected').text();
        var c = $('#c_id  option:selected').text();
        var a = $('#a_id  option:selected').text();
        $('#pca').val(p + c + a);
    });
});