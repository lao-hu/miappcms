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

 class Admin extends Base{
    
     public static function getListData($where = [], $pagenum = 1, $order = ['sort', 'id' => 'desc'])
     {
         if(empty($pagenum)){
            $limit = input('get.limit');
            $res = self::where($where)->order($order)->page($pagenum,$limit)->select();
         }else{
            $res = self::where($where)->order($order)->select();
         }
         foreach($res as $k => $v){
            $group_id = \app\common\model\AdminGroupAccess::where('uid',$v->id)->value('group_id');
            if($group_id){
                $res[$k]['group_name'] =  \app\common\model\AdminGroup::where('id',$group_id)->value('name');
           
            }
         }
         return $res;
     }
 }

