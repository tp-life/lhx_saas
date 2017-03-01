<?php
namespace App\Presenters\Admin;

use App\Models\Region;

class RegionPresenter
{
    /**
     * @param $city_html_data = [
    'p_id'=>0,
    'c_id'=>0,
    'a_id'=>0,
    ];
     * @return string
     */
	public function getHtml($city_html_data = []){
        if (empty($city_html_data)) {
            $city_html_data = [
                'p_id'=>0,
                'c_id'=>0,
                'a_id'=>0,
            ];
        }
        $html = '';
        $parent_id = 0;
        foreach ($city_html_data as $name=>$value) {
            if ($parent_id !== null) {
                $info = Region::getListByParentId($parent_id);
                $parent_id = $value ? $value : null;
            } else {
                $info = [];
            }
            $html .= self::html($name, $info, $value);
        }
        return $html;
    }

    /**
     * @param $name
     * @param $data
     * @param $checked_id
     * 拼接HTML
     */
    private static function html($name, $data, $checked_id = 0){
        static $i = 1;
        $id = $i==1 ? 'p_id' : ($i == 2 ? 'c_id' : 'a_id');
        $html = '<select name="'.$name.'" id="'.$id.'"style="width:200px;float:left;" class="form-control form-filter" >';
        $html .= self::option($data, $checked_id);
        $html .= '</select>';
        $i++;
        return $html;
    }
    public static function option($data, $checked_id = 0){
        $html = '<option value="">请选择</option>';
        foreach ($data as $item) {
            $html .= '<option value="'.$item->id.'" '.($checked_id == $item->id ? 'selected' : '').'>'.$item->name.'</option>';
        }
        return $html;
    }
}