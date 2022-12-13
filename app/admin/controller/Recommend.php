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
 *2022-09-11 11:06:00
 *作者：老胡
 *文件描述：推荐位管理数据表
 */
namespace app\admin\controller;

use app\common\components\Form;
use app\common\facade\BackendRun;
use think\facade\View;

class Recommend extends BackendBase{
    // 模型
    protected $model_name = 'Recommend';
    // 表名
    protected $table_name = 'recommend';
}

