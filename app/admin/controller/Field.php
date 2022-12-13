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
 *2022-04-22 18:51:14
 *作者：老胡
 *文件描述：字段控制器
 */

namespace app\admin\controller;

use app\common\facade\BackendRun;
use think\facade\View;

use think\facade\Db;

class Field extends BackendBase
{
    protected $model_name = 'Field';
    protected $table_name = 'field';

    /*** 
   * 列表页表格
   */  
  public function index(){
    $model = '\app\common\model\\'.$this->model_name;
    $pk = BackendRun::getPk($this->table_name);
    $table_columns= BackendRun::getListDataShow($this->table_name);
    // dump($table_columns);
    $rightButton = BackendRun::addCustomRightBtn($this->table_name);
    $topButton = BackendRun::addCustomTopBtn($this->table_name);

    /** 设置 搜索 字段 */
   $search_item = BackendRun::isSearchField($this->model_name);
 
    view::assign([
      'table_columns'   =>$table_columns, 
      'rightButton'     => $rightButton,
      'pk'              => $pk,
      'topButton'       => $topButton,
      'search_item'     => $search_item
    ]);

    return View::fetch('table/index');
   }
  
    public function add(){
        $model = \app\common\model\Module::getCommonList([
            'field' => 'id,module_name,table_name',
            'pages' => "",
            'json'  => false
            ]);
        $dict = \app\common\model\DictionaryType::field('id,name,remake')->select();
        View::assign([
            'dict'       => $dict,
            'type'       => '',
            'module_id'  => 0,
            'field'      => 0,
            'items'      => null,
            'model'      => $model,
            'tab_id'     => 0
        ]);
        
        return View::fetch('field_form');
    }

    /**
     *  添加处理
    */
    public function addPostSubmit(){
        if(request()->isPost()){
           $data = input('post.',"","trim");

            $model = \app\common\model\Module::where('id',$data['module_id'])->find();
            // 查询字段是否已录入field 表
            $field = \app\common\model\Field::where('field',$data['field'])->where('module_id',$data['module_id'])->find();
           
            if($field){
              return $this->error($model['module_name'].'模块中已存在:'.$data['field'].'字段，重新提交');
            }
            // 查询字段是否已在表中存在
            $table_name = config('database.connections.mysql.prefix').$model['table_name'];
            
            if(getTableFields($table_name,$data['field']) === false){
                $addsql = $this->getFieldTableDataSql($data,'add');
            }
             
             if (isset($data['setup'])) {
                 $data['setup'] = arrayCodeString($data["setup"]);
             }
           
            $result = \app\common\model\Field::add($data);
             if($result['code']){
                 
                if(isset($addsql) && !empty($addsql)){
                     if(is_array($addsql)){
                         foreach($addsql as $sql){
                             try{
                                Db::execute($sql);
                             }catch(\Exception $e){
                                $this->error($e->getMessage().'<br><br>[SQL]: '.$sql);
                             }
                         }
                     }else{
                         try{
                             Db::execute($addsql);
                         }catch(\Exception $e){
                             $this->error($e->getMessage().'<br><br>[SQL]: '.$addsql);
                         }
                    } 
                }
                $this->success($result['msg']);
             }else{
                $this->error('添加失败');
             }
        }
    }

    public function edit($id)
    {
        $model = \app\common\model\Module::getCommonList([
        'field' => 'id,module_name,table_name',
        'pages' => "",
        'json'  => false
        ]);
        $items = \app\common\model\Field::where('id',$id)->find();
        if($items['setup']){
            $items['setup'] = stringCodeArray($items['setup']);
        }
        
        $dict = \app\common\model\DictionaryType::field('id,name,remake')->select();
        View::assign([
            'dict'       => $dict,
            'module_id'  => $items['module_id'],
            'field'      => $items['field'],
            'type'       => $items['type'],
            'items'      => $items,
            'model'      => $model,
            'tab_id'     => $items['tab_id']
        ]);
        
        return View::fetch('field_form');
    }

    /**
     *  编辑处理
     */
    public function editPostSubmit(){
        
        if(request()->isPost()){
            $data = input('post.',"","trim");
         
            $data['is_list']   = $data['is_list'] ?? 0;
            $data['is_add']    = $data['is_add'] ?? 0;
            $data['is_edit']   = $data['is_edit'] ?? 0;
            $data['is_search'] = $data['is_search'] ?? 0;
            $data['is_sort']   = $data['is_sort'] ?? 0;

            $old_field = $data['old_field'];
            // 查询字段是否已在表中存在
            $model = \app\common\model\Module::where('id',$data['module_id'])->find();
            $table_name = config('database.connections.mysql.prefix').$model['table_name'];
            // 新的字段已被存在于表中
            if(getTableFields($table_name,$data['field']) && $old_field != $data['field']){
                $this->error($table_name.'表中已存在:'.$data['field'].'字段，重新提交');
            }
            // 旧字段不在数据表中
            if(getTableFields($table_name,$old_field) === false){
                $this->error($table_name.'表中不存在:'.$old_field.'字段，重新提交');
            }

            $fieldsql = $this->getFieldTableDataSql($data,'edit');

            if($data['setup']){
                $data['setup'] = arrayCodeString($data['setup']);
            }

            $result = \app\common\model\Field::edit($data);

            if($result['code']){
                if(!empty($fieldsql)){
                    if(is_array($fieldsql)){
                        foreach ($fieldsql as $sql){
                            try {
                                Db::execute($sql);
                            }catch (\Exception $e){
                                $this->error($e->getMessage().'<br><br>[SQL]: '.$sql);
                            }
                        }

                    }else{
                        try {
                            Db::execute($fieldsql);
                        }catch (\Exception $e){
                            $this->error($e->getMessage().'<br><br>[SQL]: '.$fieldsql);
                        }
                    }
                }
                $this->success($result['msg']);
            }else{
                $this->error('修改失败');
            }
        }
    }


    /**
     * 表格json
     * */
    public function getList()
    {
        $model = '\app\common\model\\'.$this->model_name;
        $page = input('get.page') ?? 1;
        $limit = input('get.limit') ?? 10;
        $is_asc = input('get.is_asc') ?? 'desc';
        $order_field = input('get.order_field') ?? 'id';
        /** */
        $where = request()->except(['page','limit','order_field','is_asc'],'get') ?? [];
        $data = \app\common\model\Field::getList($where,[$order_field => $is_asc],$page,$limit);

        $count = \app\common\model\Field::getCount('id',$where);
        return jsonData($data,$count);
    }
    /**
     * 字段设置
     */
    public function typeSetup($module_id=0,$type='',$field=''){
        
        if(request()->isAjax()){
            if($field){
                $field_item = \app\common\model\Field::where('module_id',$module_id)->where('field',$field)->find();
                
                if($field_item['setup']){
                    $field_item['setup'] = stringCodeArray($field_item['setup']);
                }
            }else{
                $field_item = null;
            }
            View::assign(input('param.'));
            View::assign('field_item',$field_item);
            return View::fetch('type');
        }
    }

    public function gettab($mid=0){
          
            if($mid){
                 $res = \app\common\model\FieldTab::with(['module'])->where('module_id',$mid)->field('id,module_id,name')->select();
            }else{
                $res = null;
            }
           if(!$res->isEmpty()){
              foreach($res as $k => $v){
                $res[$k]['module_id'] = $v->module->module_name;
              }
           }
          
            View::assign([
                'fieldTab' => $res,
                'tid'   => input('param.tid')
            ]);
            return View::fetch('tab');
        
    }

    /**
     * 获取要执行的sql
     */
    public function getFieldTableDataSql($item,$operate='add')
    {
        $name = $item['name'];
        $type = $item['type'];
        if (isset($item['setup']['fieldtype'])) {
            // 转换大写
            $fieldtype = strtoupper($item['setup']['fieldtype']);
        }
        $module_id = $item['module_id'];
    
        $default   = $item['setup']['default'] ?? 0;
        $field     = $item['field'];
        
        $model = \app\common\model\Module::find($module_id);
        $table_name = config('database.connections.mysql.prefix').$model['table_name'];
        $pk   = $model['pk'];
        $maxlength  = intval($item['maxlength']);
      //  $minlength  = intval($item['minlength']);

        if($operate == 'add'){
            $operate = ' ADD ';
        }else{
            $operate = " CHANGE `".$item['old_field']."` ";
        }
   
        switch($type)
        {
            case 'text':
                $fieldtype = $fieldtype ?? 'VARCHAR';
                if($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR'){
                    if (!$maxlength) {
                        $maxlength = 255;
                    }
                    $maxlength = min($maxlength, 255);
                    $sql = "ALTER TABLE `{$table_name}` $operate `{$field}` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                }else{
                    $sql = "ALTER TABLE `$table_name` $operate `{$field}` TEXT NULL COMMENT '$name'";
                }
                
                break;
            case 'tags':
                    $fieldtype = $fieldtype ?? 'VARCHAR';
                    if($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR'){
                        if (!$maxlength) {
                            $maxlength = 255;
                        }
                        $maxlength = min($maxlength, 255);
                        $sql = "ALTER TABLE `{$table_name}` $operate `{$field}` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                    }else{
                        $sql = "ALTER TABLE `$table_name` $operate `{$field}` TEXT NULL COMMENT '$name'";
                    }
                    
                break;    
            case 'textarea':
                $fieldtype = $fieldtype ?? 'VARCHAR';
                if($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR'){
                    if (!$maxlength) {
                        $maxlength = 255;
                    }
                    $maxlength = min($maxlength, 255);
                    $sql = "ALTER TABLE `{$table_name}` $operate `{$field}` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                }else{
                    $sql = "ALTER TABLE `$table_name` $operate `{$field}` TEXT NULL COMMENT '$name'";
                }
                
                break;
            case 'editor':
                    $fieldtype = $fieldtype ?? 'TEXT';
                    if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                        if (!$maxlength) {
                            $maxlength = 255;
                        }
                        $maxlength = min($maxlength, 255);
                        $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                    } else {
                        $sql = "ALTER TABLE `$table_name` $operate `$field` TEXT NULL COMMENT '$name'";
                    }
                break;
            case 'radio':
                $fieldtype = $fieldtype ?? 'VARCHAR';
                if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                    if (!$maxlength) {
                        $maxlength = 255;
                    }
                    $maxlength = min($maxlength, 255);
                    $sql       = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                } else {
                    $default = $default !== '' ? intval($default) : 0;
                    if (!$maxlength) {
                        $maxlength = 10;
                    }
                    $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) UNSIGNED NOT NULL DEFAULT '$default' COMMENT '$name'";
                }
                break;
            case 'checkbox':
                $fieldtype = $fieldtype ?? 'VARCHAR';
                if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                    if (!$maxlength) {
                        $maxlength = 255;
                    }
                    $maxlength = min($maxlength, 255);
                    $sql       = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                } else {
                    $default = $default !== '' ? intval($default) : 0;
                    if (!$maxlength) {
                        $maxlength = 10;
                    }
                    $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) UNSIGNED NOT NULL DEFAULT '$default' COMMENT '$name'";
                }
                break;
            
            case 'image':
                    $fieldtype = $fieldtype ?? 'VARCHAR';
                    if ($fieldtype == 'VARCHAR') {
                        if (!$maxlength) {
                            $maxlength = 80;
                        }
                        $maxlength = min($maxlength, 255);
                        $sql       = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                    } else {
                        $sql = "ALTER TABLE `$table_name` $operate `$field` TEXT NULL COMMENT '$name'";
                    }
                    break;
            case 'images':
                    $fieldtype = $fieldtype ?? 'VARCHAR';
                    if ($fieldtype == 'VARCHAR') {
                        if (!$maxlength) {
                            $maxlength = 255;
                        }
                        $maxlength = min($maxlength, 255);
                        $sql       = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                    } else {
                        $sql = "ALTER TABLE `$table_name` $operate `$field` TEXT NULL COMMENT '$name'";
                    }
                    break;

            case 'date':
                        $fieldtype = $fieldtype ?? 'INT';
                        if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                            if (!$maxlength) {
                                $maxlength = 255;
                            }
                            $maxlength = min($maxlength, 255);
                            $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                        } else {
                          
                            $default = $default !== '' ? intval($default) : 'NULL';
                            if (!$maxlength) {
                                $maxlength = 11;
                            }
                            $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) UNSIGNED NULL DEFAULT $default COMMENT '$name'";
                        }
                    break;
            case 'time':
                        $fieldtype = $fieldtype ?? 'INT';
                        if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                            if (!$maxlength) {
                                $maxlength = 255;
                            }
                            $maxlength = min($maxlength, 255);
                            $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                        } else {
                            $default = $default !== '' ? intval($default) : 'NULL';
                            if (!$maxlength) {
                                $maxlength = 10;
                            }
                            $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) UNSIGNED NULL DEFAULT $default COMMENT '$name'";
                        }
                    break;
            case 'datetime':
                        $fieldtype = $fieldtype ?? 'INT';
                        if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                            if (!$maxlength) {
                                $maxlength = 255;
                            }
                            $maxlength = min($maxlength, 255);
                            $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                        } else {
                            $default = $default !== '' ? intval($default) : 'NULL';
                            if (!$maxlength) {
                                $maxlength = 10;
                            }
                            $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) UNSIGNED NULL DEFAULT $default COMMENT '$name'";
                        }
                    break;
            case 'file':
                        $fieldtype = $fieldtype ?? 'VARCHAR';
                        if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                            if (!$maxlength) {
                                $maxlength = 80;
                            }
                            $maxlength = min($maxlength, 255);
                            $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                        } else {
                            $sql = "ALTER TABLE `$table_name` $operate `$field` TEXT NULL COMMENT '$name'";
                        }
                    break;
            case 'files':
                        $fieldtype = $fieldtype ?? 'VARCHAR';
                        if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                            if (!$maxlength) {
                                $maxlength = 255;
                            }
                            $maxlength = min($maxlength, 255);
                            $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                        } else {
                            $sql = "ALTER TABLE `$table_name` $operate `$field` TEXT NULL COMMENT '$name'";
                        }
                    break;
            case 'select':
                $fieldtype = $fieldtype ?? 'VARCHAR';
                if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                    if (!$maxlength) {
                        $maxlength = 255;
                    }
                    $maxlength = min($maxlength, 255);
                    $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                } elseif ($fieldtype == 'INT' || $fieldtype == 'TINYINT') {
                    $default = $default !== '' ? intval($default) : 0;
                    if (!$maxlength) {
                        $maxlength = $fieldtype == 'INT' ? 10 : 4;
                    }
                    $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) UNSIGNED NOT NULL DEFAULT '$default' COMMENT '$name'";
                } else {
                    $sql = "ALTER TABLE `$table_name` $operate `$field` TEXT NULL COMMENT '$name'";
                }

                break;
                case 'number':
                    $fieldtype = $fieldtype ?? 'INT';
                    if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                        if (!$maxlength) {
                            $maxlength = 255;
                        }
                        $maxlength = min($maxlength, 255);
                        $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                    } else {
                        $default = $default !== '' ? intval($default) : 0;
                        if (!$maxlength) {
                            $maxlength = 10;
                        }
                        if ($fieldtype == 'FLOAT' || $fieldtype == 'DECIMAL' || $fieldtype == 'DOUBLE') {
                            $point     = isset($info['setup']['point']) && $info['setup']['point'] !== '' ? $info['setup']['point'] : '0';
                            $maxlength = $maxlength . ',' . $point;
                        }
                        $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) UNSIGNED NOT NULL DEFAULT '$default' COMMENT '$name'";
                    }
                    break;
                case 'password':
                    $fieldtype = $fieldtype ?? 'VARCHAR';
                    if ($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR') {
                        if (!$maxlength) {
                            $maxlength = 255;
                        }
                        $maxlength = min($maxlength, 255);
                        $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                    } else {
                        $sql = "ALTER TABLE `$table_name` $operate `$field` TEXT NULL COMMENT '$name'";
                    }
                    break;
            case 'hidden':
                $fieldtype = $fieldtype ?? 'VARCHAR';
                if ($fieldtype == 'VARCHAR' ) {
                    if (!$maxlength) {
                        $maxlength = 255;
                    }
                    $maxlength = min($maxlength, 255);
                    $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                    // mediumtext
                } elseif($fieldtype == 'TEXT' ){
                    $sql = "ALTER TABLE `$table_name` $operate `{$field}` TEXT NULL COMMENT '$name'";
                }elseif($fieldtype == 'MEDIUMTEXT' ){
                    $sql = "ALTER TABLE `$table_name` $operate `{$field}` MEDIUMTEXT NULL COMMENT '$name'";
                } else {
                    if (!$maxlength) {
                        $maxlength = 11;
                    }
                    $default = $default !== '' ? intval($default) : 0;
                    // 主键字段自增
                    if ($pk == $field) {
                        $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '$name'";
                    } else {
                        $sql = "ALTER TABLE `$table_name` $operate `$field` $fieldtype( $maxlength ) UNSIGNED NOT NULL DEFAULT '$default' COMMENT '$name'";
                    }
                }
                break;
            case 'pinyin':
                $fieldtype = $fieldtype ?? 'VARCHAR';
                if($fieldtype == 'VARCHAR' || $fieldtype == 'CHAR'){
                    if (!$maxlength) {
                        $maxlength = 255;
                    }
                    $maxlength = min($maxlength, 255);
                    $sql = "ALTER TABLE `{$table_name}` $operate `{$field}` $fieldtype( $maxlength ) NOT NULL DEFAULT '$default' COMMENT '$name'";
                }else{
                    $sql = "ALTER TABLE `$table_name` $operate `{$field}` TEXT NULL COMMENT '$name'";
                }
                break;

        }
       
        return $sql;
          

    }
   
    
}
