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
 *2022-08-10 14:33:01
 *作者：老胡
 *文件描述：文件上传
 */

 namespace app\admin\controller;
 
 use think\exception\ValidateException;
 use app\common\facade\BackendRun;

 class Uploads extends BackendBase
 {
    /**
     *  上传
     */

    public function index()
    {
        /** ckeditor */
        
        if(request()->param('up_type') == 'ckeditor'){
         
            $result = $this->infoUpload('upload');
                $data['uploaded']  = $result['code'];
                $data['fileName']  = $result['fileName'];
                $data['url']       = $result['url'];
                if(!$result['code']){
                    $data['error']['message'] =  $result['msg'].$result['error'];
                }

          return json($data);  
        }
      /** 上传 */
        if(request()->post('up_type') == 'image' || request()->post('up_type') == 'file'){

            $result = $this->infoUpload('file');
            $data['code'] = $result['code'];
            $data['msg'] = $result['msg'];
            $data['status'] = $result['status'];
            if($result['code']){
                $data['path'] = $result['url'];
                $data['name'] = $result['fileName']; 
            }else{
                $data['error'] = $result['error'];
            }

            return json($data);  
        }

    }
    /** 上传验证规则 */
    public function uploadValidate(){
        $file = [];
        /** 按钮上传 */
        if(request()->post('up_type') == 'image'){
             // 图片上传类型
             if(request()->post('upload_ext')){
                $file['fileExt'] = str_replace("|",",",request()->post('upload_ext'));
             }elseif($this->system['mi_uploads_img_ext']){
                $file['fileExt'] =  $this->system['mi_uploads_img_ext'];
            }else{
                $file['fileExt'] = 'jpg,png,gif,bmp,jpeg,ico';
            }
             // 图片上传大小
             if(request()->post('upload_size')){
                $file['fileSize'] = request()->post('upload_size') * 1024;
             }elseif($this->system['mi_uploads_img_size']){
                $file['fileSize'] = $this->system['mi_uploads_img_size'] * 1024;
            }else{
                $file['fileSize'] = 200 * 1024;
            }

        }

        if(request()->post('up_type') == 'file'){
                   // 文件上传类型
            if(request()->post('upload_ext')){
                    $file['fileExt'] = str_replace("|",",",request()->post('upload_ext'));
                 }elseif($this->system['mi_uploads_file_ext']){
                    $file['fileExt'] =  $this->system['mi_uploads_file_ext'];
                }else{
                    $file['fileExt'] = 'rar,zip,avi,rmvb,3gp,flv,mp3,mp4,txt,doc,xls,ppt,pdf,xls,docx,xlsx,doc';
                }
                 //文件上传大小
            if(request()->post('upload_size')){
                    $file['fileSize'] = request()->post('upload_size') * 1024;
                 }elseif($this->system['mi_uploads_file_size']){
                    $file['fileSize'] = $this->system['mi_uploads_file_size'] * 1024;
                }else{
                    $file['fileSize'] = 200 * 1024;
                }
        }


        /** 验证ckeditor 图片上传规则 */
        if(request()->param('up_type') == 'ckeditor'){
            // 图片上传类型
            if($this->system['mi_uploads_img_ext']){
                $file['fileExt'] =  $this->system['mi_uploads_img_ext'];
            }else{
                $file['fileExt'] = 'jpg,png,gif,bmp,jpeg,ico';
            }
             // 图片上传大小
            if($this->system['mi_uploads_img_size']){
                $file['fileSize'] = $this->system['mi_uploads_img_size'] * 1024;
            }else{
                $file['fileSize'] = 200 * 1024;
            }
        }
        return $file;
    }

    /** 上传信息 */
    protected function infoUpload($file){
        $data = [
            'code'      => 1,  // 状态
            'status'    => '', // 状态码
            'msg'       => '',
            'error'     => '',
            'url'      => '',
            'fileName'  => ''
        ];
        
        $files = request()->file($file);

        try{
            validate(["file"=> $this->uploadValidate()])->check(['file' => $files]);

            $savename = \think\facade\Filesystem::disk('public')->putFile('files',$files);               
            $savename_path = str_replace("\\","/",$savename);
            $savename_path = '/uploads/'.$savename_path;

            $data['code'] = 1;
            $data['status'] = 'success';
            $data['msg'] = '上传成功';
            $data['url']     = $savename_path;
            $data['fileName'] = $files->getOriginalName();
        }catch(ValidateException $e){
            $data['code']   = 0;
            $data['status'] = 'error';
            $data['msg']    = '文件上传失败';
            $data['error']  = $e->getMessage();
        }

        return $data;
    }

    
 }
