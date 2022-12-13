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
 *2022-04-10 09:27:03
 *作者：老胡
 *文件描述：菜单规则
 */

namespace app\admin\controller;

use app\common\components\Form;
use app\common\facade\BackendRun;
use think\facade\View;

class MenuRule extends BackendBase{
    // 模型名称
    protected $model_name = 'MenuRule';
    // 数据表名称
    protected $table_name = 'menu_rule';

    public function index(){
        
      $pk = BackendRun::getPk($this->table_name);
      $table_columns= BackendRun::getListDataShow($this->table_name);
      
      $rightButton = BackendRun::addCustomRightBtn($this->table_name);
      $topButton = BackendRun::addCustomTopBtn($this->table_name,[
        'show' => [
          'class' => 'layui-btn layui-btn-sm layui-btn-normal',
          'icon'  => 'fa fa-caret-square-o-down',
          'title' => '展开菜单',
          'js'   => ' tableTree.showAll(objTable);'
        ],
        'hide' => [
          'class' => 'layui-btn layui-btn-sm layui-btn-normal',
          'icon'  => 'fa fa-caret-square-o-right',
          'title' => '折叠菜单',
          'js'    => 'tableTree.hideAll(objTable);'
        ]
      ]);
      view::assign([
        'table_columns'=>$table_columns, 
        'rightButton' => $rightButton,
        'pk'   => $pk,
        'topButton' => $topButton,

        'keyid'           => 'id',    // 当前ID
        'keypid'          => 'pid', // 上级ID
        'keytitle'        => 'title' // 此字段td用于绑定单击折叠展开功能
      ]);
   
      return View::fetch('common/tabletree');
    }
    
    public function getList(){
      $model = "\app\common\model\\".$this->model_name;
      
      $items = $model::getListData();
      $count =  $model::getCount();
      return jsonData($items,$count);
     
    }
    

    public function add(){
      $columns = BackendRun::getFormAddColumns($this->table_name);
      foreach($columns as $key => $val){
        if($val[1] == 'pid'){
          $result = \app\common\model\MenuRule::getPids();
          $columns[$key][4] = $result;
        }
      }

      $form = Form::getInstance();
      $form->formElements($columns);

      return $form->setFormDisplay();
    }
   
    public function edit($id)
    {
      $model = '\app\common\model\\'.$this->model_name;
      $result = $model::find($id);
      $columns = BackendRun::getFormAddColumns($this->table_name,$result);
      foreach($columns as $key => $val){
        if($val[1] == 'pid'){
          $result = \app\common\model\MenuRule::getPids();
          $columns[$key][4] = $result;
        }
      }
      $form = Form::getInstance();
      $form->formElements($columns);

      return $form->setFormDisplay();
    }

}
