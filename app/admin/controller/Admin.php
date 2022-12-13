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
 *文件描述：用户
 */
namespace app\admin\controller;
use think\facade\View;
use app\common\components\Form;
use app\common\facade\BackendRun;
use think\exception\ValidateException;

class Admin extends BackendBase
{    // 模型
    protected $model_name = 'Admin';
    // 表名
   protected $table_name = 'admin';


    public function index()
    {
        $pk = BackendRun::getPk($this->table_name);
        $table_columns= BackendRun::getListDataShow($this->table_name);
        $rightButton = BackendRun::addCustomRightBtn($this->table_name);
        $topButton = BackendRun::addCustomTopBtn($this->table_name);

           /** 设置 搜索 字段 */
        $search_item = BackendRun::isSearchField($this->model_name);
        // 插入角色组
        $arr = [
            "field" => "group_name",
            "title" => "角色组",
            "type" => "text",
            "default" => "",
            "dict" => [],
            "class" => "",
            "is_sort" => "false",
        ];  
      array_splice($table_columns,1,0,[$arr]);
        view::assign([
          'table_columns'=>$table_columns, 
          'rightButton' => $rightButton,
          'pk'   => $pk,
          'topButton' => $topButton,
          'search_item'     => $search_item
        ]);

      return View::fetch('table/index');
    }

    public function add(){
        $columns = BackendRun::getFormAddColumns($this->table_name);
        // 查询角色组
        $res = \app\common\model\AdminGroup::field("id,name")->select()->toArray();
        $res = changeArray($res);
        // 插入角色组
       array_splice($columns,0,0,[['select','group_id','角色组','',$res,'','',1]]);

        $form = Form::getInstance();
       
       $form->formElements($columns);

        return $form->setFormDisplay();
    }

    public function addPostSubmit()
    {
        if(request()->isPost()){
          $data =  request()->except(['file'],'post');
          $model = '\app\common\model\\'.$this->model_name;
          $group_id = $data['group_id'];
          
          $data['password'] = pwdHash($data['password']);
          
          if(!empty($data['email'])){
            $item = $model::where('email',$data['email'])->value('email');
            if($item){
                return $this->error('邮箱已存在');
            }
            if(!is_email($data['email'])){
                return $this->error('邮箱格式不正确');
            }
          }
 
          $info = $model::create($data);
          if($info){
            $res = \app\common\model\AdminGroupAccess::add([
                'uid'      => $info->id,
                'group_id' => $group_id
            ]);

            if($res['code']){
                $this->success($res['msg']);
            }else{
                $this->error($res['msg']);
            }
          }

        }
    }

    public function edit($id)
    {
        $model = '\app\common\model\\'.$this->model_name;
        $result = $model::find($id);
        $columns = BackendRun::getFormAddColumns($this->table_name,$result);
        // 查询角色组
        $access = \app\common\model\AdminGroupAccess::where('uid',$id)->value('group_id');
        $res = \app\common\model\AdminGroup::field("id,name")->select()->toArray();
        $res = changeArray($res);
        
        // 插入角色组
        foreach($columns as $k => $v){
            // 情况变量名
            if($v[0] == 'password'){
                $columns[$k][3] = '如果不想修改密码，请留空';
                $columns[$k][4] = '';
                $columns[$k][6] = '如果不想修改密码，请留空';
                $columns[$k][7] = 0;
            }
          
        }
       array_splice($columns,0,0,[
        ['select','group_id','角色组','',$res,$access,'',1],
        ['hidden','old_email',$result->email,'']  // 旧邮箱
      ]);
     //  dump($columns);
        $form = Form::getInstance();
        $form->formElements($columns);
        return $form->setFormDisplay();
    }

    public function editPostSubmit()
    {
        if(request()->isPost()){
            $data =  request()->except(['file'],'post');
           
            $model = '\app\common\model\\'.$this->model_name;
            $group_id = $data['group_id'];
            $id = $data['id'];
            $password = $data['password'];
            /** 如果密码没有被修改 就删除，反之则加密 */
            if(empty($password)){
                unset($data['password']);
            }else{
                $data['password'] = pwdHash($password);
            }
            if(!empty($data['email'])){
                if($data['old_email'] != $data['email']){
                    $item = $model::where('email',$data['email'])->value('email');
                    if($item){
                        return $this->error('邮箱已被占用');
                    }
                }
                if(!is_email($data['email'])){
                    return $this->error('邮箱格式不正确');
                }
              }
          
            $info = \app\common\model\AdminGroupAccess::where("uid",$id)->update(['group_id' => $group_id]);
            $res = $model::edit($data);
            if($res['code']){
                $this->success($res['msg']);
            }else{
                $this->error($res['msg']);
            }
  
          }
    }

}