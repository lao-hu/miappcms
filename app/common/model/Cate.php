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
 *2022-07-06 11:36:05
 *作者：老胡
 *文件描述：栏目模块
 */

namespace app\common\model;

class Cate extends Base{
     /**
          *  附表关联主表称为反向关联，又称为相对关联
          $this->belongsTo('关联模型'，当前模型关键，)
     */ 
    public function module()
    {
        return $this->belongsTo('Module','module_id');
    }

    public static function getListData($where = [], $pagenum = 1, $order = ['sort', 'id' => 'desc'])
    {
        $result = self::with(['module'])->where($where)->order($order)->select();

        foreach($result as $key => $value)
        {
            $result[$key]['module_id'] = $value->module->module_name;
        }
      
        return $result;
    }

    /**
     * 获取父ID选项
     */
    public static function getPids($where='' ){
        $res = self::where($where)->order(['id'=>'desc'])->select()->toArray();
     
        $res = tree_cate($res);
        $list = [];
        foreach($res as $k => $v){
            $list[$v['id']] = $v['ltitle'];
        }
        return $list;
    }
}

