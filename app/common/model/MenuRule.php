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
 *2022-04-13 15:26:54
 *作者：老胡
 *文件描述：菜单规则
 */
namespace app\common\model;

class MenuRule extends Base{

    public static function getListData($where=[],$pagenum=1,$order = ['sort', 'id' => 'desc']){
        
        if(!empty($pagenum)){
            $pagelist = input('param.limit');
            $result = self::where($where)->order($order)->page($pagenum,$pagelist)->select()->toArray();
        }else{
            $result = self::where($where)->order($order)->select()->toArray();
        }

        foreach($result as $k => $v){
            if($v['icon']){
               $result[$k]['icon'] = "<i class='{$v['icon']}' aria-hidden='true'></i>";
            }
           
        }
        return $result;
    }
    // 

    /**
     * 获取父ID选项
     */
    public static function getPids(){
        $res = self::order(['id'=>'desc'])->select()->toArray();
        $res = trees($res);
        $list = [];
        foreach($res as $k => $v){
            $list[$v['id']] = $v['ltitle'];
        }
        return $list;
    }
}
