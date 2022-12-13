<?php
/**
 *  数据表是否包含某个字段
 */
function getTableFields($table,$field){
    $fields = \think\facade\Db::getTableFields($table);
    if (array_search($field, $fields) === false) {
        return false;
    } else {
        return true;
    }
}
  /**
     * 添加一个右侧按钮
     * @param string $type      按钮类型：edit/delete/default
     * @param array  $attribute 按钮属性
     * @param array  $extra     扩展参数(待用)
     * @return array
     */
function addRightButtons($type='',$attribute=[]){
     
        switch($type)
        {
            case 'auth':
                $btns=[
                    'type'  => 'auth',
                    'class' => 'layui-btn layui-btn-xs', // 按钮class
                    'id'    => '', // id=""
                    'event' => $type , //'lay-event' 值
                    'icon' => 'fa fa-check-square-o',  // 字体图标
                    'title' => '权限',
                    'layer' => true,
                    'href' => url('auth',['id'=>'__id__']),
                   
                    'js' => ''
                ];
            break;
            case 'add':
             $btns=[
                 'type'  => 'add',
                 'class' => 'layui-btn layui-btn-xs', // 按钮class
                 'id'    => '', // id=""
                 'event' => $type , //'lay-event' 值
                 'icon' => 'fa fa-plus',  // 字体图标
                 'title' => '添加',
                 'layer' => true,
                 'href' => url('add'),
                
                 'js' => ''
             ];
            break;
            case 'edit':
             $btns=[
                 'type'  => 'edit',
                 'class' => 'layui-btn layui-btn-xs layui-btn-normal', // 按钮class
                 'id'    => '',// id=""
                 'event' => $type , //'lay-event' 值
                 'icon' => 'fa fa-pencil-square-o',  // 字体图标
                 'title' => '编辑',
                 'layer' => true,
                 'href'  => url('edit',['id'=>'__id__']),
                
                 'js' => ''
             ];
            break;
            case 'del':
             $btns=[
                 'type'  => 'btn',
                 'class' => 'layui-btn layui-btn-xs layui-btn-danger', // 按钮class
                 'id'    => '',// id=""
                 'event' => $type , //'lay-event' 值
                 'icon' => 'fa fa-trash-o',  // 字体图标
                 'title' => '删除',
                 'layer' => true,
                 'href'  => url('del',['id'=>'__id__']),
                 'js' => ''
             ];
            break;
            /*** 预览 */
            case 'preview':
                $url = urlBuild('index/getpreviewpage')."?m=".request()->controller()."&id=__id__";
                $btns=[
                    'type'  => 'btn',
                    'class' => 'layui-btn layui-btn-xs miappcms-btn-success', // 按钮class
                    'id'    => '',// id=""
                    'event' => $type , //'lay-event' 值
                    'icon' => 'fa fa-eye',  // 字体图标
                    'title' => '预览',
                    'layer' => false,
                    'href'  => '',
                    'js' => 'window.open(fieldsUrl("'.$url.'"),"_blank");'
                ];

                //
            break;
            default:
             $btns=[
                 'type'  => '',
                 'class' => 'layui-btn layui-btn-xs', // 按钮class
                 'id'    => '',// id=""
                 'event' => $type , //'lay-event' 值
                 'icon' => 'fa fa-trash-o',  // 字体图标
                 'title' => '自定义按钮',
                 'layer' => true,
                 'href' => '',
                 'js' => ''
                 ];
            break;
        }
        // 合并自定义属性
        if ($attribute && is_array($attribute)) {
         $btns = array_merge($btns, $attribute);
       }
    return $btns;
}
//  添加一个顶部按钮
function addTopButtons($type='',$attribute=[]){

    switch($type)
    {
        case 'add':
         $btns=[
             'type'  => 'add',
             'class' => 'layui-btn layui-btn-sm', // 按钮class
             'id'    => '',// id=""
             'event' => $type , //'lay-event' 值
             'icon'  => 'fa fa-plus',  // 字体图标
             'title' => '添加',
             'layer' => true,
             'href'  => url('add'),
            
             'js'    => ''
         ];
        break;
        case 'edit':
         $btns=[
             'type'  => 'edit',
             'class' => 'layui-btn layui-btn-sm layui-btn-normal layui-btn-disabled disableds', // 按钮class
             'id'    => '',// id=""
             'event' => $type , //'lay-event' 值
             'icon' => 'fa fa-pencil-square-o',  // 字体图标
             'title' => '编辑',
             'layer' => true,
             'href'  => url('edit',['id'=>'__id__']),
            
             'js' => ''
         ];
        break;
        case 'del':
         $btns=[
            'type'  => 'del',
            'class' => 'layui-btn layui-btn-sm layui-btn-danger layui-btn-disabled disableds', // 按钮class
            'id'    => '',// id=""
            'event' => $type , //'lay-event' 值
            'icon' => 'fa fa-trash-o',  // 字体图标
            'title' => '删除',
            'layer' => false,
            'href' => url('del',['id'=>'__id__']),
            
            'js' => ''
         ];
        break;
        /** 菜单生成
         */
        case 'menubtn':
            $btns=[
                'type'  => 'menubtn',
                'class' => 'layui-btn layui-btn-sm layui-btn-normal layui-btn-disabled disableds', // 按钮class
                'id'    => '',// id=""
                'event' => 'menubtn' , //'lay-event' 值
                'icon' => 'fa fa-thumb-tack',  // 字体图标
                'title' => '生成菜单',
                'layer' => true,
                'href'  => url('makemenu',['id'=>'__id__']),
               
                'js' => ''
            ];
        break;
        /** 导出按钮 */ 
        case 'export':
            $btns=[
                'type'  => 'export',
                'class' => 'layui-btn layui-btn-sm miappcms-btn-primary', // 按钮class
                'id'    => 'export',// id=""
                'event' => 'export' , //'lay-event' 值
                'icon' => 'fa fa-download',  // 字体图标
                'title' => '导出数据',
                'layer' => true,
                'href'  => '',
                'js' => ''
            ];
        break;
        /** 推荐位 **/
        case 'recommend':
            $btns = [
                'type'  => 'html',
                'class' => 'layui-btn layui-btn-sm miappcms-btn-success', // 按钮class
                'id'    => '',// id=""
                'event' => $type , //'lay-event' 值
                'icon' => 'fa fa-bullhorn',  // 字体图标
                'title' => '推荐位',
                'layer' => true,
                'href'  => '',
                'html'  => addTopRecHtml(),
                'js' => '
                    if(fieldData("id") == ""){
                       miappcms.alerterror("请选择你推荐的数据");
                       return false;
                    }
                    var rid = $("#recommend_id").val();
                    var url = fieldUrl("'.urlBuild('getChangeRec').'?id=__id__&rid="+rid);
                   miappcms.ajaxget(url);
                '
            ];
            break;
        default:
         $btns=[
             'type'  => '',
             'class' => 'layui-btn layui-btn-sm disableds', // 按钮class
             'id'    => '',// id=""
             'event' => $type , //'lay-event' 值
             'icon' => 'fa fa-trash-o',  // 字体图标
             'title' => '自定义按钮',
             'layer' => true,
             'href'  => '',
             'js' => ''
             ];
        break;
        
    }

    // 合并自定义属性
    if ($attribute && is_array($attribute)) {
     $btns = array_merge($btns, $attribute);
   }
   return $btns;

}

/**
 * 权限设置选中状态
 * @param     $cate  栏目
 * @param int $pid   父ID
 * @param     $rules 规则
 * @return array
 */
function auth($cate, $pid, $rules)
{
    $arr      = array();
    $rulesArr = explode(',', $rules);
    foreach ($cate as $v) {
        if ($v['pid'] == $pid) {
            if (in_array($v['id'], $rulesArr)) {
                $v['checked'] = true;
            }
            $v['open'] = true;
            $arr[]     = $v;
            $arr       = array_merge($arr, auth($cate, $v['id'], $rules));
        }
    }
    return $arr;
}
/** 推荐 */
function addTopRecHtml(){
    $list = \app\common\model\Recommend::select();
    $html = '<select lay-ignore id="recommend_id"  style="margin: 0 5px">';
    $html .= '<option value="">请选择</option>';
    $html .= '<option value="0">取消推荐</option>';
    foreach ($list as $k => $v) {
        $html .= '<option value="'.$v['id'].'">'.$v['name'].'</option>';
    }
    $html.= '</select>';
    
    return $html;
}

function addTablesButtonHtml(){

}