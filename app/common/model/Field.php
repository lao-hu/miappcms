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
 *2022-04-10 11:19:33
 *作者：老胡
 *文件描述：用户
 */

 namespace app\common\model;

 class Field extends Base{
     //  一对一获取所属模块
     public function module(){
         return $this->belongsTo('Module','module_id');
     }
     //  一对一获取所属模块
     public function dictionarytype(){
         return $this->belongsTo('DictionaryType','dict_id');
     }

     /** 字段列表 */
     public static function getList($where=[],$order=[],$page,$limit){
         $order = empty($order) ? ['id'=>'desc'] : $order;
         $res = self::with(['module','dictionarytype'])->where($where)->order($order)->page($page,$limit)->select();
         foreach($res as $k => $v){
            $res[$k]['module_id'] = $v->module->getData('module_name');
            $res[$k]['table_name'] = $v->module->getData('table_name');
        
            if(!empty($v->dictionarytype)){
                $res[$k]['dict_id'] = '<span class="layui-badge badge-btn-3">'.$v->dictionarytype->getData('name').'</span>';
            }
         }
         return $res;
     }
 }

