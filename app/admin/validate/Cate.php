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
 *2022-08-26 20:11:57
 *作者：老胡
 *文件描述：
 */

namespace app\admin\validate;

use think\Validate;

class Cate extends Validate{

    /**
     * 定义验证规则
     * 格式：'字段名' =>  ['规则1','规则2'...]
     *
     * @var array
     */
    protected $rule = [
        'cate_name' => [
            'require',
            'chsAlphaNum'
        ],
        'cate_dirname' => [
            'require',
            'AlphaNum'
        ]
    ];
    protected $message = [
        'cate_dirname.require'  => '栏目目录不能为空',
        'cate_dirname.AlphaNum' => '栏目目录必须是字母，且不能包含特殊字符'
    ];
}
