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
 *2022-04-08 12:03:50
 *作者：老胡
 *文件描述：基类model
 */

namespace app\common\model;

use think\Model;

class Base extends Model
{
    
     // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;

      // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    // 获取分页数据
    public static function getCommonList($config){
      // 查询参数
      $configs = [
        'where'   => [],
        'order'   => ['id' => 'desc'],
        'field'   => "*",
        'pages'   => ['page' => 0, 'limit' => 10], 
        'count'   => 'id',
        'json'    => true
      ];
      foreach($config as $k => $v){
          if($k){
            $configs[$k] = $v;
          }
      }
      // 是否返回 json 数据格式 
      if($configs['json']){
          $result = self::field($configs['field'])->order($configs['order'])->page($configs['pages']['page'],$configs['pages']['limit'])->select();
          $count_data = self::getCount($configs['count']);  
          return jsonData($result,$count_data);
      }else{
          $result = self::field($configs['field'])->where($configs['where'])->order($configs['order'])->select()->toArray();
          return $result;
      }
  
    }

    public static function getListData($where=[],$pagenum=1,$order = ['sort', 'id' => 'desc'])
    {
        $model = new static();
        $table_name= substr($model->getTable(),"3"); // 返回不包含表前缀的数据表名
        $model = $model->alias($model->getName());
        // 根据表名获取字段
        $module_id  = \app\common\model\Module::where('table_name', $table_name)->value('id');
        
        $fileds    = \app\common\model\Field::where('module_id', $module_id)->select()->toArray();

        

        $list_info   = [];  // 字段根据关联信息重新赋值
        $with_info   = [];  // 模型关联信息
        $field_info = [];  // 字段包含.的时候从关联模型中获取数据

        foreach($fileds as $f){
            if($f['source'] == 2){
                $list_info[] = [
                    'field'          => $f['field'],
                    'relation_model' => lcfirst($f['relation_model']),
                    'relation_field' => $f['relation_field'],
                ];
                $with_info[] = lcfirst($f['relation_model']); // 首字母小写
            }
            
            
            // 字段包含.的时候从关联模型中获取数据
            if (strpos($f['field'], '.') !== false) {
                $filedArr    = explode('.', $f['field']);
                $field_info[] = [
                    'field'          => $f['field'],
                    'relation_model' => lcfirst($filedArr[0]),
                    'relation_field' => $filedArr[1],
                ];
            }
        }

        if($with_info){
            $model = $model->with($with_info);
        }
        if(!empty($pagenum)){
            $pagelist = input('param.limit');
            $list = $model->where($where)->order($order)->page($pagenum,$pagelist)->select();
        }else{
            $list = $model->where($where)->order($order)->select();
        }
    
        foreach($list as $v){
            foreach ($list_info as $vv) {
                $v[$vv['field']] = !empty($v->{$vv['relation_model']}) ? $v->{$vv['relation_model']}->getData($vv['relation_field']) : '';
            }
            foreach ($field_info as $vv) {
                $v[$vv['field']] = !empty($v->{$vv['relation_model']}) ? $v->{$vv['relation_model']}->getData($vv['relation_field']) : '';
            }
            if(isset($v['recommend_id']) && !empty($v['recommend_id'])){
                $v['title'] = "<span style='color:#dc3545'>[".$v['recommend_id']."] </span>".$v['title'];
             }
        }
     
       return $list;
    }

    // 获取统计数据
    public static function getCount($count='id',$where=[]){
      $result = self::where($where)->count($count);
      return $result;
    }

     // 通用添加保存
    public static function add($data){
      if($data){
        foreach($data as $k => $v){
          if(is_array($v)){
            $data[$k] = implode(',',$v);
          }
        }
      }
      $result = self::create($data);
      if ($result) {
          return ['code' => 1, 'msg' => '添加成功'];
      } else {
          return ['code' => 0, 'msg' => '添加失败'];
      }
       
    }

    // 通用修改数据
    public static function edit($data)
    {
        if($data){
            foreach($data as $k => $v){
                if(is_array($v)){
                    $data[$k] = implode(',',$v);
                }
            }
        }
        $result = self::update($data);
        if ($result) {
            return ['code' => 1, 'msg' => '修改成功'];
        } else {
            return ['code' => 0, 'msg' => '修改失败'];
        }
    }

    /**
     * 删除
     */
    public static function del($id,$pk='id'){
        if($id){
           $res = self::where($pk,'=',$id)->delete();
            if ($res) {
                return ['code' => 1, 'msg' => '删除成功'];
            } else {
                return ['code' => 0, 'msg' => '删除失败'];
            }
        }
    }
    /**
     * 批量删除
     */
    public static function delAll($id,$pk='id'){
        if($id){
            $id = explode(",",$id);
            $res = self::where($pk,'in',$id)->delete();
            if ($res) {
                return ['code' => 1, 'msg' => '删除成功'];
            } else {
                return ['code' => 0, 'msg' => '删除失败'];
            }
        }
    }
    /** 
     * 修改单个字段值
     *  
     * */
    public static function editOneField($id,$name,$value){
        $res = self::find($id);
        $res->$name = $value;
        $result =  $res->save();
        
        if ($result) {
            return ['code' => 1, 'msg' => '修改成功'];
        } else {
            return ['code' => 0, 'msg' => '修改失败'];
        }
    }
    
}
