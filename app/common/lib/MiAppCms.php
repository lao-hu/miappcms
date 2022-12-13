<?php

/***
 *                       .::::.
 *                     .::::::::.
 *                    :::::::::::
 *                 ..:::::::::::'
 *              '::::::::::::'
 *                .::::::::::
 *           '::::::::::::::..
 *                ..::::::::::::.
 *              ``::::::::::::::::
 *               ::::``:::::::::'        .:::.
 *              ::::'   ':::::'       .::::::::.
 *            .::::'      ::::     .:::::::'::::.
 *           .:::'       :::::  .:::::::::' ':::::.
 *          .::'        :::::.:::::::::'      ':::::.
 *         .::'         ::::::::::::::'         ``::::.
 *     ...:::           ::::::::::::'              ``::.
 *    ````':.          ':::::::::'                  ::::..
 *                       '.:::::'                    ':'````..
 *
 *2022-04-14 09:31:08
 *作者：老胡
 *文件描述：处理前台页面及业务 等。
 */

namespace app\common\lib;

use app\common\model\Field;
use app\common\model\Module;
use app\common\model\Cate;
use think\facade\Db;
use think\facade\Route;

class MiAppCms
{
    /* 
     获取栏目信息内容 
    */
    public function cateInfoContent($id){
        $cate = Cate::find($id);

        /**
         *  设置顶级栏目，当顶级栏目不存在的时候顶级栏目为本身
        */
        if($cate){
            // 动态的添加一个属性
            if($cate->parent_id === 0){
                $cate->top_id = $cate->id;
            }else{
                $cate->top_id = $cate->parent_id;
            }
        }
        return $cate;
    }
    /**
     * 获取seo列表页信息
    */
    public function seoMeta($cate,$config)
    {
        $seo = [];
        $seo['title'] = $cate->title ?: $config->title; // 标题
        $seo['keywords'] = $cate->keywords ?: $config->keywords; // 关键词
        $seo['description'] = $cate->description ?: $config->description; // 描述
        return $seo;
    }

    /**
     *  获取seo内容页信息
    **/
    public function seoMetaShow($show,$cate,$config){
        $seo = [];
        $seo['title'] = !empty( $show['title']) ? $show['title']: ( $cate->title ?: $config->title);  // 标题
        $seo['keywords'] = !empty( $show['keywords']) ? $show['keywords'] : ( $cate->keywords ?: $config->keywords); // 关键词
        $seo['description'] = !empty( $show['description']) ? $show['description'] : ( $cate->description ?: $config->description);   // 描述
        return $seo;
    }
    /**
     * 内容数据
     * */
    public function cateShowContent($id,$data){
        $model= '\app\common\model\\'.$data->model_name;
        $res =  $model::find($id)->toArray();
        return $res;
    }

    /**
     * 列表页面模板
    */
    public function listTemplate($cate)
    {
        $view = '';
        // 判断是否为单页模块
        if($cate->module->getData('model_name') == 'Page'){
            $view = str_replace(".html",'',$cate->template_page) ?: strtolower($cate->module->getData('model_name')).'_default';
        }else{
            $view = str_replace(".html",'',$cate->template_list) ?: 'list_default';
        }

        return $view;
    }
     /**
     * 详情页面模板
    */
    public function showTemplate($cate){
        return  $view = !empty($cate->template_show) ? str_replace(".html",'',$cate->template_show) : 'show_default';
    }


    /** 根据id 获取父栏目信息 */
    public function cateParendsInfo($id){
      
        $cate = Cate::where('id',$id)->find();
        if($cate){
            $cate->url = Route::buildUrl($cate['cate_dirname'] . '/index')->domain('');
        }
        return $cate;
    }

}
