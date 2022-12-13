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
 *2022-07-03 17:45:45
 *作者：老胡
 *文件描述：邮件配置
 */

namespace app\admin\controller;

use app\common\components\Form;
use think\facade\View;

class Email extends BackendBase{

    /** 
     *  设置邮件配置
     */
    public function setmail(){
        $res = \app\common\model\SysConfig::where('group_id',2)->select();
        $info = convert_arr_kv($res,'name','value');
        $form = Form::getInstance();

$js ="
    $('#test_email').on('click',function(){
    var url = '".urlBuild("testEmail")."';  
    miappcms.open('邮箱测试',url,500,200,'');
    });
";

      if($this->system['mi_smtp'] != 1){
        $form->setPageTips('当前，系统配置里面的 smtp邮件服务已关闭, <br/> 如 需要使用smtp 邮箱发送服务，请前往【系统配置】=> 启用smtp邮件 开启','danger');
      }else{
        $form->setPageTips('系统采用smtp 方式发送邮件');
      }
      $form->addFormText('mi_smtp_server','smtp服务器')
      ->addFormText('mi_smtp_server','smtp端口')   
      ->addFormRadio('mi_smtp_ssl','ssl','是否启用SMTP SSL，如果是则端口为：465 否则为：25',[1=>'开启',0=>'关闭'],1)
      ->addFormText('mi_smtp_username','smtp用户名')  
      ->addFormText('mi_smtp_password','smtp密码')  
      ->addFormText('mi_smtp_useremail','发件人邮箱')
      ->setFormUrl(urlBuild('setmailPost'))
      ->setFormData($info)
      ->hideBtn('reset')
      ->setOherJs($js)
      ->addBtn('<button type="button" id="test_email" class="layui-btn layui-btn-normal" >测试邮件发送</button>');   
      // dump($form);
        return $form->setFormDisplay();
    }

    public function setmailPost(){
        if(request()->isPost()){
            $data =   input('post.');
           foreach($data as $k =>  $v){
               $item = \app\common\model\SysConfig::where('group_id',2)->where('name',$k)->find();
               $item->value = $v;
               $item->save();
           }
           return $this->success('修改成功');
       }
    }

    public function testEmail()
    {
        return View::fetch('common/test_email');
    }

    /**
     * 测试邮箱发送
     */
    public function emailSend()
    {
        if(request()->isPost()){
            $data = input('post.');
            if(!is_email($data['test_email'])){
                $this->error('邮箱格式不正确');
            }

        }
        
    }
}