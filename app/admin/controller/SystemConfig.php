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
 *2022-04-09 20:46:50
 *作者：老胡
 *文件描述：系统配置控制器
 */

namespace app\admin\controller;

use app\common\components\Form;

class SystemConfig extends BackendBase
{
    public function listop(){
  
        $res = \app\common\model\SysConfig::where('group_id',1)->select();
        $info = convert_arr_kv($res,'name','value');
  
        $form = Form::getInstance();

        $form->addGroupTab([
            '系统配置' => [
                ['text','mi_template_style','模板默认风格','模版所在的目录名称，默认为 default ','default'],
                ['radio','mi_editor_set','编辑器','Html编辑器采用的ckeditor4',[1=>'cheditor'],1],
                ['radio','mi_admin_verify','后台验证码','后台登录时是否需要验证码，强烈建议开启',[1=>'开启',0=>'关闭'],1],
                ['radio','mi_template_mobile','手机端','开启后自动跳转到mobile，注：自适应网站或无手机端网站请关闭',[1=>'开启',0=>'关闭'],0],
                ['radio','mi_smtp','启用smtp邮件','是否启用smtp方式发送邮件，默认为开启',[1=>'开启',0=>'关闭'],1],
                ['text','mi_version','版本号','系统版本号','3.0'],
            ]
            ,'上传设置' => [
                ['radio','mi_uploads_drive','上传配置','本地上传',[1=>'本地上传'],1],
                ['text','mi_uploads_name','文件上传目录','默认为 uploads','uploads'],
                ['text','mi_uploads_file_size','文件大小',' 单位：KB，0表示不限制上传大小','0'],
                ['text','mi_uploads_file_ext','文件格式','多个格式请用英文逗号, 隔开','rar,zip,avi,rmvb,3gp,flv,mp3,mp4,txt,doc,xls,ppt,pdf,xls,docx,xlsx,doc'],
                ['text','mi_uploads_img_size','图片大小','单位：KB，0表示不限制上传大小','0'],
                ['text','mi_uploads_img_ext','图片格式','多个格式请用英文逗号 , 隔开','jpg,png,gif,bmp,jpeg,ico'],
            ]
            ,'在线编辑器' => [
                ['select','mi_code_theme','codemirror主题','codemirror主题配色，默认是 material',[
                    'material'=>'material主题',
                    'monokai'=>'monokai主题',
                ],'material'],
                ['text','mi_code_height','codemirror高度','codemirror高度，默认是 500px','500px'],
            ]
            
        ])
        
        ->setFormUrl(urlBuild('operatePost'))
        ->setFormData($info);

        return $form->setFormDisplay();
    }
    public function operatePost(){
        if(request()->isPost()){
             $data =   input('post.');
            foreach($data as $k =>  $v){
                $item = \app\common\model\SysConfig::where('group_id',1)->where('name',$k)->find();
                $item->value = $v;
                $item->save();
            }
            return $this->success('修改成功');
        }
    }
}