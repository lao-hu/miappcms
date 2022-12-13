<?php


namespace app\index\controller;

use think\facade\View;

class Index extends FrontendBase
{
    public function index()
    {
      //  $config = $this->base_config;
        
      // $template = $this->template.'index.html';
  
      // View::assign([
      //   'cate'        => ['top_id' => 0],
      //   'system'      => $config,
      //   'public'      => $this->public,
      //   'title'       => $config['title'], // 网站标题
      //   'keywords'    => $config['keywords'],   // 网站关键字
      //   'description' => $config['description'], // 网站描述
      // ]);
      // return View::fetch($template);
      return redirect("/404.html");
    }
}
