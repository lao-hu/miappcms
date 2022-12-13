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
 *2022-04-22 18:51:05
 *作者：老胡
 *文件描述：模块
 */

namespace app\admin\controller;

use think\facade\View;
use app\common\components\Form;
use app\common\facade\BackendRun;

class Module extends BackendBase{
   // 模型名称
   protected $model_name = 'Module';
   // 数据表
   protected $table_name = 'module';

   public function index(){
    
    $pk = BackendRun::getPk($this->table_name);
    $table_columns= BackendRun::getListDataShow($this->table_name);
  
    $rightButton = BackendRun::addCustomRightBtn($this->table_name);
    $topButton = BackendRun::addCustomTopBtn($this->table_name,['menubtn',
    'makemodel'=>[
      'class' =>'layui-btn layui-btn-sm miappcms-btn-waring layui-btn-disabled disableds',
      'icon'  => 'fa fa-code',
      'title' => '生成model文件',
      'js'    => "
      var url = '".urlBuild('makebuild?id=__id__&file=model')."';
      miappcms.ajaxget(fieldUrl(url));"
    ],
    'makecontroller'=>[
      'class' =>'layui-btn layui-btn-sm miappcms-btn-waring layui-btn-disabled disableds',
      'icon' => 'fa fa-code',
      'title' => '生成控制器文件',
      'js' => "
      var url = '".urlBuild('makebuild?id=__id__&file=controller')."';
      miappcms.ajaxget(fieldUrl(url)); 
    "
    ]
  ]);
    /** 单页 */
    $search_item = BackendRun::isSearchField($this->model_name);
 
    view::assign([
      'table_columns' => $table_columns, 
      'rightButton'   => $rightButton,
      'pk'            => $pk,
      'topButton'     => $topButton,
      'search_item'   => $search_item,
    ]);
    return View::fetch('table/index');
   }

   public function add(){
    $tips = '1、表类型分为：栏目表和后台表。<br />
            2、栏目：类型的表通常用于搭配栏目进行前台输出，所以这类表需要包含栏目ID，点击数，关键字等字段，<br />
            3、后台：类型的表通常用于辅助前台或辅助系统，如系统设置表、用户表、用户管理表 ，日志表等，这类表通常不需要包含栏目ID，点击数，关键字等字段 <br />
           4、已存在的表，会读取已存在的字段';
      
      $columns = BackendRun::getFormAddColumns($this->table_name);
      
      foreach($columns as $k => $v){
        if($v[1] == 'right_button'){
          unset($columns[$k][4]['preview']);
        }
        if($v[1] == 'top_button'){
          unset($columns[$k][4]['recommend']);
        }
      }
    
      $form = Form::getInstance();
      $form->formElements($columns)->setPageTips($tips,'danger')->setOherJs($this->setRightButtonJs());

      return $form->setFormDisplay();
   }

   public function addPostSubmit(){
    
        if(request()->isPost()){
            $data = input('post.');
            
          $model = '\app\common\model\\'.$this->model_name;
          $value = $model::where('table_name',$data['table_name'])->value('table_name');
         
            if($value){
              return $this->error('表名称 [' . $data['table_name'] . '] 已存在');
        
            }else{
                $result = $model::add($data);
                if($result['code']){
                   $create = $model::createTables($data['table_name']);
                    if($create === true){
                        $this->success($result['msg'],'index');
                    }else{
                        $model::where('table_name',$data['table_name'])->delete();
                        $this->error($create);
                    }
                }else{
                  return $this->error($result['msg']);
                }
              
            }

        }
   }

   public function edit($id){
     $model = '\app\common\model\\'.$this->model_name;
      $result = $model::find($id);
      $tips = '
      1、表类型分为：栏目表和后台表。<br /> 2、栏目：类型的表通常用于搭配栏目进行前台输出，所以这类表需要包含栏目ID，点击数，关键字等字段，<br />3、后台：类型的表通常用于辅助前台或辅助系统，如系统设置表、用户表、用户管理表 ，日志表等，这类表通常不需要包含栏目ID，点击数，关键字等字段 <br /> 4、已存在的表，会读取已存在的字段 <br/> 
    ';

    $columns = BackendRun::getFormAddColumns($this->table_name,$result);
    
    foreach($columns as $k => $v){
      if($v[1] == 'right_button' && $result->table_type == 2){ 
        unset($columns[$k][4]['preview']);
      }
    }

      $form = Form::getInstance();
      $form->formElements($columns)->setPageTips($tips,'success')->setOherJs($this->setRightButtonJs($id));
   
      return $form->setFormDisplay();
   }

   public function editPostSubmit()
   {
    if(request()->isPost()){
      $data = input('post.');
      $data['model_name'] = ucfirst($data['model_name']);
      $model = '\app\common\model\\'.$this->model_name;
      $info = $model::changeTables($data);
      if($info !== true){
        $this->error($info);
      }
        $result = $model::edit($data);
        if($result['code']){
          $this->success($result['msg']);
        }else{
          $this->error($result['msg']);
        }
    
    }
  }
  /**
   * 生成菜单
   */  
  public function makeMenu(){
    $id = input("get.id");
    $model = \app\common\model\Module::find($id);
    if($model){
      $data = [
        'pid'  => 2,
        'name'   => $model->model_name.'/index',
        'title'  => $model->module_name,
        'status' => 0
      ];
      $menu = \app\common\model\MenuRule::where('name',$model->model_name.'/index')->select()->toArray();
      if($menu){
        return $this->error('当前菜单已存在,无法生成，请先删除');
      }
      $result = \app\common\model\MenuRule::create($data);
      if($result){
        $info[] = [
          'pid'  => $result->id,
          'name'   => $model->model_name.'/add',
          'title'  => "操作-添加",
          'sort'   => 2,
          'status' => 0
        ]; 
        $info[] = [
          'pid'  => $result->id,
          'name'   => $model->model_name.'/addPostSubmit',
          'title'  => "操作-添加保存",
          'sort'   => 3,
          'status' => 0
        ]; 
        $info[] = [
          'pid'  => $result->id,
          'name'   => $model->model_name.'/edit',
          'title'  => "操作-修改",
          'sort'   => 4,
          'status' => 0
        ]; 
        $info[] = [
          'pid'  => $result->id,
          'name'   => $model->model_name.'/editPostSubmit',
          'title'  => "操作-修改保存",
          'sort'   => 5,
          'status' => 0
        ]; 
        $info[] = [
          'pid'  => $result->id,
          'name'   => $model->model_name.'/del',
          'title'  => "操作-删除",
          'sort'   => 6,
          'status' => 0
        ]; 
        $info[] = [
          'pid'  => $result->id,
          'name'   => $model->model_name.'/export',
          'title'  => "操作-导出",
          'sort'   => 7,
          'status' => 0
        ]; 
        $info[] = [
          'pid'  => $result->id,
          'name'   => $model->model_name.'/getlist',
          'title'  => "操作-获取数据列表",
          'sort'   => 8,
          'status' => 0
        ]; 
        $res = new \app\common\model\MenuRule;
        $res->saveAll($info);

        $this->success('生成成功');
      }
    
    }
  }

  public function del($id)
  {
    $model = '\app\common\model\\'.$this->model_name; 
    $item = $model::getFieldDel($id);
    if(!$item){
        return $this->error('字段表数据删除失败，请确保id正确');
    }
    
    if(strpos($id,",") !== false){
      $res = $model::delAll($id);
    }else{
      $res = $model::del($id);
    }

    if($res['code']){
      $this->success($res['msg']);
    }else{
        $this->error($res['msg']);
    }
    
  }

  /** 
   * 生成文件
   */
  public function makebuild($id="",$file="")
  {
    $res = BackendRun::makeGenerate($id,$file);
    if($res['code']){
     $this->success($res['msg']);
    }else{
     $this->error($res['msg']);
    }
  }

  /** 设置额外的右侧按钮JS */
  private function setRightButtonJs($id="0")
  {
    $url  = urlBuild('setRightButtonJsHtml');
    $urls = urlBuild('setTopButtonJsHtml');
    $js = <<<JS
    form.on('select(table_type)', function(data){
       var right_button =  $("#right_button");
       var top_button = $("#top_button");
      if(data.value == 1){
          $.post('{$url}?type='+data.value+'&id={$id}',function(res,status,xhr){
            right_button.html(res);
            form.render('checkbox');
          });
          $.post('{$urls}?type='+data.value+'&id={$id}',function(res,status,xhr){
               top_button.html(res);
              form.render('checkbox');
          });
      }
    });
  JS;
    return $js;
  }

  /** 表格右侧按钮组 */
  public function setRightButtonJsHtml($type="",$id="0"){
    $model = '\app\common\model\\'.$this->model_name;
    /** 获取字典数据 */
    if(empty($id)){
      $columns = BackendRun::getFormAddColumns($this->table_name);
    }else{
      $result = $model::find($id);
      $columns = BackendRun::getFormAddColumns($this->table_name,$result);
    }

    $item = isset($result)? explode(",",$result->right_button) : ""; 
    $html = "";
    foreach($columns as $k => $v){
      if($v[1] == 'right_button'){

        foreach($v[4] as $kk => $vv){
          if($type == 2 && $kk == 'preview'){
              continue;
          }
          if(is_array($item) && in_array($kk,$item)){
            $checked = "checked";
          }else{
            $checked = "";
          }
          $html .= '<input type="checkbox" name="right_button[]" value="'.$kk.'" title="'.$vv.'" '. $checked.' lay-skin="primary">';
        }

        break;
      }
    }
  
   return $html;
  }

  /** 表格表头按钮组 */
  public function setTopButtonJsHtml($type="",$id="0"){
    $model = '\app\common\model\\'.$this->model_name;
    /** 获取字典数据 */
    if(empty($id)){
      $columns = BackendRun::getFormAddColumns($this->table_name);
    }else{
      $result = $model::find($id);
      $columns = BackendRun::getFormAddColumns($this->table_name,$result);
    }

    $item = isset($result)? explode(",",$result->right_button) : ""; 
    $html = "";

    foreach($columns as $k => $v){
      if($v[1] == 'top_button'){

        foreach($v[4] as $kk => $vv){
          if($type == 2 && $kk == 'recommend'){
              continue;
          }
          if(is_array($item) && in_array($kk,$item)){
            $checked = "checked";
          }else{
            $checked = "";
          }
          $html .= '<input type="checkbox" name="right_button[]" value="'.$kk.'" title="'.$vv.'" '. $checked.' lay-skin="primary">';
        }

        break;
      }
    }
   return $html;
  }
}
