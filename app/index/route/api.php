<?php

use think\facade\Route;

// Route::any();
// 查询栏目情况
$cate = \app\common\model\Cate::order('sort ASC,id ASC')->field('id,cate_name,cate_dirname ,module_id')->select();
foreach ($cate as $k => $v )
{
    if($v->module->getData('module_name') == 'Page'){
        Route::any($v->cate_dirname,$v->cate_dirname.'/index');
    }else{
        // 列表+详情模型
        Route::any($v->cate_dirname.'/<id>',$v->cate_dirname.'/show')->pattern(['id' => '\d+']);
        Route::any($v->cate_dirname,$v->cate_dirname.'/index');
    }
}

// tag路由
Route::any('tag_<module>/<t>', 'Index/tag');
