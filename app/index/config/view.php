<?php
// | 模板设置

$system_template = \app\common\model\SysConfig::where('group_id',1)->where('name','mi_template_style')->find();
return [
    // 模板目录
    'view_path' => public_path().'template'. DIRECTORY_SEPARATOR .$system_template['value'].DIRECTORY_SEPARATOR.'content'.DIRECTORY_SEPARATOR,
    // 分隔符
    'view_depr'       => '_',
    // 标签库
    'taglib_pre_load'  => 'app\common\taglib\MiAppCms',
];
