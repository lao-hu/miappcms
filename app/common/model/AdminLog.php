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
 *文件描述：用户日志
 */

 namespace app\common\model;

use think\response\Json;

 class AdminLog extends Base{
     
    /**
     *  添加日志信息
     */
    public static function addLog(){
        // 获取用户id
        $uid  = session('admin.id');
        // 获取账号
        $user = session('admin.username'); 
        // 链接
        $url = request()->url();
        // ip
        $ip = session("admin.ip");
        $title = '';
        $content = [];
        $contents = request()->param();
       
        $item = new \Auth\Auth;
        $titles = $item->getMenuBreadCrumb();
        foreach($titles as $v){
            $title .= "【".$v['title']."】>";
        }
        $title = trim($title,">");
        if(!empty($contents)){
            foreach($contents as $k => $v){
                $content[$k] = $v;
            }
            $content = json_encode($content);
        }
       
        if(!empty($title)){
            self::create([
                'admin_id' => $uid,
                'url' => $url,
                'title' => $title,
                'admin_ip' => $ip,
                'content' => $content
            ]);
        }
     
    }

 }

