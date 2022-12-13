<?php
/**
 * 用户中间件
 */

namespace app\admin\middleware;

class Auth
{
    /**
     * 处理请求
     * @param \think\Request $request
     * @param \Closure       $next
     * @return Response
     */
    public function handle($request, \Closure $next)
    {
        // 判断是否登录
        if(!session('?admin.username')){
            return redirect(urlBuild('login/index'));
        }
        // 获取登录id
        $uid = session("admin.id");
        // 白名单
        $info = [
            'Index/index', // 后台首页
            'Index/errors',
            'Login/index', // 登录页面
            'Login/login', // 登录验证
        ];
        $auth   = \app\common\model\MenuRule::select();
        // 获取不需要验证菜单
        $unauth = \app\common\model\MenuRule::where('auth',0)->select();
        $arr = [];
        foreach($unauth as $k => $v){
             // 转换方法名为小写
            $rule_name = explode("/",$v['name']);
            if($rule_name[1]) {
             $rule_name[1] = strtolower($rule_name[1]);
            }
            $ruleName = trim(implode('/', $rule_name));
            // 首字母大写
            $arr[] = ucfirst($ruleName);
            // 查询所有下级规则
            $sub = getChildsRule($auth,$v['id']);
            foreach($sub as $vs){
                // 转换方法名为小写
                $ruleName = explode('/', $vs['name']);
                if ($ruleName[1]) {
                    $ruleName[1] = strtolower($ruleName[1]);
                }
                // 转换控制器首字母大写
                $ruleName = trim(implode('/', $ruleName));
                $arr[] = ucfirst($ruleName);
            }
          
        }
        $info = array_merge($info,$arr);
    
       // 获取当前当前控制器和方法
        $link = $request->controller().'/'.strtolower($request->action());
        // 判断是否在白名单里面 
        if(!in_array($link,$info)){
            // 如果系统默认超级管理员，则不进行判断
            if($uid != 1){
                $auth_open = new \Auth\Auth();
                $res =  $auth_open->check($link,$uid);
                if(!$res){
                 //  return "redirect(urlBuild('index/errors?msg=你没有权限查看该页面！！！'))";
                 return redirect(urlBuild('index/errors'));
                }
            }
        }
        
        /* 添加用户日志信息 */
        \app\common\model\AdminLog::addLog();

        return $next($request);
    }


  
}
