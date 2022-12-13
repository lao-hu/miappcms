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
 *2022-04-10 11:35:29
 *作者：老胡
 *文件描述：空控制器
 */
namespace app\admin\controller;

class Error {
   public function __call($name, $arguments)
   {
$string  = <<<MIAPPCMS
<!DOCTYPE html><html lang="zh-CN"><head><meta charset="utf-8"><title>404错误-phpstudy</title><style>body{font:16px arial,'Microsoft Yahei','Hiragino Sans GB',sans-serif}h1{margin:0;color:#d75757;font-size:26px}.content{width:45%;margin:0 auto}.content>div{margin-top:50px;padding:20px;border-radius:12px}.content dl{color:#2d6a88;line-height:40px}.content div div{padding-bottom:20px;text-align:center}</style></head><body><div class="content"><div><h1>404!!!</h1></div></div></body></html>
MIAPPCMS;
     return $string;
   }
}
