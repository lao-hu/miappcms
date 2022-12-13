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
 *2022-06-03 08:55:38
 *作者：老胡
 *文件描述：数据库管理
 */
namespace app\admin\controller;

use think\facade\View;
// 数据库备份类
use \tp5er\Backup;

class Database extends BackendBase {
    protected $dbBackup;
    public function initialize()
    {
        parent::initialize();
        $config = [
            //'path' => '../Data/',
            'path' => '../backup/sql/',
            //数据库备份路径
            'part' => 209715200,
            //数据库备份卷大小
            'compress' => 0,
            //数据库备份文件是否启用压缩 0不压缩 1 压缩
            'level' => 9,
        ];
        $this->dbBackup = new Backup($config);
        /**  数据库配置操作 
         * $this->dbBackup->setDbConn() 
        */
    }

    /** 数据库备份 */
    public function index()
    {
       return View::fetch();
    }

    public function getList()
    {
        $count = count($this->dbBackup->dataList());
        $data =   $this->dbBackup->dataList();
        foreach($data as $k => $v){
            $data[$k]['data_length'] = format_bytes($v['data_length']);
        }
        return jsonData($data,$count);
    }

    /** 
     * 备份数据表
     */
    public function sqlBackup()
    {
        if(request()->isPost()){
            $data = input('post.tables');
            if(empty($data)){
              return  $this->error('请选择你备份的数据表');
            }
            $fileinfo  = $this->dbBackup->getFile();
            // 检查备份目录是否可写
            if(!is_writeable($fileinfo['filepath'])){    
                $this->error('备份目录不存在或不可写，请检查后重试！');
            }
          
            //创建备份文件
            if(false === $this->dbBackup->Backup_Init()){
                $this->error('初始化失败，备份文件创建失败！，请检查后重试！');
            }

            $file   = $fileinfo['file'];
            $tables = explode(",",$data);
            foreach($tables as $table){
                $this->dbBackup->setFile($file)->backup($table,0);
            }
            return $this->success('数据表备份成功');
        }
    }

    /** 数据库还原页面 */
    public function revert()
    {
       $list =  $this->dbBackup->fileList();
       View::assign('list',$list);
       return View::fetch();
    }
 
    /** 下载备份文件 */
    public function download($time='')
    {
       return $this->dbBackup->downloadFile($time);
    }

    /** 删除备份文件 */
    public function del($id=''){
        if($id){
            $res = $this->dbBackup->delFile($id);
            if($res){
                $this->success('备份文件删除成功');
            }else{
                $this->error('备份文件删除失败');
            }
        }
    }
       /** 数据库还原操作 */
     public function revertData($time = 0){
        if(empty($time)){
            $this->error('请选择要还原的sql文件');
        }
        $item  = $this->dbBackup->getFile('timeverif',$time);

        if(is_array($item)){
            $start= $this->dbBackup->setFile($item)->import(0,$time);
            if(false===$start){
                $this->error('还原数据出错！');
            }else{
                $this->success('数据库还原成功');
           }
        }else{
            $this->error('备份文件可能已经损坏，请检查！');
        }  
    }

    /**
     * 修复表
     */
    public function repair($tables = '')
    {
        if(!empty($tables)){
            $res = $this->dbBackup->repair($tables);
            if($res){
                $this->success("数据表修复成功");
            }else{
                $this->error("数据表修复出错请重试");
            }
        }
    } 

    /** 优化表 */
    public function optimize($tables = '')
    {
        if(!empty($tables)){
            $res = $this->dbBackup->optimize($tables);
            if($res){
                $this->success("数据表优化完成！");
            }else{
                $this->error("数据表优化出错请重试！");
            }
         }
    }
}

