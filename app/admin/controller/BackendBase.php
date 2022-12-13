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
 *文件描述：后台控制器基础类
 */
declare (strict_types = 1);

namespace app\admin\controller;
/** 内置框架  */

use app\common\facade\MiAppCms;
use think\App;
use think\exception\ValidateException;
use think\exception\HttpResponseException;
use think\facade\View;
use think\Validate;

/** 定义的 */
use app\common\components\Form;
use app\common\facade\BackendRun;

abstract class BackendBase
{
    /**
     * Request实例
     * @var \think\Request
     */
    protected $request;

    /**
     * 应用实例
     * @var \think\App
     */
    protected $app;

    /**
     * 是否批量验证
     * @var bool
     */
    protected $batchValidate = false;

    /**
     * 控制器中间件
     * @var array
     */
    protected $middleware = [\app\admin\middleware\Auth::class];


    // 模型名称
    protected $model_name = '';
    
    // 数据表名称
    protected $table_name =''; 
    
    // 系统配置
    protected $system = [];
    /**
     * 构造方法
     * @access public
     * @param  App  $app  应用对象
     */
    public function __construct(App $app)
    {
        $this->app     = $app;
        $this->request = $this->app->request;

        // 控制器初始化
        $this->initialize();
    }
   
    // 初始化
    protected function initialize()
    {
        // pjax 请求
        if (request()->isPjax()) {
            View::assign(['pjax' => true]);
        } else {
            View::assign(['pjax' => false]);
        }  
        // layer 
        if(request()->has('miappcms_layer')){
            View::assign('layer',true);
        }else{
            View::assign('layer',false);
        }
        // 查询用户信息
       
        if(session('?admin.id')){
            $userid = session('admin.id');
             /** 后台界面左侧菜单  **/
            $userInfo = \app\common\model\Admin::find($userid); 
            if($userid != 1){
                 // 通过用户权限信息
                $auth  = new \Auth\Auth;
                $auth_id = $auth->getAuthGroup($userid); 
                 /** 通过用户权限信息 显示左侧菜单 */
                 $result = \app\common\model\MenuRule::where('status',1)
                 ->where('id','in',$auth_id['auth'])
                 ->order(['sort', 'id' => 'desc'])
                 ->select();
            }else{
                $result = \app\common\model\MenuRule::where('status',1)
                ->order(['sort', 'id' => 'desc'])
                ->select();
            }

            $result = buildMenuChild($result);
      
        $names = request()->controller()."/".request()->action();
        $breadcrumb = \app\common\model\MenuRule::where('name',$names)->find();

        if(empty($breadcrumb)){
            $breadcrumb = null;
        }
            View::assign([
                'breadcrumb' => $breadcrumb,
                'table_name'=>$this->table_name,
                'leftMenu' => $result,
                'userInfo'=>$userInfo,
            ]);
        }
      
      /**
       *  MIAPPCMS 系统信息
       *  */ 
      $info = \app\common\model\SysConfig::where('group_id',1)->field('name,value')->select();
      $list = [];
      if(!$info->isEmpty()){
        foreach($info as $k => $v){
          $list[$v['name']] = $v['value'];
        }
      }
      $this->system = $list;
    
      View::assign($list);
      View::assign([
        'miappcms' => [
            'version' => config('app.miappcms_version'),
            'author'  => config('app.miappcms_author'),
            'name'    => config('app.miappcms_name'),
        ],
        'user_info'     => session()
      ]);
    }

    /**
     * 验证数据
     * @access protected
     * @param  array        $data     数据
     * @param  string|array $validate 验证器名或者验证规则数组
     * @param  array        $message  提示信息
     * @param  bool         $batch    是否批量验证
     * @return array|string|true
     * @throws ValidateException
     */
    protected function validate(array $data, $validate, array $message = [], bool $batch = false)
    {
        if (is_array($validate)) {
            $v = new Validate();
            $v->rule($validate);
        } else {
            if (strpos($validate, '.')) {
                // 支持场景
                [$validate, $scene] = explode('.', $validate);
            }
            $class = false !== strpos($validate, '\\') ? $validate : $this->app->parseClass('validate', $validate);
            $v     = new $class();
            if (!empty($scene)) {
                $v->scene($scene);
            }
        }

        $v->message($message);

        // 是否批量验证
        if ($batch || $this->batchValidate) {
            $v->batch(true);
        }

        return $v->failException(true)->check($data);
    }

     /**
     * 操作成功跳转的快捷方法
     * @access protected
     * @param  mixed     $msg 提示信息
     * @param  string    $url 跳转的URL地址
     * @param  mixed     $data 返回的数据
     * @param  integer   $wait 跳转等待时间
     * @param  array     $header 发送的Header信息
     * @return void
     */
    protected function success($msg = '',string $url = null, $data = '', $wait = 3, array $header = [])
    {
        if (is_null($url) && isset($_SERVER["HTTP_REFERER"])) {
            $url = $_SERVER["HTTP_REFERER"];
        } elseif ('' !== $url) {
            $url = (strpos($url, '://') || 0 === strpos($url, '/')) ? $url : $this->app->route->buildUrl($url);
        }
        $result = [
            'code' => 1,
            'msg' => $msg,
            'data' => $data,
            'url' => $url,
            'wait' => $wait,
            ];
            $type = (request()->isJson() || request()->isAjax()) ? 'json' : 'html';
            if ($type == 'html') {
                $response = view(config('app.dispatch_success_tmpl'), $result);
            } else if ($type == 'json') {
                $response = json($result);
            }
            throw new HttpResponseException($response);
     }

 /**
   * 操作错误跳转的快捷方法
   * @access protected
   * @param mixed $msg 提示信息
   * @param string $url 跳转的URL地址
   * @param mixed $data 返回的数据
   * @param integer $wait 跳转等待时间
   * @param array $header 发送的Header信息
   * @return void
   */
  protected function error($msg = '', string $url = null, $data = '', int $wait = 3, array $header = [])
  {
   if (is_null($url)) {
        $url = $this->request->isAjax() ? '' : 'javascript:history.back(-1);';
   } elseif ($url) {
        $url = (strpos($url, '://') || 0 === strpos($url, '/')) ? $url : $this->app->route->buildUrl($url);
   }
    $result = [
        'code' => 0,
        'msg' => $msg,
        'data' => $data,
        'url' => $url,
        'wait' => $wait,
    ];
   $type = (request()->isJson() || request()->isAjax()) ? 'json' : 'html';
    if ($type == 'html') {
            $response = view(config('app.dispatch_error_tmpl'), $result);
    } else if ($type == 'json') {
            $response = json($result);
    }
    throw new HttpResponseException($response);
  }


  /*** 
   * 列表页表格
   */  
  public function index(){
 
 
    
    $pk = BackendRun::getPk($this->table_name);
    $table_columns= BackendRun::getListDataShow($this->table_name);

    $rightButton = BackendRun::addCustomRightBtn($this->table_name);
    $topButton = BackendRun::addCustomTopBtn($this->table_name);

    /** 搜索 字段 */
    $search_item = BackendRun::isSearchField($this->model_name);
  
    /** 单页 */
    $issingle =  BackendRun::issingle($this->model_name);
    if($issingle){
        return redirect($issingle);
    }

    view::assign([
      'table_columns'=>$table_columns, 
      'rightButton' => $rightButton,
      'pk'   => $pk,
      'topButton'    => $topButton,
      'search_item'  => $search_item,

    ]);
    return View::fetch('table/index');
   
   }
  /**
   * 添加
   */
  public function add()
  {
     $columns = BackendRun::getFormAddColumns($this->table_name);
     /** 获取tab数据 */
     $res =  BackendRun::getAddTabs($this->model_name,$columns);
     $form = Form::getInstance();
     // 判断是否有选项卡
     if($res){
         $form->addGroupTab($res);
     }else{
         $form->formElements($columns);
     }
     return $form->setFormDisplay();
  }
   /**
   * 添加保存
   */
  public function addPostSubmit(){
    if(request()->isPost()){
       // $data = input('post.');
        $data = BackendRun::getformData(request()->except(['file'],'post'),$this->table_name);
        $model = '\app\common\model\\'.$this->model_name;
        $result = $model::add($data);
        if($result['code']){
            $this->success($result['msg']);
        }else{
            $this->error($result['msg']);
        }
    }
  }
  /**
   * 编辑
   */
  public function edit($id){
    $model = '\app\common\model\\'.$this->model_name;
    $result = $model::find($id);

    // 获取表单栏目
    $columns = BackendRun::getFormAddColumns($this->table_name,$result);
   
     /** 获取tab数据 */
    $res =  BackendRun::getAddTabs($this->model_name,$columns);
    $form = Form::getInstance();
         // 判断是否有选项卡
         if($res){
             $form->addGroupTab($res);
         }else{
             $form->formElements($columns);
         }
     //dump($form);     
    return $form->setFormDisplay();
  }

  /**
   * 编辑保存
   */
  public function editPostSubmit(){
    if(request()->isPost()){

        $data = BackendRun::getformData(request()->except(['file'],'post'),$this->table_name);
        $model = '\app\common\model\\'.$this->model_name;
        $result = $model::edit($data);
        if($result['code']){
            $this->success($result['msg']);
        }else{
            $this->error($result['msg']);
        }
    }
  }

  /**
   *  如果 模型名称 和 控制器名称一样，可以不用写，反之则必须控制器里面声明$this->model_name
   */
  public function getList(){
    $model = '\app\common\model'."\\".$this->model_name;
    
    $page = input("get.page")  ?? 1;
 
    $is_asc = input('get.is_asc') ?? 'desc';
    $order_field = input('get.order_field') ?? 'id';
        /**  */
    $where = request()->except(['page','limit','order_field','is_asc'],'get') ?? [];

    $items =  $model::getListData($where,$page,[$order_field => $is_asc]);
    $count =  $model::getCount('id',$where);
    return jsonData($items,$count);
   }
   /**
    * 删除
    */
   public function del($id)
   {
        $model = '\app\common\model\\'.$this->model_name;
        if(strpos($id,",") !== false){
            $this->delAll($id);
        }else{
            $res = $model::del($id);
            if($res['code']){
                $this->success($res['msg']);
            }else{
                $this->error($res['msg']);
            }
        }
   }
   /**
    * 批量删除
    */
   public function delAll($id)
   {
    $model = '\app\common\model\\'.$this->model_name;
    $res = $model::delAll($id);
    if($res['code']){
        $this->success($res['msg']);
    }else{
        $this->error($res['msg']);
        
    }
   }

   /**
    *  修改单个字段值
    */
    public function editSort($id=0,$field='',$fieldvalue='')
    {
      $model = '\app\common\model\\'.$this->model_name;
      if(empty($id) && empty($field)){
         $this->error('修改错误,请检查参数是否正确');
      }
      $res = $model::editOneField($id,$field,$fieldvalue);
      if($res['code']){
        $this->success($res['msg']);
      }else{
        $this->error($res['msg']);
      }
    }

   /** 导出当前数据 */
   public function export(){
    BackendRun::export(input('param.'));
   }

   /**
    * 拼音
   **/
   public function pinyinMake($f='',$c='',$t="",$s=""){
        $result = BackendRun::getFileds($this->table_name,['field' => $f]);
        $pinyin = new \Overtrue\Pinyin\Pinyin();
        if(empty($result)){
            $this->error('没有找到当前模块字段数据');
        }
        if($t == 'all'){
            $pinyinVal = $pinyin->sentence($c,$s);
        }else{
            $pinyinVal = $pinyin->abbr($c,$s);
        }
       return json(['code'=>1,'msg'=>'','data'=>$pinyinVal]);
   }

   /**
  * 推荐位
  */
  public function getChangeRec($id = "",$rid="0"){
    if(empty($id)){
        $this->error('请选择你推荐的数据');
    }
    $rid = $rid ?: '0';

    $model = '\app\common\model\\'.$this->model_name;
    $res = $model::where('id','in',$id)->update(['recommend_id' => $rid]);

    if($res){
        $this->success('修改成功');
    }else{
        $this->error('修改失败');
    }
  }  
  
}
