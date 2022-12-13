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
 *文件描述：移动控制器基础类
 */


declare (strict_types = 1);

namespace app\mobile\controller;

use think\App;
use think\exception\ValidateException;
use think\exception\HttpResponseException;
use think\Validate;

abstract class FrontendBase
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
    protected $middleware = [];


    protected $template;       // 模板目录
    protected $public; // 公共目录
    protected $controller;      // 当前控制器

    protected $base_config;     // 基础设置
    
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
        // 查找系统配置信息
        $system_template = \app\common\model\SysConfig::find(1);

        $this->controller = request()->controller(); // 当前控制器
        $this->template = './template/'.$system_template['value'].'/'.$this->app->http->getName().'/'; // 当前模板目录
        $this->public = "/template/".$system_template['value'].'/'.$this->app->http->getName().'/';
        $this->base_config = \app\common\model\Config::find(1);

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
    }
