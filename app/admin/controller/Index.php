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
 *2022-04-08 09:37:41
 *作者：老胡
 *文件描述：首页控制器
 */

namespace app\admin\controller;

use think\facade\App;
use think\facade\Db;
use think\facade\Route;
use think\facade\View;

class Index extends BackendBase
{
    public function index()
    {
   
      // 管理员统计
      $user_count = \app\common\model\Admin::getCount();
      // 模块统计
      $model_count = \app\common\model\Module::getCount();
      // 字段统计
      $field_count = \app\common\model\Field::getCount();
      // 栏目统计
      $cate_count = \app\common\model\Cate::getCount();
      
      // 系统信息
      $mysqlVersion = Db::query('SELECT VERSION() AS ver');

      $cateiew = [
        'config' => [
          'tpversion' => App::version(),
          'server_soft'     => $_SERVER['SERVER_SOFTWARE'],
          'php_version'     => PHP_VERSION,
          'server_os'       => PHP_OS,
          'max_upload_size' => ini_get('upload_max_filesize'),
          'mysql_version' => $mysqlVersion[0]['ver']
        ],
       'user_count'   => $user_count,
       'model_count'  => $model_count,
       'field_count'  => $field_count,
       'cate_count'   => $cate_count,
      ];
      
      View::assign($cateiew);
      return View::fetch();
    }
    //
    public function errors(){
      return showHtml('你没有权限查看该页面！！！');
    }
     /** 预览 */
     public function getPreviewPage($m="",$id="0"){
     
      // 查找当前数据 
      $model = '\app\common\model\\'.ucfirst($m);
      $item = $model::find($id);
      $pinyin = new \pinyin\Utf8ToPinyin;
      // route.php 定义的后缀
      $suffix = config("route.url_html_suffix");
      if($item){
        // 获取栏目
       $cate = \app\common\model\Cate::find($item['cate_id']);
        // 判断是否有为单页模块
        if($cate->module->getData('model_name') == "Page"){
            if($cate['cate_dirname']) {
              $url = DIRECTORY_SEPARATOR."index".DIRECTORY_SEPARATOR.$cate['cate_dirname'].".".$suffix;
            }else{
              $pinyin_link = $pinyin->encode($cate['cate_name'],'all');
              $url = DIRECTORY_SEPARATOR."index".DIRECTORY_SEPARATOR.$pinyin_link.".".$suffix;
            }
        }else{
          if($cate['cate_dirname']){
            $url = DIRECTORY_SEPARATOR."index".DIRECTORY_SEPARATOR.$cate['cate_dirname'].DIRECTORY_SEPARATOR.$id.".".$suffix;
          }else{
            $pinyin_link = $pinyin->encode($cate['cate_name'],'all');
            $url = DIRECTORY_SEPARATOR."index".DIRECTORY_SEPARATOR. $pinyin_link.DIRECTORY_SEPARATOR.$id.".".$suffix;
          }
        }
      

        // if(isset($cate['id']) && !empty($cate['id'])){
        //   if($cate['cate_dirname']) {
        //      // $url = Route::buildUrl("index/".$cate['cate_dirname'] . '/show', ['id' => $id])->domain('');
        //      $url =  
        //   }else{
        //   $pinyin = new \pinyin\Utf8ToPinyin;
        //   $return_link =   $pinyin->encode($cate['cate_name'],'all');
        //       $url = Route::buildUrl("index/".$return_link . '/show', ['id' => $id])->domain('');
        //   }
        // }

      
        
        return redirect($url);
      }else{
        $this->error('未找到当前数据');
      }
      
    
    }
}
