<?php
/**
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
 *2022-08-02 15:38:30
 *作者：老胡
 *文件描述：通用控制器
 */

namespace app\index\controller;

use app\common\model\Field;
use app\common\model\Module;
use app\common\model\Cate;


use think\facade\View;
// 引入前台类
use app\common\facade\MiAppCms;
class Error extends FrontendBase{

    // protected $model;   // 内容
    // protected $modelid; // 模型id
    // public function initialize()
    // {
    //     parent::initialize();
    //     $cate_dirname = getCateUrlRule();
    //     // 获取模型id
    //     $this->modelid = Cate::where('cate_dirname',$cate_dirname)->value('module_id');
    //     // 模型数据
    //     $this->model = Module::where('id',$this->modelid)->find();


    // }
    
    // public function index()
    // {
    //     //  获取栏目id
    //     $cate_id = getcateid();
    //     // 判断栏目是否存在
    //     if(empty($cate_id)){
    //         $this->error('栏目不存在！！！');
    //     }
    //     // 获取栏目信息
    //     $cate_info = MiAppCms::cateInfoContent($cate_id);
    //     // 获取父栏目信息
    //     $parent_cate = MiAppCms::cateParendsInfo($cate_info->parent_id);
    //     // seo
    //     $seo  = MiAppCms::seoMeta($cate_info,$this->base_config);
    //     // 模板
    //     $template = MiAppCms::listTemplate($cate_info);
        
    //     /** 判断是否是为单页模块 */
    //     if($cate_info->module->getData('model_name') == 'Page')
    //     {

    //     }

    //     View::assign([
    //         'cate'        => $cate_info,        // 栏目信息
    //         'parent_cate' => $parent_cate,
    //         'system'      =>  $this->base_config,
    //         'public'      =>  $this->public, 
    //         'title'       =>  $seo['title'], // 网站标题
    //         'keywords'    =>  $seo['keywords'],   // 网站关键字
    //         'description' =>  $seo['description'], // 网站描述
    //     ]);

   

    //     return View::fetch($template);
    // }

    // /** 
    //  *  详情页
    //  */
    // public function show($id='')
    // {
    //      //  获取栏目id
    //      $cate_id = getcateid();
        
    //      // 判断栏目是否存在
    //      if(empty($cate_id)){
    //          $this->error('栏目不存在！！！');
    //      }
    //      // 获取栏目信息
    //     $cate_info = MiAppCms::cateInfoContent($cate_id);
    //     // 获取父栏目信息
    //     $parent_cate = MiAppCms::cateParendsInfo($cate_info->parent_id);
    //     // 内容
    //     $show = MiAppCms::cateShowContent($id,$this->model);
    //     // seo
    //     $seo  = MiAppCms::seoMetaShow($show,$cate_info,$this->base_config);
    //     // 模板
    //     $template = MiAppCms::showTemplate($cate_info);
   
    //     View::assign($show);
    //     View::assign([
    //         'cate'        => $cate_info,        // 栏目信息
    //         'parent_cate' => $parent_cate,
    //         'system'      =>  $this->base_config,
    //         'public'      =>  $this->public,
    //         'title'       =>  $seo['title'], // 网站标题
    //         'keywords'    =>  $seo['keywords'],   // 网站关键字
    //         'description' =>  $seo['description'], // 网站描述

    //     ]);
    //     return View::fetch($template);
    // }
}
