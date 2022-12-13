<?php
// 这是系统自动生成的公共文件
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 *  邮件
 */
use PHPMailer\PHPMailer;
use PHPMailer\Exception;

use think\facade\Db;
use think\facade\Route;
/**
 * 将数据库中查出的列表以指定的 值作为数组的键名，并以另一个值作为键值
 * @param $arr
 * @param $key_name
 * @return array
 */
function convert_arr_kv($arr, $key_name, $value)
{
    $arr2 = array();
    foreach ($arr as $key => $val) {
        $arr2[$val[$key_name]] = $val[$value];
    }
    return $arr2;
}

/**
 * 邮件发送 
 * @param        $to      接收人
 * @param string $subject 邮件标题
 * @param string $content 邮件内容(html模板渲染后的内容)
 */
function send_Email($to,$subject='',$content='')
{
  // 查询邮件配置信息
  $mailconfig = Db::name('config')->where(['group' => 'smtp'])->select();

  $config = convert_arr_kv($mailconfig,'name','value');
  $mail = new PHPMailer();
  
    //邮件配置
    $mail->CharSet = 'UTF-8';                     //设定邮件编码
    $mail->SMTPDebug = 0;                        // 调试模式输出
    $mail->isSMTP();                             // 使用SMTP
    $mail->Host = $config['mail_smtp_host'];                // SMTP服务器
    $mail->SMTPAuth = true;                      // 允许 SMTP 认证
    $mail->Username = $config['mail_smtp_user'];                // SMTP 用户名  即邮箱的用户名
    $mail->Password = $config['mail_smtp_pass'];             // SMTP 密码  部分邮箱是授权码(例如163邮箱)  
    $mail->Port = $config['mail_smtp_port'];                            // 服务器端口 25 或者465 具体要看邮箱服务器支持
       if($config['mail_smtp_port'] == '465'){
            $mail->SMTPSecure = 'ssl';                    // 允许 TLS 或者ssl协议
       }

     // 邮件发送 设置 
     $mail->setFrom($config['mail_smtp_useremail'], '中诺口腔');  //发件人
     if(is_array($to))
     {
        foreach ($to as $v) {
            $mail->addAddress($v);
        }
     }else{
        $mail->addAddress($to, $to);  // 收件人
     }
   
      //$mail->addAddress('ellen@example.com');  // 可添加多个收件人
     //$mail->addReplyTo($email_url, '中诺口腔'); //回复的时候回复给哪个邮箱 建议和发件人一致
 
      //Content
    $mail->isHTML(true);                                  // 是否以HTML文档格式发送  发送后客户端可直接显示对应HTML内容
    $mail->Subject = $subject;
     $mail->Body    = $content;
  //  $mail->msgHTML($content);
    $mail->AltBody = '客户端不支持HTML则显示此内容';
    return $mail->send();
     
}

/**
 * 验证输入的邮件地址是否合法
 * @param $user_email 邮箱
 * @return bool
 */
function is_email($user_email="")
{
    $chars = "/^([a-z0-9+_]|\\-|\\.)+@(([a-z0-9_]|\\-)+\\.)+[a-z]{2,6}\$/i";
    if (strpos($user_email, '@') !== false && strpos($user_email, '.') !== false) {
        if (preg_match($chars, $user_email)) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

/**
 * 验证输入的手机号码是否合法
 * @param $mobile_phone 手机号
 * @return bool
 */
function ismobile_phone($mobile_phone)
{
    $chars = "/^13[0-9]{1}[0-9]{8}$|15[0-9]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$|17[0-9]{1}[0-9]{8}$/";
    if (preg_match($chars, $mobile_phone)) {
        return true;
    }
    return false;
}
/**
 * 获取文件目录列表
 * @param string  $pathname 路径
 * @param integer $fileFlag 文件列表 0所有文件列表,1只读文件夹,2是只读文件(不包含文件夹)
 * @param string  $pathname 路径
 * @return array
 */
function get_file_folder_List($pathname, $fileFlag = 0, $pattern = '*')
{
    $fileArray = array();
    $pathname  = rtrim($pathname, '/') . '/';
    $list      = glob($pathname . $pattern);
    foreach ($list as $i => $file) {
        switch ($fileFlag) {
            case 0:
                $fileArray[] = basename($file);
                break;
            case 1:
                if (is_dir($file)) {
                    $fileArray[] = basename($file);
                }
                break;

            case 2:
                if (is_file($file)) {
                    $fileArray[] = basename($file);
                }
                break;

            default:
                break;
        }
    }

    if (empty($fileArray)) $fileArray = NULL;
    return $fileArray;
}


/**
 * 创建上传目录地址
 * @param string  $filename 路径
 * @param string  $times 时间格式
 */
function get_file_uploads($filename="uploads/image/"){
    
    $file = \think\facade\Env::get('root_path')."public/".$filename."/";
  
    if(!is_dir($file)){
        @mkdir($file,0777);
    }
    return $file;
}


function stringCodeArray($info)
{
    $r ='';
    if ($info == ''){
        return array();
    } 
    eval("\$r = $info;");
    return $r;
}

function arrayCodeString($info){
  
    $string = [];
    if ($info == '') return '';
    if(!is_array($info)){
        //删除反斜杠
        $string = $info;
    }
    foreach ($info as $key => $val) {
        $string[$key] = $val;
    }
    $setup = var_export($string, TRUE);
    return $setup;
}

/**
 * 系统加密函数
*/
function pwdHash($password)
{
    return password_hash($password, PASSWORD_DEFAULT);
}
/**
 * 系统验证 
 *  $hash 加密字符串
 */
function pwdVerfiy($password,$hash){

   if(password_verify($password,$hash)){
       return true;
   }else{
       return false;
   }
}

// layui table 返回 json
function jsonData($data,$count=0,$msg='',$code=0){
    $data = [
        'code'  => $code,
        'msg'   => $msg,
        'count' => $count,
        'data'  => $data,
    ];
    return json($data);
}

/**
 * 文本域中换行标签输出
 * @param $info 内容
 * @return mixed
 */
function textareaBr($info)
{
    $info = str_replace("\r\n", "<br />", $info);
    $info = str_replace("\n", "<br />", $info);
    $info = str_replace("\r", "<br />", $info);
    return $info;
}

/**
 * 选项
 */
function optionData($data=[]){
    $r = [];
    if(!empty($data)){
        foreach($data as $key => $val){
            foreach($val as $k => $v){
            $r[$key][] = explode("|",$v);
            }
        }
    }
    return $r;
}

/**
 * 格式化时间
 * @return string
 **/
function toDate($time, $format = 'Y-m-d H:i:s')
{
    if (empty($time)) {
        return '';
    }
    $format = str_replace('#', ':', $format);
    return date($format, $time);
}

/**
 * 简单变量输出
 */
function p($vars){
    echo '<pre>';
    var_dump($vars);
    echo '</pre>';
}

/**
* 转变数组内第一个元素为键值
* @param array $array
* @return array
*/
function changeArray($data){
    $res = [];
      // 当元素个数为3时执行tree操作
      if ($data && count(($data[0])) == 3) {
        $data = tree_three($data);
    }
    foreach($data as &$val){
        if(count($val) == 2){
          $res[current($val)] = end($val);
        }else{
            $k = array_keys($val);
            $res[$val[$k[0]]] = $val[$k[1]];
        }
    }
    return $res;
}

/**
 * 树形分类
 */
function trees($data,$lefthtml = '|— ', $pid = 0, $lvl = 0){
    $arr = [];
    foreach($data as $k => $v)
    {
        if($v['pid'] == $pid){
            $v['lvl']      = $lvl + 1;
            $v['lefthtml'] = str_repeat($lefthtml, $lvl);
         
            $v['ltitle']   = $v['lefthtml'] . $v['title'];
            $arr[]         = $v;
            $arr           = array_merge($arr, trees($data, $lefthtml, $v['id'], $lvl + 1));
        }
    }
    return $arr;
}
/**
 * 无限分类-权限
 * @param        $cate            栏目
 * @param string $lefthtml        分隔符
 * @param int    $pid             父ID
 * @param int    $lvl             层级
 * @return array
 */
function tree_three($cate, $lefthtml = '|— ', $pid = 0, $lvl = 0)
{
    $arr = array();
    foreach ($cate as $v) {
        $keys = array_keys($v);
        if (end($v) == $pid) {
            $v['lvl']      = $lvl + 1;
            $v['lefthtml'] = str_repeat($lefthtml, $lvl);
            $v[$keys[1]]   = $v['lefthtml'] . $v[$keys[1]];
            $arr[]         = $v;
            $arr           = array_merge($arr, tree_three($cate, $lefthtml, $v[$keys[0]], $lvl + 1));
        }
    }
    return $arr;
}

/**
 */
 function tree_cate($data,$lefthtml = '|— ', $pid = 0, $lvl = 0){
    $arr = [];
    foreach($data as $k => $v)
    {
        if($v['parent_id'] == $pid){
            $v['lvl']      = $lvl + 1;
            $v['lefthtml'] = str_repeat($lefthtml, $lvl);
            $v['ltitle']   = $v['lefthtml'] . $v['cate_name'];
            $arr[]         = $v;
            $arr           = array_merge($arr, tree_cate($data, $lefthtml, $v['id'], $lvl + 1));
        }
    }
    return $arr;
 }

/**
 * 递归获取子菜单
 */
function buildMenuChild($list,$pid=0,$parent = 'pid'){
    $treeList = [];
    $pids = $parent;
    foreach ($list as $v) {
        if ($v[$pids] == $pid) {
        //    if($v['name']){
        //       $v['name'] =strtolower(($v['name']));
        //     } 
            $node = $v;
            $child = buildMenuChild($list,$v['id'],$pids);
            if (!empty($child)) {
                $node['child'] = $child;
            }
            // todo 后续此处加上用户的权限判断
            $treeList[] = $node;
        }
    }
    return $treeList;
}

/**
 * 
 */
function showHtml($var=""){
$html = <<< MIAPPCMS
<!DOCTYPE html><html lang="zh-CN"><head><meta charset="utf-8"><title>404错误-phpstudy</title><style>body{font:16px arial,'Microsoft Yahei','Hiragino Sans GB',sans-serif}h1{margin:0;color:#d75757;font-size:26px}.content{width:45%;margin:0 auto}.content>div{margin-top:50px;padding:20px;border-radius:12px}.content dl{color:#2d6a88;line-height:40px}.content div div{padding-bottom:20px;text-align:center}</style></head><body><div class="content"><div><h1>{$var}</h1></div></div></body></html>
MIAPPCMS;
    return $html;
}

/**
 * 返回一个链接
 */
function urlBuild($url=""){
    return url($url)->__toString();
}

/**
 * 传递一个父级分类ID返回所有子分类
 * @param $cate
 * @param $pid
 * @return array
 */
function getChildsRule($rules, $pid,$parent = 'pid')
{
    $arr = [];
    $pids = $parent;
    foreach ($rules as $v) {
        if ($v[$pids] == $pid) {
            $arr[] = $v;
            $arr   = array_merge($arr, getChildsRule($rules, $v['id'],$pids));
        }
    }
    return $arr;
}

/**
 * 格式化字节大小
 * @param  number $size      字节数
 * @param  string $delimiter 数字和单位分隔符
 * @return string            格式化后的带单位的大小
 */
function format_bytes($size=0, $delimiter = '') {
    $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
    for ($i = 0; $size >= 1024 && $i < 5; $i++){
        $size /= 1024;
    }
    return round($size, 2) . $delimiter . $units[$i];
}


/**
 * 查找文件后缀
 * @param $filename 文件名称
 * @return string 后缀名称（如：html）
 */
function fileExt($filename='')
{
    return strtolower(trim(substr(strrchr($filename, '.'), 1, 10)));
}

/**
 * 返回 .之前的字符串
 */
function filePrefix($filename='')
{
  return substr($filename,0,strpos($filename,'.'));
}

/** 获取自定名称的模板文件 */
function dirfileName($path,$name=''){
    $file_name = \FilesystemIterator::KEY_AS_FILENAME; // 访问文件名
    /** 迭代器  */
   $res = new \FilesystemIterator($path,$file_name);
   $list = [];
    $file = config('template_style');
   foreach($res as $k => $v){
    if(!is_dir($v->getPathname())){
       if(substr($v->getFilename(),0,5) == $name){
            if(isset($file[$v->getFilename()])){
                $list[$v->getFilename()] = "[". $file[$v->getFilename()]."] ".$v->getFilename();
            }else{
                $list[$v->getFilename()] = $v->getFilename();
            }
       }
    }
   }
   return $list;
}
/** 
 * 导航菜单
 *  * 组合多维数组
 * @param        $cate
 * @param string $name
 * @param int    $pid
 * @return array
 */
function getBuildNavMenu($cate,$name='child',$pid=0)
{
    $arr = array();
    foreach ($cate as $v) {
        if ($v['parent_id'] == $pid) {
            $v[$name] = getBuildNavMenu($cate,$name, $v['id']);

           $v['url'] = getBuildNavMenuUrl($v);
            $arr[]    = $v;
        }
    }
    return $arr;
}
/**
 *  导航菜单 获取列表链接地址
 */
function getBuildNavMenuUrl($data)
{
    // 判断是否有外部链接
    if($data['url']  == ''){
        // 判断是否跳转到下级栏目
        if ($data['is_next'] == 1) {
            $is_next = \app\common\model\Cate::with(['module'])
            ->where('parent_id', $data['id'])
            ->order('sort asc,id desc')
            ->find();
            if ($is_next) {
                $data['url'] = getBuildNavMenuUrl($is_next);
            }
        }else{
            if($data['cate_dirname']){
                $data['url'] = \think\facade\Route::buildUrl($data['cate_dirname'] . '/index')->domain('');
             }else{
                $pinyin = new pinyin\Utf8ToPinyin;
                $return_link =   $pinyin->encode($data['cate_name'],'all');
                $data['url'] = \think\facade\Route::buildUrl($return_link . '/index')->domain('');
             }
        }
    }
    return $data['url'];
}
function strfilterinfo($s)
{
    $s = str_replace(" ",'',$s);
    return $s;
}
/**
 * 获取栏目目录
*/
function getCateUrlRule()
{
    // 获取当前路由规则 request()->rule()->getRule(), 移除路由规则多余的字符
    return trim(str_replace('<id>', '', request()->rule()->getRule()),'/');
}
/**
 *  获取栏目id
 */
function getcateid(){
    
    $cate = getCateUrlRule();
    if($cate){
        // 通过栏目目录查询id
        $res = \app\common\model\Cate::where('cate_dirname',$cate)->value('id');
    }
    return $res ?? '';
}


/**
 * 传递一个父级分类ID返回所有子分类ID
 * @param $cate
 * @param $pid
 * @return array
 */
function getCateDataIds($cate, $pid)
{
    $arr = [];
    foreach ($cate as $v) {
        if ($v['parent_id'] == $pid) {
            $arr[] = $v;
          $arr   = array_merge($arr, getCateDataIds($cate, $v['id']));
        }
    }
    return $arr;
}

/**
 * 格式化分类数组为字符串
 * @param        $ids
 * @param string $pid
 * @return string
 */
function getDataIdStr($ids, $pid = '')
{
    $result = '';
    foreach ($ids as $k => $v) {
        $result .= $v['id'] . ',';
    }
   
    if ($pid) {
        $result = $pid . ',' . $result;
    }
    $result = trim($result, ',');
    return $result;
}
function changeCateListsDate($data){
    foreach($data as $k => $v){
        $data[$k]['url'] = changeCateShowUrl($v);
    }
    
    return $data;
}

/** 返回详情页链接 */
function changeCateShowUrl($v){
    if($v){
            // 判断是否有 跳转链接
            if (isset($v['url']) && !empty($v['url'])) {
                return $v['url'];
            }
            /**
             *  判断栏目id 是否存在
             */
        if(isset($v['cate_id']) && !empty($v['cate_id'])){
            if($v['cate']['cate_dirname']) {
                $url = Route::buildUrl($v['cate']['cate_dirname'] . '/show', ['id' => $v['id']])->domain('');
            }else{
            $pinyin = new \pinyin\Utf8ToPinyin;
            $return_link =   $pinyin->encode($v['cate']['cate_name'],'all');
                $url = Route::buildUrl($return_link . '/show', ['id' => $v['id']])->domain('');
            }
        }
 
    }
    return $url ?? '';
}
