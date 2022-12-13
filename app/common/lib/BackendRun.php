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
 *文件描述：处理表和字段相关数据 等。
 */
namespace app\common\lib;

use app\common\model\Dictionary;
use app\common\model\Field;
use app\common\model\Module;
use think\exception\ValidateException;
use think\facade\Db;
use think\facade\View;

class BackendRun
{
  public $result = [
    'table_html_top'        => '', // 数据表格头部自定义代码
    'table_html_header'     => '', // 数据表头自定义代码
    'table_html_bottom'     => '',  //数据表格底部自定义代码
    'table_js_header'              => ''
  ];
   /**
     * 获取添加页面可展示的字段信息
     * @param string $table_name 表名称
     * @return array
     */
    public function getFormAddColumns($table_name,$item='')
    {
       $module = Module::where('table_name',$table_name)->find();
         $model = "\app\common\model\\".$module->model_name;
         $user   = new $model;
         $pk     = $user->getPk();
 
       $fields = $this->getFileds($table_name);
      
       $forms = [];

       foreach ($fields as $field){
           // 主键不可新增，当方法名中包含add时系统认为是新增页面，应跳过主键字段
           if(strpos(strtolower(request()->action()),'add') !== false && $field['field'] == $module['pk']){
               continue;
           }
           // 非主键字段判断是否可添加
           if(strpos(strtolower(request()->action()),'add') !== false && $field['is_add'] != 1){
               continue;
           }
           // 非主键字段判断是否可修改
           if(strpos(strtolower(request()->action()),"edit") !== false && $field['is_edit'] != 1){
               continue;
           }
             // 状态为0的字段不可新增或修改
           if ($field['status'] == 0) {
               continue;
           }
           // 补全修改页面字段的默认值
           if($item){
               if(isset($item[$field['field']])){
                 $field['setup']['default'] = $item[$field['field']] ?? $field['setup']['default'];
               }
           }
           $options =  $this->getFiledDictionary($field);
          
     
           $field['option'] = $options ?? []; 
 
         //  添加到返回数组中
         if($field['type'] == 'text' ){
             // text 
             $forms[] = [
                 $field['type'],                // 类型
                 $field['field'],               // 字段名称
                 $field['name'],                // 字段别名
                 $field['tips'],                // 提示信息
                
                !empty( $field['setup']['default']) ? $field['setup']['default'] : '',    // 默认值
                 $field['setup']['css'],// 额外CSS
                 $field['setup']['placeholder'],// 占位符
                 $field['required'],            // 是否必填
             ];
    
         }elseif($field['type'] == 'tags'){
            $forms[] = [
                $field['type'],                // 类型
                $field['field'],               // 字段名称
                $field['name'],                // 字段别名
                $field['tips'],                // 提示信息
                !empty( $field['setup']['default']) ? $field['setup']['default'] : '',    // 默认值
                $field['setup']['css'],// 额外CSS
                $field['setup']['placeholder'],// 占位符
                $field['required'],            // 是否必填
            ];
         }elseif($field['type'] == 'radio' || $field['type'] == 'checkbox'){
             $forms[] = [
                 $field['type'],                // 类型
                 $field['field'],               // 字段名称
                 $field['name'],                // 字段别名
                 $field['tips'],                // 提示信息
                 $field['option'],
                 $field['setup']['default'],    // 默认值
                 $field['setup']['css'] ?? '',// 额外CSS
                 $field['required'],            // 是否必填
             ];
            
         }elseif($field['type'] == 'textarea' || $field['type'] == 'password'){
             $forms[] = [
                 $field['type'],                // 类型
                 $field['field'],               // 字段名称
                 $field['name'],                // 字段别名
                 $field['tips'],                // 提示信息
                 !empty( $field['setup']['default']) ? $field['setup']['default'] : '',    // 默认值
                 $field['setup']['css'] ?? '',// 额外CSS
                 $field['setup']['placeholder'] ?? '', // 占位符
                 $field['required'],            // 是否必填
             ];
         }elseif ($field['type'] == 'select') {
             $forms[] = [
                 $field['type'],                       // 类型
                 $field['field'],                      // 字段名称
                 $field['name'],                       // 字段别名
                 $field['tips'],                       // 提示信息
                 $field['option'],                    // 选项（数组）
                 $field['setup']['default'],           // 默认值
                 $field['setup']['css'] ?? '',           // 额外CSS
                 $field['required'],                   // 是否必填
             ];
         }elseif ($field['type'] == 'number') {
             $forms[] = [
                 $field['type'],                // 类型
                 $field['field'],               // 字段名称
                 $field['name'],                // 字段别名
                 $field['tips'],                // 提示信息
                 $field['setup']['default'] ?? '',    // 默认值
                 $field['setup']['css'] ?? '',// 额外CSS
                 $field['setup']['placeholder'] ?? '', // 占位符
                 $field['required'],            // 是否必填
             ];
         }elseif ($field['type'] == 'hidden') {
             $forms[] = [
                 $field['type'],                // 类型
                 $field['field'],               // 字段名称
                 $field['setup']['default'] ?? '',    // 默认值
                 $field['setup']['css'] ?? '',// 额外CSS
             ];
         }elseif($field['type'] == 'image' || $field['type'] == 'images' || $field['type'] == 'file' || $field['type'] == 'files'){
             // 多(图/文件)上传执行解析操作
             if ($field['type'] == 'images' || $field['type'] == 'files') {
                 $field['setup']['default'] = json_decode($field['setup']['default'], true);
             }
             if($field['setup']['ext']){
                $field['setup']['ext'] = str_replace(",","|", $field['setup']['ext']);
             }

             $forms[] = [
                     $field['type'],                       // 类型
                     $field['field'],                      // 字段名称
                     $field['name'],                       // 字段别名
                     $field['tips'],                       // 提示信息
                     $field['setup']['default'] ?? '',           // 默认值
                     $field['setup']['css'] ?? '',         // 额外CSS
                     $field['setup']['size'] ?? 0,        // 图片大小
                     $field['setup']['ext']  ?? '',        // 图片格式

                     $field['setup']['placeholder'] ?? '', // 占位符
                     $field['required'],                   // 是否必填
                 ];
         }elseif($field['type'] == 'editor'){
             // 编辑器
             $forms[] = [
                 $field['type'],                // 类型
                 $field['field'],               // 字段名称
                 $field['name'],                // 字段别名
                 $field['tips'],                // 提示信息
                 !empty( $field['setup']['default']) ? $field['setup']['default'] : '',    // 默认值
                 $field['setup']['css'] ?? '',// 额外CSS
                 $field['setup']['height'] ?? 0, 
                 $field['required'],            // 是否必填
             ];
         }elseif($field['type'] == 'date' || $field['type'] == 'time' || $field['type'] == 'datetime'){
             
            
             $forms[] = [
                 $field['type'],                // 类型
                 $field['field'],               // 字段名称
                 $field['name'],                // 字段别名
                 $field['tips'],                // 提示信息
                 $field['setup']['default'] ?? '',    // 默认值
                 $field['setup']['css'] ?? '',// 额外CSS
                 $field['setup']['format'],  // 时间格式
                 $field['required'],            // 是否必填
             ];
         }elseif ($field['type'] == 'pinyin'){
             // 拼音
             $forms[] = [
                 $field['type'],                // 类型
                 $field['field'],               // 字段名称
                 $field['name'],                // 字段别名
                 $field['tips'],                // 提示信息
                 !empty( $field['setup']['default']) ? $field['setup']['default'] : '',    // 默认值
                 $field['setup']['css'],// 额外CSS
                 $field['setup']['placeholder'],// 占位符
                 $field['setup']['delimiter'],  // 分隔符
                 $field['setup']['pinyintype'], // 拼音类型
                 $field['setup']['pinyinfield'],
                 $field['required'],            // 是否必填
             ];
         }

 
       }
       return $forms;
     
    }

    /**
     * 获取字段的对应的字典值
     * @param array $field 字段信息
     * @return array
     */
    public function getFiledDictionary($field)
    {
        // 0 字段本身，1 字典，2 模型
      //  halt($field->toArray());   
        if($field['source'] == 1){

            $result = Dictionary::where('dict_id',$field['dict_id'])
                ->field('value,name')
                ->order(['sort'=>'ASC','id'=>'DESC'])
                ->select()
                ->toArray();
            
            if($result){
                $result = changeArray($result);
            }
        }elseif($field['source'] == 2){
            $model = '\app\common\model\\' . $field['relation_model'];
            // 根据模型名称获取select的排序
            $module = Module::where('id',$field['module_id'])->find();
           
            // 获取主键
            $pk =  $module->pk ?? 'id';
            $info = Field::where('module_id',$module->id)->find();
            if($info){
                $order = 'sort asc,'.$pk.' desc';
            }else{
                $order = $pk.'desc';
            }
             // 当模块中包含pid/parent_id时格式化展示效果
            $field_pid = '';
             $moduleid = Module::where('model_name',$field['relation_model'])->value('id');

            if($moduleid){
                $item = Field::where("field = 'pid' OR field = 'parent_id'")->where('module_id',$moduleid)->field('field')->find();
                if($item){
                    $field_pid = ",".$item->field;
                }
            }
             // 获取数据列表
            $result = $model::order($order)->field("{$pk},{$field['relation_field']} {$field_pid}")->select();
                
               if($result){
                   $result = changeArray($result->toArray());
                 
                 // 针对栏目ID字段处理
                 if ($field['field'] == 'cate_id') {
                    $idArr     = \app\common\model\Cate::where('module_id', $field['module_id'])->column('id');
                    $resultNew = [];
                    foreach ($result as $k => $v) {

                        $resultNew[$k] = [
                            'id'      => $k,
                            'name'    => $v,
                            'disabled' => in_array($k, $idArr) == true ? 0 : 1
                        ];
                    }
                    $result = $resultNew;
                 }
             }
        }
        return $result ?? [];
    }

    /** 
      * 获取 字段信息 
    */
    public function getFileds($table_name,$where=[],$order=['sort'=>'asc','id'=>'asc']){
      $module = Module::where('table_name',$table_name)->find();
      $fields = [];
      if($module){
          $fields = Field::where('module_id',$module['id'])->where($where)->order($order)->select()->toArray();
          foreach ($fields as &$field) {
              // 给每个字段增加一个属性：是否主键
              $field['is_pk'] = $field['field'] == $module['pk'] ? 1 : 0;
              // 格式化字段的其他设置

              $field['setup'] = stringCodeArray($field['setup']);

          }
      }

      return $fields ?: "";
    }

    /**
     * 获取列表页面可展示的字段信息
     * @param string $table_name 表名称
     * @return array
    */
    public function getListDataShow($table_name){
        $columns = [];
        $fields  = $this->getFileds($table_name);
        foreach($fields as $field)
        {
            // 筛选可排列且状态不为0的字段
            if($field['is_list']!= 1 || $field['status'] == 0){
              continue;
            }
            // 获取字典列表
            $dicts = [];
            if($field['source'] == 1){
                $dicts =  Dictionary::where('dict_id',$field['dict_id'])->field("value,name")->select()->toArray();
                $dicts =  changeArray($dicts);
            }
          // 默认值
          $default = $field['setup']['default'] ?? '';
          // 额外CSS
          $class = $field['setup']['class'] ?? '';
          // 排序
          $sortable = $field['is_sort'] ? 'true' : 'false';
          // 添加到返回数组中
          $columns[]  = [
              'field' => $field['field'], // 字段名称
              'title'   => $field['name'], // 字段别名
              'type'   => $field['type'], // 字段类型
              'default'   => $default, // 字段别名
              'dict'   => $dicts, // select等需要获取数据的字段需设置好 param 或考虑是否变更字段(字典类型的在这里获取，关联的在模型里重构该字段)
              'class'   => $class, //   额外CSS
              'is_sort'   => $sortable, //  排序
              ];
        } 
       return $columns;
    }

    
   
    // 获取主键
    public function getPk($table_name){
      $res = Module::where('table_name',$table_name)->value('pk');
      return $res;
  }

  /**
   * 监测判断单页
   */
  public function issingle($model_name){
    $res = Module::where('model_name',$model_name)->find();
    $model = '\app\common\model\\'.$res->model_name;

    // 获取主键名称
    $pk = $this->getPk($res->table_name);

    if($res->issingle == 1){
        $info = $model::select();
        if(!$info->isEmpty()){
            return urlBuild('edit?id='.$info[0][$pk]);
        }else{
            return urlBuild('add'); 
        }
    }else{
        return "";
    }
  }

  /**
   * 添加/修改页面获取字段分组
   */
  public function getAddTabs($model_name,$columns){
    $res = Module::where('model_name',$model_name)->find();
    //
    $tab = \app\common\model\FieldTab::where('module_id',$res->id)->select();
    $info = $this->getFileds($res->table_name);
  
    $list = [];
   
    foreach($tab as $k => $v){
       foreach($info as $key => $val){
           if($v->id == $val['tab_id']){
            $list[$v['name']][] = $val['field'];
           }
       }
    }
    $item = [];
    foreach($list as $k => $v){
        foreach($columns as $kk =>$vv){
            if(in_array($vv[1],$v)){ 
               $item[$k][] = $vv;
            }
        }
    }
    return $item;
  }
 
    /**
     *  添加一个自定义右侧按钮
    */
   public function addCustomRightBtn($table,$buttons=[])
   {
    $model = Module::where('table_name',$table)->find();

    $item = explode(",",$model->right_button);
     $buttons = is_array($buttons) ? $buttons : explode(',', $buttons);
     $btn_arr = [];
    
    $btn_arr = [];
    $btn_item = [];

    foreach($item as $k => $v){
        if(!empty($v)){
            $btn_item[$v] =  addRightButtons($v);
        }
    }
   
    foreach ($buttons as $key => $value) {
        if (is_numeric($key)) {
            $btn_arr[$value] =  addRightButtons($value);
        } else {
            $btn_arr[$key] =  addRightButtons(trim($key), $value);
        }
    }
    $res = array_merge($btn_item,$btn_arr);

    return $res;
   }

   /**
     *  添加一个自定义顶部按钮
    */
    public function addCustomTopBtn($table,$buttons=[])
    {
        $model = Module::where('table_name',$table)->find();
        $item = explode(",",$model->top_button);
        $buttons = is_array($buttons) ? $buttons : explode(',', $buttons);

        $btn_arr = [];
        $btn_item = [];
         foreach($item as $k => $v){
            if(!empty($v)){
                $btn_item[$v] =  addTopButtons($v);
            }
         }
     
        foreach ($buttons as $key => $value) {
                if (is_numeric($key)) {
                    $btn_arr[$value] =   addTopButtons($value);
                 } else {
                   $btn_arr[$key] =  addTopButtons(trim($key), $value);
                 }
           
            
        }
        $res = array_merge($btn_item,$btn_arr);

        return $res;
    }

    /** 设置搜索框字段 */
    public function isSearchField($model_name){
         /** 搜索字段 */
        $module_id = \app\common\model\Module::where('model_name',$model_name)->value('id'); 
        $fields =  \app\common\model\Field::where('module_id',$module_id)->where('is_search',1)->select();
        
        $data = [];
        foreach($fields as $field)
        {
             // 格式化字段的其他设置
            $field['setup'] = stringCodeArray($field['setup']);
            /*** 获取字典数据 */
            $option = $this->getFiledDictionary($field);
            if($option){
                $data[] = [
                    'type'   => 'select',
                    'field'  =>  $field['field'],
                    'name'   =>  $field['name'],
                    'empty'  => $field['setup']['placeholder'] ?? '' ,
                    'option' => $option
                ];
            }else{
                $data[] = [
                    'type' => 'text',
                    'field'  =>  $field['field'],
                    'name'   =>  $field['name'],
                    'empty'  => $field['setup']['placeholder'] ?? '' ,
                    'option' => []
                ];
            }
        }
        return $data;
    }
    
    /** 数据表格头部自定义HTML */
    public function setTableHtml($html="",$tip="")
    {
        if(!empty($html)){
            $this->result['table_html_'.$tip] = $html;
        }
       return $this->result;
    }

    /** 数据表格自定义代码 */
    public function setJs($js="",$tip="")
    {
        if(!empty($js)){
            $this->result['table_js_'.$tip] = $js;
        }
        View::assign($this->result);
    }

    /** 生成文件 */
    public function makeGenerate($id="",$file=''){
       
        // 获取module 数据
        $info = Module::find($id);

        if(empty($info)){
            return json(['code'=>0,'msg'=>'数据不存在！！']);
        }
        if(in_array($info->model_name,$this->unmakeGenerate())){
            return json(['code'=>0,'msg'=>'该模块数据，为系统模块禁止生成！！！']);
        }
        if(!empty($file)){
            switch($file){
                /** 生成控制器 **/
                case 'controller':
                 $this->makecontroller($info,$file);
                 $msg = '控制器文件生成成功';
                break;
                /** 生成model 文件 */
                case 'model':
                 $this->makemodel($info,$file);  
                $msg = 'model文件生成成功'; 
                break;
            }
        }
        return ['code'=>1,'msg'=>$msg];
    }

    /** 不可生成的文件 */
    public function unmakeGenerate()
    {
        // 系统模块禁止生成
        return ['Field','Module','Cate','AdminLog','Admin','AdminGroup','MenuRule'];
    }
    /** 
     * 生成控制器文件
    */
    public function makecontroller($data,$filename=''){
        /** 获取文件  */
        $file = app_path().'controller'.DIRECTORY_SEPARATOR.$data->model_name.".php";
       // 取得模版文件
       $info = base_path().'common'.DIRECTORY_SEPARATOR.'lib'.DIRECTORY_SEPARATOR.'make'.DIRECTORY_SEPARATOR.$filename.'.tpl';
       // 读取文件模板内容
       $content =  file_get_contents($info);

       $content = str_replace('{$modelName}',$data->model_name,$content);
       $content = str_replace('{$tableName}',$data->table_name,$content);
       $content = str_replace('{$table_desc}',$data->table_desc,$content);
       $content = str_replace('{$author}',config('app.miappcms_author'),$content);
       $content = str_replace('{$time}',date("Y-m-d H:i:s",time()),$content);

       if($content){
           // 备份源文件
            $this->make_is_file($file);
            // 写入文件
          file_put_contents($file,$content);
       }
       return true;
    }
    /** 
     * 生成model文件
     */
    public function makemodel($data,$filename='')
    {
          /** 获取文件  */
        $file = base_path().'common'.DIRECTORY_SEPARATOR.'model'.DIRECTORY_SEPARATOR.$data->model_name.".php";
        // 取得模版文件
        $info = base_path().'common'.DIRECTORY_SEPARATOR.'lib'.DIRECTORY_SEPARATOR.'make'.DIRECTORY_SEPARATOR.$filename.'.tpl';

          // 读取文件模板内容
          $content =  file_get_contents($info);

          $content = str_replace('{$modelName}',$data->model_name,$content);
          $content = str_replace('{$tableName}',$data->table_name,$content);
          $content = str_replace('{$table_desc}',$data->table_desc,$content);
          $content = str_replace('{$author}',config('app.miappcms_author'),$content);
          $content = str_replace('{$time}',date("Y-m-d H:i:s",time()),$content);
          
        // 查询该表是否存在关联的字段
       $fields = Field::where('module_id',$data->id)->where('source', 2)->select();
       $relation = '';
       $relation_model = [];

       // PHP 的引用允许你用两个变量来指向同一个内容
       foreach($fields as &$field)
       {
        // 判断是否在这里面+
            if (in_array(lcfirst($field['relation_model']), $relation_model)) {
                break;
            }
            // 首字母小写
            $relationModel[] = lcfirst($field['relation_model']);
            $relation .=' public function '.lcfirst($field['relation_model']).'(){'.PHP_EOL.'  return $this->belongsTo(\''.$field['relation_model'].'\',\''.$field['field'].'\');'.PHP_EOL.'}'.PHP_EOL;
       }
    
       // 主键
       $pk = '';
       if($data['pk'] != 'id'){
        $pk = 'protected $pk ='."'{$data['pk']}';";
       }
       /** 替换model 表名 */
       $prefix = config('database.connections.mysql.prefix');
       $tablenames = '';
       $table_name_list = explode("_",$data->table_name);
       foreach($table_name_list as $v){
         $tablenames.= ucfirst($v);
       }
       if($data['model_name'] == $tablenames){
            $tableNameItem = '';
       }else{
        $tableNameItem = '  // 完整表名
        protected $table= '."'{$prefix}{$data['table_name']}';";
       }

      // 主键
       $content = str_replace('{$model_pk}',$pk,$content);
       // 数据表
       $content = str_replace('{$model_table}',$tableNameItem,$content);
       // 模型管理
       $content = str_replace('{$model_join}',$relation,$content);
        if($content){
            // 备份源文件
            $this->make_is_file($file);
            // 写入文件
            file_put_contents($file,$content);
        }
        return true;
    }
    /**
     * 判断是否存在某个文件，存在则更改文件名称做备份
     */
     public function make_is_file($file)
     {
        if(file_exists($file)){
            rename($file,$file.'_'.time().'.baks');
        }
     }
     /** 
      * 导出数据
      */
    public function export($data)
    {
        $module = \app\common\model\Module::where('table_name',$data['table'])->find();
         if(empty($module)){
            return ['code'=>0,'msg' => $data['table'].'数据表，不存在，请检查是否存在'];
         }
         // 表前缀
         $prefix = config('database.connections.mysql.prefix');
         // 完整表
         $tableName = $prefix.$module->table_name;
         // 取得所有表名称
         $field = \app\common\model\Field::where('module_id',$module->id)->where('is_list',1)->field('id,field,name,type')->select();
        /**  */
        // 开始日期
        $start = $data['start'] ?? '';
        // 结束日期
        $end = $data['end'] ?? '';
        $pk = 'id';
        if($module->pk != 'id'){
            $pk = $module->pk;
        }
        // 获取数据个数
        $count = Db::name($module->table_name)->count($pk);

        if($data['type'] == 'all'){
           $item = Db::name($module->table_name)->cursor(); 
        }else{
            // 时间查询
          $item = Db::name($module->table_name)->whereTime('create_time', 'between', [$start,$end])->select();
        }
        header('Content-Type: application/vnd.ms-excel;charset=utf-8');
        header('Content-Disposition: attachment;filename="'.date("YmdHis").'.xls"');
        header('Cache-Control: max-age=0');
        echo "<table>";
        echo "<tr>";
        foreach($field as $k => $v){ 
            echo "<td>{$v->name}</td>";
        }
        echo "</tr>";
        foreach($item as $key => $val)
        {   echo "<tr>";
            foreach($field as $ks =>$vs){
                echo "<td>{$val[$vs['field']]}</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    
    }

    /** 
     *  处理 保存 修改的表单数据
     */
    public function getformData($data,$table_name)
    {
        /** 获取字段数据 */
       $field = $this->getFileds($table_name);
    
       foreach($field as $k => $v){
         if($v['type'] == 'images' ||  $v['type'] == 'files'){
              $newdata = [];
              for($i=0;$i<count($data[$v['field']]);$i++)
              { 
                if($data[$v['field']][$i]){
                    $newdata[$i]['url']  = $data[$v['field']][$i];
                    $newdata[$i]['title'] = $data[$v['field'].'_title'][$i];
                }
              }
              $data[$v['field']] = json_encode($newdata);
              unset($data[$v['field'].'_title']);
         }
       }

      return $data;
    }

}
