<?php
declare (strict_types = 1);

namespace app\admin\validate;

use think\Validate;

class Login extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名' =>  ['规则1','规则2'...]
     *
     * @var array
     */
    protected $rule = [
        'user' => 'require',
        'pass' => 'require',
        'code' => 'require',
        'ip'   => 'require|ip'
    ];

    /**
     * 定义错误信息
     * 格式：'字段名.规则名' =>  '错误信息'
     *
     * @var array
     */
    protected $message = [
        'user.require' => '账号为必填',
        'pass.require' => '密码为必填',
        'code.require' => '验证码为必填',
        'ip.require' => 'ip为必填',
        'ip.ip' => 'ip格式不正确',
        
    ];
}
