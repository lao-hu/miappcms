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
 *2022-04-10 09:27:03
 *作者：老胡
 *文件描述：角色组管理控制器
 */

namespace app\admin\controller;

use app\common\components\Form;
use app\common\facade\BackendRun;
use think\facade\View;

class AdminGroup extends BackendBase{
    protected $model_name = 'AdminGroup';
    protected $table_name = 'admin_group';

    public function index(){
        $pk = BackendRun::getPk($this->table_name);
        $table_columns= BackendRun::getListDataShow($this->table_name);
        
        $rightButton = BackendRun::addCustomRightBtn($this->table_name,'auth');
        $topButton = BackendRun::addCustomTopBtn($this->table_name);
         /** 设置 搜索 字段 */
        $search_item = BackendRun::isSearchField($this->model_name);
       
        view::assign([
          'table_columns'=>$table_columns, 
          'rightButton' => $rightButton,
          'pk'   => $pk,
          'topButton' => $topButton,
          'search_item'     => $search_item
        ]);
        return View::fetch('table/index');
    }

    /** 权限管理设置 */
    public function auth($id="")
    {
        $menuNode = \app\common\model\MenuRule::field('id,pid,title')->select()->toArray();
       
        $auth = \app\common\model\AdminGroup::where('id',$id)->value('auth');
        $result = auth($menuNode,0,$auth);
        $result[] = [
            'id'  => 0,
            'pid' => 0,
            'title' => '全部',
            'open' => 0
        ];
        View::assign([
            'id' => $id,
            'auth' => $auth,
            'menuNode' => $result
        ]);
        return View::fetch();
    }

    /**
     *  处理请求
     */
    public function authPost(){
        if(request()->isPost()){
            $auth = input('post.auth');
            if(empty($auth)){
                $this->error('请选择要设置的权限');
            }
            $model= "\app\common\model\\".$this->model_name;
            $data = input('post.');
            $result =  $model::update($data,['id'=>$data['id']]);
            if($result){
                $this->success('设置成功');
            }else{
                $this->error('设置失败');
            }
        }
    }
    public function test(){
        return View::fetch();
    }

    public function t(){
        return View::fetch();
    }

    
}
