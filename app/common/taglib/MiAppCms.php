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
 *2022-07-29 17:13:44
 *作者：老胡
 *文件描述：标签扩展
 */

namespace app\common\taglib;

use think\template\TagLib;

class MiAppCms extends TagLib{

     /* close 是否闭合 (0 或者1 默认1) ,1是 0不是
           close = 0 {miappcms:xx /}
           close = 1 {miappcms:xx } {/miappcms:xx}
            标签定义： attr 属性列表  alias 标签别名 level 嵌套层次 
    */
    protected $tags   =  [
        'ad'            => ['attr'  => 'return,id','close' => 1],            // 广告标签标签 
        'link'          => ['attr'  => '', 'close' => 1 ],                   // 友情链接标签
        'block'         => ['attr'  => 'pos','close' => 1],                  // 碎片链接标签
        'nav'           => ['attr'  => 'pos,num,return','close' => 1],       // 导航标签
        'lists'         => ['attr'  => 'cateid,where,order,pagenum,return','close' => 1],     // 列表标签
        'prev'          => ['attr'  =>'','close'=>0],  // 上一篇
        'next'          => ['attr'  =>'','close'=>0],  // 下一篇
        'recommend'     => ['attr'  =>'recommendid,cateid,where,order','close'=>1],          // 推荐位
        'commend'       => ['attr'  => 'idwhere,order,num,return','close' => 1]    // 评论标签
    ];

    /** 广告标签标签  */
    public function tagAd($tag,$content){
      
      $return  = $tag['return'] ?? 'val';
      $id    = $tag['id'] ?? '';
      $miappcms = '<?php ';
      $miappcms .= '
          $where = [];
          $where[] = [\'status\', \'=\', 1];
          if (!empty(\'' . $id . '\')) {
              $where[] = [\'aid\', \'=\', ' . $id . '];
          }';
      $miappcms .= '
          $list = \app\common\model\Ad::where($where)->order(\'sort asc,id desc\')->select();';
      $miappcms .= ' ?>';
      $miappcms .= '{volist name="list" id="' . $return . '"}';
      $miappcms .= $content;
      $miappcms .= '{/volist}';
      return $miappcms;
    }

    /** 友情链接标签 */
    public function tagLink($tag,$content)
    {
        $return  = $tag['return'] ?? 'val';
        $miappcms = '<?php ';
        $miappcms .= ' 
            $where = [];
            $where[] = [\'status\', \'=\', 1];
        ';
        $miappcms.= ' 
            $list = \app\common\model\Link::where($where)->order(\'sort asc,id desc\')->select();
        ';
        $miappcms .= ' ?>';
        $miappcms .= '{volist name="list" id="' . $return . '"}';
        $miappcms .= $content;
        $miappcms .= '{/volist}';
      
        return $miappcms;
    }
    

    /** 碎片化标签 */

    public function tagBlock($tag,$content)
    { 
        if(empty($tag['pos'])){
            return '';
        }   
        $return  = $tag['return'] ?? 'val';
        $pos   = $tag['pos'];
        $miappcms = '<?php ';
        $miappcms .= ' 
            $where = [];
            $where[] = [\'status\', \'=\', 1];
            $where[] = [\'name\',\'=\',"'. $pos.'"];
        ';
        $miappcms.= ' 
            $list = \app\common\model\Block::where($where)->order(\'sort asc,id desc\')->select();
        ';
        $miappcms .= ' ?>';
        $miappcms .= '{volist name="list" id="' . $return . '"}';
        $miappcms .= $content;
        $miappcms .= '{/volist}';
      
        return $miappcms;
    
    }

    /** 导航栏 */

    public function tagNav($tag,$content)
    {
       $return  =   $tag['return'] ?? 'val';
       $pos     =   $tag['pos'] ?? '0';
       $num     =   $tag['num'] ?? '0';

       $miappcms  = '<?php ';
       $miappcms .= '
         $nav  = \app\common\model\Cate::where("is_nav",1)->order("sort ASC,id DESC")->select();
         $list = getBuildNavMenu($nav->toArray(),\'child\',' . $num. ');
       ';
       $miappcms .= '?> ';
       $miappcms .= '{volist name="list" id="' . $return . '"}';
       $miappcms .= $content;
       $miappcms .= '{/volist}';
     
       return $miappcms;
    }
   
    /** 列表页数据 */
    public function tagLists($tag,$content)
    {
        $id     = $tag['cateid'] ?? '0';    // 栏目id
        $return = $tag['return'] ?? 'val';  // 返回变量
        $order  = $tag['order'] ?? 'sort ASC,id DESC'; // 排序
     
        $pagenum = $tag['pagenum'] ?? '';  // 每页显示数量

        $where  = $tag['where'] ?? 'status = 1';  // 查询条件
      

        $miappcms = <<<MIAPPCMS
        <?php
            \$page = '';
             // 栏目id
             \$cate_id = '{$id}' ? '{$id}' : getcateid();
             // 栏目信息
             \$cate_info = \app\common\model\Cate::find( \$cate_id );
             
             \$model = "\app\common\model\\\\".\$cate_info->module->getData("model_name");
             
             // 栏目id(包括子栏目id)
             \$cateIds = \app\common\model\Cate::field('id,parent_id')->select();
             \$ids = getDataIdStr(getCateDataIds(\$cateIds,\$cate_id),\$cate_id);
            
             // 判断 栏目信息，model信息 是否存在，
             if( !empty(\$cate_info) && !empty(\$cate_info->module->getData("model_name"))){
                // 分页数量
                if( '{$pagenum}'){
                    \$page_num = '{$pagenum}';
                }else{
                    \$page_num = \$cate_info->page_size ?: '10';
                }
                \$list =  \$model::with(['cate'])->where("{$where}")
                    ->where("cate_id","in", \$ids)
                    ->order('{$order}')
                    ->paginate([
                        'query' => request()->param(),
                        'list_rows' => \$page_num
                    ]);
                \$list =  changeCateListsDate(\$list);    
                \$page = \$list ->render();
             }else{
                \$list = [];
             }
             
        ?>
        {volist name="list" id="{$return}"}
         {$content}
        {/volist}
        MIAPPCMS;

       return $miappcms;
    }

    /* 上一篇 */
    public function tagPrev(){
        $id = request()->param('id');
        $miappcms = <<<MIAPPCMS
         <?php
             \$res = "";
             // 栏目id
             \$cateid = getcateid();
              // 获取栏目信息
            \$cate =   \app\common\model\Cate::find(\$cateid);
            // 获取 模块数据
           \$model = '\app\common\model\\\\'.\$cate->module->getData('model_name');
           
           // 获取上一篇 
           \$prev = \$model::where('cate_id',\$cate->id)->where('id','<',request()->param('id'))->order('sort ASC,id DESC')->limit(1)->find();
            // 判断上一篇是否存在
           if(!empty(\$prev)){
            \$prev['url'] = changeCateShowUrl(\$prev);
            \$res =  '<a class="prev" href="'.\$prev->url.'">'.\$prev->title.'</a>';
           }else{
            \$res =  '<a class="prev_no" href="javascript:;">暂无相关数据</a>';
           }
           echo \$res;
         ?>
        MIAPPCMS;
        return $miappcms;
    }

    /* 下一篇 */
    public function tagNext(){
   

        $miappcms = <<<MIAPPCMS
         <?php
             \$res = "";
             // 栏目id
             \$cateid = getcateid();
              // 获取栏目信息
            \$cate =   \app\common\model\Cate::find(\$cateid);
            // 获取 模块数据
           \$model = '\app\common\model\\\\'.\$cate->module->getData('model_name');
           
           // 获取上一篇 
           \$prev = \$model::where('cate_id',\$cate->id)->where('id','>',request()->param('id'))->order('id ASC')->limit(1)->find();
            // 判断上一篇是否存在
           if(!empty(\$prev)){
               \$prev['url'] = changeCateShowUrl(\$prev);
              \$res =  '<a class="prev" href="'.\$prev->url.'">'.\$prev->title.'</a>';
           }else{
            \$res =  '<a class="prev_no" href="javascript:;">暂无相关数据</a>';
           }
           echo \$res;
         ?>
        MIAPPCMS;
        return $miappcms;
    }

    /** 推荐位标签 */

    public function tagRecommend($tag,$content)
    {   
        $rid     = $tag['id'] ?? ''; // 推荐位id ,如果推荐位ID不存在就调用所有的id
        $return  = $tag['return'] ?? 'val';
        $cate_id = $tag['cateid'] ?? '';  // 栏目id
        $order  = $tag['order'] ?? 'sort ASC,id DESC'; // 排序
        $where  = $tag['where'] ?? 'status = 1';
        if($rid != ""){
            $where .= 'recommend_id = '.$rid;
        }
        $miappcms = <<<MIAPPCMS
        <?php
            \$list = [];
            \$where = [];
            // 栏目id
            \$cateid = '{$cate_id}' ? '{$cate_id}' :  getcateid();
            if(!empty(\$cateid)) {
            // 获取栏目信息
            \$cate =   \app\common\model\Cate::find(\$cateid);
            // 获取 模块数据
            \$model = '\app\common\model\\\\'.\$cate->module->getData('model_name');
            // 查询推荐数据
            if('{$rid}' !== ''){
               \$where = ['recommend_id'=>'{$rid}'];
            }
            \$list = \$model::where('cate_id', \$cateid)
            ->where(\$where)
            
            ->order('{$order}')
            ->select();
            }
        ?>
        {volist name="list" id="{$return}"}
         {$content}
        {/volist}
        MIAPPCMS;
        return $miappcms;
    }

    /** 评论 */
    public function tagCommend($tag,$content)
    {

     $return = $tag['return'] ?? 'val';
     $order  = $tag['order'] ?? 'sort ASC,id DESC'; // 排序
     $where  = $tag['where'] ?? '';  // 查询条件
     $num    = $tag['num'] ?? '10';  // 数量
    
     $miappcms = <<<MIAPPCMS
        <?php
         
         // 查找评论列表
         \$list = \app\common\model\Comment::where('{$where}')
         ->order('{$order}')
         ->limit('{$num}')
         ->select();
        ?>
        {volist name="list" id="{$return}"}
        {$content}
        {/volist}
MIAPPCMS;
    return $miappcms;
    }
}
