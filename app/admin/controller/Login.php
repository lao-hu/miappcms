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
 *2022-04-08 09:37:41
 *作者：老胡
 *文件描述：登录控制器
 */
namespace app\admin\controller;

use think\facade\View;

class Login 
{ 
    public function index()
    {
        // 判断是否登录
        if(session("?username"))
        {
          return redirect(urlBuild('index/index')); 
        }

        $veify_on = \app\common\model\SysConfig::where('id',3)->value('value');
        View::assign('verify_on',$veify_on);
        return View::fetch();
    }
    public function login(){
        if(request()->isPost()){
            $veify_on = \app\common\model\SysConfig::where('id',3)->value('value');

            $data = input('post.');
            $user = $data['user'];
            $pass = $data['pass'];
           
            $ip  = $data['ip'];
            
            // if(!filter_var($ip,FILTER_VALIDATE_IP)){
            //     return json(['code'=>0,'msg' => '非法ip']);
            // }

            if($veify_on == 1){
                $code = $data['code'];    
                // 监测验证码是否正确
                if(!captcha_check($code)){
                    return json(['code'=>2,'msg' => '验证码错误,请重新输入']);
                }
            }
          
            $res = \app\common\model\Admin::where(['username'=>$user])->find();
            // 监测账号是否存在
            if(empty($res)){
                return json(['code'=>0,'msg' => '账号错误']);
            }else{
                // 判断密码是否正确             
                if(!pwdVerfiy($pass,$res['password'])){
                    return json(['code'=>0,'msg' => '密码错误']);
                }
                // 判断是否被禁用
                if($res['status'] == 1){
                    // 更新 ip 和时间
                    $result = \app\common\model\Admin::where('id',$res['id'])->update([
                        'userip' => $ip,
                        'login_time' => time()
                    ]);  
                    \app\common\model\AdminLog::add([
                        'admin_id' => $res['id'],
                        'url' => urlBuild("login/login"),
                        'title' => "欢迎登录成功",
                        'admin_ip' => $ip,
                        
                    ]);
                    session('admin',[
                        'id'    => $res['id'],
                        'ip'    => $ip,
                        "username"  => $res['username'],
                        'nickname'  => $res['nickname'],
                        'usertime'  => toDate(time()),
                        'logintime' => $res['login_time']
                    ]);

                 return json(['code'=>1,'msg'=>"登录成功",'url'=>urlBuild('index/index')]);
                 
                }else{
                    return json(['code'=>0,'msg' => '你的账号已禁用，请联系管理员']);
                }
               
            }
            
        }
    }

     /**
     * 退出登录
     */
    public function logout()
    {
      // 删除session
      session('admin',null);
      return redirect(urlBuild('login/index'));
    }
   
}