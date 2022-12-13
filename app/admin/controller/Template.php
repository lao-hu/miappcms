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
 *2022-07-06 10:53:07
 *作者：老胡
 *文件描述：模板
 */

 namespace app\admin\controller;

use app\common\components\Form;
use think\facade\View;

 class Template extends BackendBase
 {
   protected $system_template;
   protected $template_path; 

   public function initialize()
   {
      parent::initialize();
      $this->system_template = \app\common\model\SysConfig::find(1);
      $this->template_path= './template/'.$this->system_template['value'];
     
   }
    /** 
     * 模板列表
     * 
     */
    public function index()
    {
      // 模板路径
      $path = $this->template_path. "/".request()->param('file');

      // /*** 判断文件夹是否存在 */
      if(!is_dir($path)){
         return $this->error("文件夹不存在");
       }

      /** 上一级目录 */
      $up_level_dir = explode('/', request()->param('file'));
      $level   = count($up_level_dir)-1;
      unset($up_level_dir[$level]);

      if($level >1){
         unset($up_level_dir[$level-1]);
         $up_level_dir = implode('/',$up_level_dir).'/';
      }else{
         $up_level_dir = '';
      }
  

      $key_as_filename = \FilesystemIterator::KEY_AS_FILENAME; // 访问文件名
      /** 迭代器  */
      $res = new \FilesystemIterator( $path ,$key_as_filename);

      $file_name = $file_list = [];
      // 读取配置文件夹 模板名称
      $file_config = config("template_style");
     
      foreach($res as $k => $v)
      {
         if($v->getType() == "dir") {
            $file_list[] = [
                  'type' => $v->getType(),
                  'icon' => '/static/assets/image/folder.gif',
                  'name' => $v->getFilename(),
                  'size' => "",
                  'time' => "",
                  'desc' => "",
              ];
         }else{
            if($v->getExtension() == "html") {
               $file_name[] = [
                  'type' => $v->getType(),
                  'icon' => '/static/assets/image/file-1.svg',
                  'name' => $v->getFilename(),
                  'size' => "",
                  'time' => date("Y-m-d H:i:s",$v->getMTime()),
                  'desc' =>  $file_config[$v->getFilename()] ?? '未知模板',
               ];
            }
         }
      }

      View::assign([
         'template_dir'       => $file_list,
         'template_filename'  => $file_name,
         'file'              => request()->param('file'),
         'level'             => $level,
         'up_level_dir'      => $up_level_dir,
         'this_template'      =>  $this->template_path
      ]);
      return View::fetch();
    }

    public function add(){
      $file =request()->param('file');
      
      View::assign([
         "form_url"  => urlBuild('addSave'),
         'file_dir'  => $file,
         'file_name' => '',
         'file_ext'  => '',
         'file_content' => '',
         'file_type'    => 'add',
         'template_title' => '新建页面'

      ]);
      return View::fetch("save");
    }


    /** 编辑 */
    public function edit($filename=''){
      $file =request()->param('file');
      $file_name = $this->template_path.'/'.$file.$filename;
   
      if(!is_file($file_name)){
       return  $this->error('编辑的文件不存在！！！');
      }
      $content = file_get_contents($file_name);
  
      View::assign([
         "form_url"     => urlBuild('editSave'),
         'file_dir'     => $file,
         'file_name'    => $filename,
         'file_ext'     => 'html',
         'file_content' => $content,
         'file_type'    => 'edit',
         'template_title' => '编辑页面'

      ]);
      return View::fetch("save");

    }
    
    /**
     * 保存
     */
    public function addSave()
    {
      $file_dir = input("post.file_dir");
      $file_name = input("post.file_name");
      $file_ext = input("post.file_ext")?? '';
      $content = input("post.file_content");

      if(empty($file_name)){
         return $this->error("文件名不能为空");
      }
      /*
       判断是否有后缀
      */
      if(fileExt($file_name) != 'html'){
         $file_name = $file_name.".". $file_ext;
      }
         // 获取文件
         $filename = $this->template_path.'/'.$file_dir.$file_name;

         if(file_exists($filename)){
            return  $this->error('文件已存在！！！');
         }else{
           try {
               file_put_contents($filename,$content);
           }catch(\Exception $e){
              $this->error($e->getMessage());
           }
             $this->success('写入成功');
         }
    }

    /**
     * 编辑保存
     */
    public function editSave()
    {
      if(request()->isPost()){
      $file_dir = input("post.file_dir");
      $file_name = input("post.file_name");
      $file_ext = input("post.file_ext")?? '';
      $content = input("post.file_content");

      // 获取文件
      $filename = $this->template_path.'/'.$file_dir.$file_name;

         /** 
          *  判断是否有后缀，没有加上
          */
         if(fileExt($file_name) != 'html'){
            $file_name = $file_name.".". $file_ext;
         }
         if(!is_file($filename)){
            return  $this->error('编辑的文件不存在！！！');
         }
         //判断是否有写入权限
          if (!is_writable($filename)) {
           return  $this->error('无写入权限!');
         }else{
             if(file_put_contents($filename,$content) === false){
                  $this->error('失败'); 
               }else{
                  $this->success('成功');
               }
         } 
      }
    }

    //** 删除 */

    public function fileDel($file_name=''){
      $file =request()->param('file');
      $files = $this->template_path.'/'.$file.$file_name;
      if(!file_exists($files)){
         return  $this->error('要删除文件不存在！！！');
      }
      @chmod($files,0777);
      
      if(@unlink($files)){
         $this->success('删除成功');
      }else{
         $this->error('删除失败');
      }
    }

 }
