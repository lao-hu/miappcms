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
 *2022-07-06 11:33:23
 *作者：老胡
 *文件描述：栏目管理
 */

namespace app\admin\controller;

use app\common\components\Form;
use app\common\facade\BackendRun;
use app\common\model\Module;
use think\exception\ValidateException;
use think\facade\View;


class Cate extends BackendBase
{
    protected $model_name = 'Cate';
    protected $table_name = 'cate';

    
    public function index(){

        $pk = BackendRun::getPk($this->table_name);
        $table_columns= BackendRun::getListDataShow($this->table_name);
        $rightButton = BackendRun::addCustomRightBtn($this->table_name,[
            'edit'=>['layer'=>false]
        ]);
        $topButton = BackendRun::addCustomTopBtn($this->table_name,[
            'add' => [
                'title' => '添加栏目',
                'js' => "miAppCmsLoads('".url('add')."');"
            ],
            'addpage' => [
                'class' => 'layui-btn layui-btn-sm miappcms-btn-success',
                'icon'  => 'fa fa-plus',
                'title' => '添加单页面',
                'js'    => "miAppCmsLoads('".url('add')."?mid=17');"
            ],
            'show' => [
                'class' => 'layui-btn layui-btn-sm layui-btn-normal',
                'icon'  => 'fa fa-caret-square-o-down',
                'title' => '展开菜单',
                'js'   => ' tableTree.showAll(objTable);'
              ],
              'hide' => [
                'class' => 'layui-btn layui-btn-sm layui-btn-normal',
                'icon'  => 'fa fa-caret-square-o-right',
                'title' => '折叠菜单',
                'js'    => 'tableTree.hideAll(objTable);'
              ]
              
        ]);
    
     
        View::assign([
          'table_columns'   => $table_columns, 
          'rightButton'     => $rightButton,
          'pk'              => $pk,
          'topButton'       => $topButton,

          'keyid'           => 'id',    // 当前ID
          'keypid'          => 'parent_id', // 上级ID
          'keytitle'        => 'cate_name' // 此字段td用于绑定单击折叠展开功能
        ]);
      
        return View::fetch('common/tabletree');
    }
    /** 添加 分类栏目  */
    public function add($mid = '')
    {   
        $title = '';
        $template = \app\common\model\SysConfig::find(1);
        $path = './template/'.$template['value'].'/content/';
        $parent = \app\common\model\Cate::getPids("");
        if($mid){
            /** 
             * 单页 
            */
            // 栏目字段数据
            $title = '添加单页面';
            $columns = BackendRun::getFormAddColumns($this->table_name);
            // 
            array_splice($columns,0,1,[['hidden','module_id',$mid]]);
            // 栏目表
            $res = Module::where('table_type',1)->where('id','=',17)->field('id,module_name')->select()->toArray();
            $res = changeArray($res);
            

            foreach($columns as $k => $v)
            {
                if($v[1] == 'parent_id'){
                    $columns[$k][4] = $parent;
                }
                /**  单页不显示以下字段   */
                if($v[1] == 'template_list' || $v[1] == 'template_show'  || $v[1] == 'is_next' || $v[1] == 'page_size' || $v[1] == 'url'){
                    unset($columns[$k]);
                }
                if($v[1] == 'template_page')
                {
                    $templates = dirfileName($path,'page_');
                    $columns[$k][4] = $templates;
                    $columns[$k][5] = 'page_default.html';
                }
            }
        }else{
           // 栏目字段数据
           $title = '添加栏目';
           $columns = BackendRun::getFormAddColumns($this->table_name);

           // 栏目表
           $res = Module::where('table_type',1)->where('id','<>',17)->field('id,module_name')->select()->toArray();
           $res = changeArray($res);
     
           foreach($columns as $k => $v)
           {
               if($v[1] == 'module_id'){
               $columns[$k][4] = $res;
               }
               if($v[1] == 'parent_id'){
                   $columns[$k][4] = $parent;
               }
               if($v[1] == 'template_list'){
                   $templates = dirfileName($path,'list_');
                   $columns[$k][4] = $templates;
                   $columns[$k][5] = 'list_default.html';
               }
               if($v[1] == 'template_show'){
                   $templates = dirfileName($path,'show_');
                   $columns[$k][4] = $templates;
                   $columns[$k][5] = 'show_default.html';
               }
               /** 不显示 单页模板字段  */
               if($v[1] == 'template_page'){
                   unset($columns[$k]);
               }
           }
            dirfileName($path,'list_');
        }


           /** 获取tab数据 */
           $res =  BackendRun::getAddTabs($this->model_name,$columns);
           $form = Form::getInstance();
           // 判断是否有选项卡
           if($res){
               $form->addGroupTab($res);
           }else{
               $form->formElements($columns);
           }
          // dump($form);
            /**
             * 表单顶部的标题
             */
           $form->setOtherCss(
            "<style> 
            .other_html_top{overflow: hidden;}
            .cate-titles{font-size: 18px;}
            </style>"
           );
           $form->setOherHtml("
            <b class=\"cate-titles lf\"> {$title} </b>
            <a class=\"layui-btn layui-btn-sm layui-btn-normal rt\" href=\"javascript:history.back(-1);\"><i class=\"fa fa-reply\" aria-hidden=\"true\"></i> 返 回</a> 
           ",'top');
         
           return $form->setFormDisplay();
    }

    public function getList(){
        $model = '\app\common\model\\'.$this->model_name;
        $items = $model::getListData();
        $count =  $model::getCount();
        return jsonData($items,$count);
    }

   
    public function addPostSubmit()
    {
        if(request()->isPost())
        {
            $data = request()->except(['file'],'post');
            $result = BackendRun::getFileds($this->table_name,['field' => 'cate_dirname']);
            $pinyin = new \Overtrue\Pinyin\Pinyin();
            foreach ($result as $k => $v){
                if($v['setup']['pinyintype'] == 'all'){
                    $data[$v['field']] = $pinyin->sentence($data[$v['field']],$v['setup']['delimiter']);
                }else{
                    $data[$v['field']] = $pinyin->abbr($data[$v['field']],$v['setup']['delimiter']);
                }
            }
            /**
            *  检测是为汉字，数字 或字母 
            */ 
             try{
                $this->validate($data,'Cate');
             }catch(ValidateException $e){
                $this->error($e->getError());
             }

            $model = '\app\common\model\\'.$this->model_name;
            $result = $model::add($data);
            if($result['code']){
                $this->success($result['msg']);
            }else{
                $this->error($result['msg']);
            }
        }
    }

    public function edit($id)
    {
        $model = '\app\common\model\\'.$this->model_name;
        $result = $model::find($id);
        $template = \app\common\model\SysConfig::find(1);
        $path = './template/'.$template['value'].'/content/';

            // 获取表单栏目
        $columns = BackendRun::getFormAddColumns($this->table_name,$result);
            /** 获取tab数据 */
              // 栏目表
        $res = Module::where('table_type',1)->field('id,module_name')->select()->toArray();
        $res = changeArray($res);
        $parent = \app\common\model\Cate::getPids();

        /** 判断是否为单页模块 */
        if($result->module->getData('model_name') == 'Page') {
            $title = '编辑单页面';
            array_splice($columns,1,1,[['hidden','module_id',$result->module_id]]);
            foreach($columns as $k => $v)
            {
                if($v[1] == 'parent_id'){
                  $columns[$k][4] = $parent;
                }
                  /**  单页不显示以下字段   */
                  if($v[1] == 'template_list' || $v[1] == 'template_show'  || $v[1] == 'is_next' || $v[1] == 'page_size' || $v[1] == 'url'){
                    unset($columns[$k]);
                }

                if($v[1] == 'template_page')
                {
                    $templates = dirfileName($path,'page_');
                    $columns[$k][4] = $templates;
                    $columns[$k][5] = $result->template_page ?: 'page_default.html';
                }

            }

        }else{
            $title = '编辑栏目';
            foreach($columns as $k => $v)
            {
                if($v[1] == 'module_id'){
                    $columns[$k][4] = $res;
                }
                if($v[1] == 'parent_id'){
                    $columns[$k][4] = $parent;
                }
                if($v[1] == 'template_list'){
                    $templates = dirfileName($path,'list_');
                    $columns[$k][4] = $templates;
                    $columns[$k][5] = $result->template_list ?: 'list_default.html';
                }
                if($v[1] == 'template_show'){
                    $templates = dirfileName($path,'show_');
                    $columns[$k][4] = $templates;
                    $columns[$k][5] = $result->template_show ?: 'show_default.html';
                }
                    /** 不显示 单页模板字段  */
                if($v[1] == 'template_page'){
                    unset($columns[$k]);
                }
            }
        }

        $info_tab =  BackendRun::getAddTabs($this->model_name,$columns);
        $form = Form::getInstance();
            // 判断是否有选项卡
            if($info_tab){
                $form->addGroupTab($info_tab);
            }else{
                $form->formElements($columns);
            }
            /**
             * 表单顶部的标题
             */
            $form->setOtherCss(
                "<style> 
                .other_html_top{overflow: hidden;}
                .cate-titles{font-size: 18px;}
                </style>"
               );
               $form->setOherHtml("
                <b class=\"cate-titles lf\"> {$title} </b>
                <a class=\"layui-btn layui-btn-sm layui-btn-normal rt\" href=\"javascript:history.back(-1);\"><i class=\"fa fa-reply\" aria-hidden=\"true\"></i> 返 回</a> 
               ",'top');    

        return $form->setFormDisplay();
    }

    public function editPostSubmit()
    {
        if(request()->isPost()){
            $data = request()->except(['file'],'post');
            $model = '\app\common\model\\'.$this->model_name;

            $result = BackendRun::getFileds($this->table_name,['field' => 'cate_dirname']);
            $pinyin = new \Overtrue\Pinyin\Pinyin();
            foreach ($result as $k => $v){
               if($v['setup']['pinyintype'] == 'all'){
                   $data[$v['field']] = $pinyin->sentence($data[$v['field']],$v['setup']['delimiter']);
               }else{
                   $data[$v['field']] = $pinyin->abbr($data[$v['field']],$v['setup']['delimiter']);
               }
            }

            /**
            *  检测是为汉字，数字 或字母 
            */ 
             try{
                $this->validate($data,'Cate');
             }catch(ValidateException $e){
                $this->error($e->getError());
             }

            $result = $model::edit($data);
            if($result['code']){
                $this->success($result['msg']);
            }else{
                $this->error($result['msg']);
            }
        }
    }

    /** 
     *  删除栏目
     */

    public function del($id=''){
        if(empty($id)){
            $this->error('id不能为空');
        }
        $model = '\app\common\model\\'.$this->model_name;
        /** 
         * 判断是否有子元素
         */
        $sub =  $model::where('parent_id',$id)->select();
        if(!$sub->isEmpty()){
            $this->error('当前栏目下存在子栏目，请先删除子栏目，在删除当前栏目');
         }
   
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
}
