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
 *2022-06-20 15:31:26
 *作者：老胡
 *文件描述：字段选项卡
 */

namespace app\common\model;

class FieldTab extends Base{
    
    public function module(){
         /**
          *  附表关联主表称为反向关联，又称为相对关联
          $this->belongsTo('关联模型'，当前模型关键，)
           */ 
        return $this->belongsTo('Module','module_id');
    }
}