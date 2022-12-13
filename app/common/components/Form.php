<?php
/**
 * +----------------------------------------------------------------------
 * | 表单快速构造器
 * +----------------------------------------------------------------------
 *                      .::::.
 *                    .::::::::.            | AUTHOR: siyu
 *                    :::::::::::           | EMAIL: 407593529@qq.com
 *                 ..:::::::::::'           | QQ: 407593529
 *             '::::::::::::'               | DATETIME: 2019/07/22
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
 *   ```` ':.          ':::::::::'                  ::::..
 *                      '.:::::'                    ':'````..
 * +----------------------------------------------------------------------
 * 
 */

 namespace app\common\components;

 use think\facade\View;

 class Form
 {
     /**
     * @var string 模板路径
     */
    private $template = '';

    /**
     * @var array 模板变量
     */
    private $form = [

        'page_tips'         => '',        // 页面提示
        'tips_type'         => '',        // 提示类型
        'form_url'          => '',        // 表单提交地址
        'form_method'       => 'post',    // 表单提交方式
        'empty_data'        => '暂无数据',    // 没有表单项时的提示信息
        'btn_hide'          => [],        // 要隐藏的按钮
        'btn_title'         => [],        // 按钮标题
        'btn_other'         => [],        // 额外按钮
        'other_html'        => '',        // 额外HTML代码
        'other_js'          => '',        // 额外JS代码
        'other_css'         => '',        // 额外CSS代码
        'form_element'      => [],        // 表单项目
        'form_data'         => [],        // 表单数据
        'form_class'        => 'layui-form',    // 表单class
        'ajax_submit'       => true,
    ];
    // 私有
    private $is_tab = false; 

    // 单列模式句柄
    private static $instance;

    // 
    public static function getInstance(){
        //判断对象是否存在 
        if(!self::$instance){
            self::$instance = new self();
        }
        return self::$instance;
    }

    /**
     * 私有化构造函数
     */
    private function __construct()
    {
        $this->_init();
    }


    // 初始化
    protected function _init()
    {
        // 设置模板
        $this->template = "form/form";
        // 设置默认表单提交地址
        $this->form['form_url'] = url(request()->action().'PostSubmit');
    } 

    /**
     * 私有化__clone 禁止克隆
     */
    private function __clone(){}

   
    /**
     * 设置表单页提示信息
     * @param string $tips 提示信息
     * @param string $type 提示类型：danger,info,warning,success
     * @return $this
     */
    public function setPageTips(string $tips = '',$class='')
    {
        if ($tips != '') {
            $this->form['page_tips'] = $tips;
        }
        if($class != ''){
            $this->form['tips_type'] = 'layui-elem-quote-'.trim($class);
        }
        return $this;
    }


    /** 修改一些配置信息 */
    public function formConfig($name="",$value){
        if(isset($this->form[$name])){
            return $this->form[$name] = $value;
        }    
    }
   /**
     * 设置表单提交地址
     * @param string $url 提交地址
     * @return $this
     */
    public function setFormUrl($url="")
    {
        if(!empty($url)){
            $this->form['form_url'] = trim($url);
        }
        return $this;
    }

   /**
     * 设置表单提交方式
     * @param string $method 提交方式
     * @return $this
     */
    public function setFormMethod($method = "")
    {
        if(!empty($method)){
            $this->form['form_method'] = $method;
        }
        return $this;
    }

     /**
      * 设置表单class
      */
    public function setFormClass($class=""){
        if(!empty($class)){
            $this->form['form_class'] = $class;
        }
        return $this;
    }

    /**
     * 添加单行文本框
     * @param string $name        字段名称
     * @param string $title       字段别名
     * @param string $tips        提示信息
     * @param string $default     默认值
   
     * @param string $css 额外css类名
     * @param string $placeholder 占位符
     * @param bool   $required    是否必填
     * @return $this|array
    */
     public function addFormText($name = '', $title = '', $tips = '', $default = '', $css = '', $placeholder = '', $required = false){
         $element = [
             'type'         => 'text',
             'name'         => $name,
             'title'        => $title,
             'tips'         => $tips,
             'value'        => $default,
             'css'          => $css,
             'placeholder'  => $placeholder ?: '请输入' . $title,
             'required'     => $required,
         ];

         if( $this->is_tab ){
            return $element;
         }

         $this->form['form_element'][] = $element;
         return $this;
       
     }
      /**
     * 添加单行文本域
     * @param string $name        字段名称
     * @param string $title       字段别名
     * @param string $tips        提示信息
     * @param string $default     默认值
   
     * @param string $css 额外css类名
     * @param string $placeholder 占位符
     * @param bool   $required    是否必填
     * @return $this|array
    */
     public function addFormTextarea($name = '', $title = '', $tips = '', $default = '', $css = '', $placeholder = '', $required = false){
        $element = [
            'type'        => 'textarea',
            'name'        => $name,
            'title'       => $title,
            'tips'        => $tips,
            'value'       => $default,
            'css' => $css,
            'placeholder' => $placeholder ?: '请输入' . $title,
            'required'    => $required,
        ];
        if( $this->is_tab ){
            return $element;
        }
        $this->form['form_element'][] = $element;
        return $this;
     }

     /**
     * 添加密码框
     * @param string $name        字段名称
     * @param string $title       字段别名
     * @param string $tips        提示信息
     * @param string $default     默认值
   
     * @param string $css 额外css类名
     * @param string $placeholder 占位符
     * @param bool   $required    是否必填
     * @return $this|array
    */    
     public function addFormPassword($name = '', $title = '', $tips = '', $default = '', $css = '', $placeholder = '', $required = false){
        $element = [
            'type'        => 'password',
            'name'        => $name,
            'title'       => $title,
            'tips'        => $tips,
            'value'       => $default,
            'css' => $css,
            'placeholder' => $placeholder ?: '请输入' . $title,
            'required'    => $required,
        ];
        if( $this->is_tab ){
            return $element;
         }
        $this->form['form_element'][] = $element;
        return $this;
     }

    
     /**
      * 添加隐藏表单项
      * @param string $name        字段名称
      * @param string $default     默认值
      * @param string $css 额外css类名
      * @return $this|array
      */
     public function addFormHidden($name = '', $default = '', $css = ''){
         $element = [
             'type'        => 'hidden',
             'name'        => $name,
             'value'       => $default,
             'css' => $css,
         ];
         if( $this->is_tab ){
            return $element;
         }
         $this->form['form_element'][] = $element;
         return $this;
     }

     /**
      * 添加单选
      * @param string $name        字段名称
      * @param string $title       字段别名
      * @param string $tips        提示信息
      * @param array  $options     单选数据
      * @param string $default     默认值
      * @param string $css 额外css类名
      * @param bool   $required    是否必选
      * @return $this|array
      */
     public function addFormRadio($name = '', $title = '', $tips = '', $options = [], $default = '', $css = '', $required = false)
     {
         $element = [
             'type'        => 'radio',
             'name'        => $name,
             'title'       => $title,
             'tips'        => $tips,
             'options'     => $options == '' ? [] : $options,
             'value'       => $default,
             'css'         => $css,
             'required'    => $required,
         ];

         if( $this->is_tab ){
            return $element;
         }

         $this->form['form_element'][] = $element;
         return $this;
     }

     /**
      * 添加复选框
      * @param string $name        字段名称
      * @param string $title       字段别名
      * @param string $tips        提示信息
      * @param array  $options     复选框数据
      * @param string $default     默认值

      * @param string $css 额外css类名
      * @param bool   $required    是否必选
      * @return $this|array
      */
         
     public function addFormCheckbox($name = '', $title = '', $tips = '', $options = [], $default = '', $css = '', $required = false)
     {
         $element = [
             'type'        => 'checkbox',
             'name'        => $name,
             'title'       => $title,
             'tips'        => $tips,
             'options'     => $options == '' ? [] : $options,
             'value'       => $default,
             'css'         => $css,
             'required'    => $required,
         ];
         if( $this->is_tab ){
            return $element;
         }

         $this->form['form_element'][] = $element;
         return $this;
     }
     /**
      * 添加下拉框
      * @param string $name        字段名称
      * @param string $title       字段别名
      * @param string $tips        提示信息
      * @param array  $options     复选框数据
      * @param string $default     默认值
      * @param string $css 额外css类名
      * @param string $placeholder 占位符
      * @param bool   $required    是否必选
      * @return $this|array
      */
     public function addFormSelect($name = '', $title = '', $tips = '', $options = [], $default = '', $css = '', $required = false){
        $element = [
            'type'          => 'select',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'options'       => $options == '' ? [] : $options,
            'value'         => $default,
            'css'           => $css,
            'required'      => $required,
        ];
        if( $this->is_tab ){
            return $element;
         }
        $this->form['form_element'][] = $element;
        return $this;
     }
    /**
     * 添加时间
    */ 
     public function addFormDate($name = '', $title = '', $tips = '', $default = '', $css = '',$format='', $required = false){
        $element = [
            'type'          => 'date',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'css'           => $css,
            'format'        => $format,
            'required'      => $required,
        ];
        if( $this->is_tab ){
            return $element;
         }
        $this->form['form_element'][] = $element;
        return $this;
     }

     public function addFormTime($name = '', $title = '', $tips = '', $default = '', $css = '', $required = false){
        $element = [
            'type'          => 'time',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'css'           => $css,
            
            'required'      => $required,
        ];
        if( $this->is_tab ){
            return $element;
         }
        $this->form['form_element'][] = $element;
        return $this;
     }

     public function addFormDateTime($name = '', $title = '', $tips = '', $default = '', $css = '', $required = false){
        $element = [
            'type'          => 'datetime',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'css'           => $css,
            'required'      => $required,
        ];
        if( $this->is_tab ){
            return $element;
         }
        $this->form['form_element'][] = $element;
        return $this;
     }

     /**
      * 
      */
     public function addFormNumber($name = '', $title = '', $tips = '', $default = '', $css = '',$placeholder='', $required = false){
        $element = [
            'type'          => 'number',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'css'           => $css,
            'placeholder'   => $placeholder,
            'required'      => $required,
        ];
        if( $this->is_tab ){
            return $element;
         }
        $this->form['form_element'][] = $element;
        return $this;
     }
     /**
      *  图片上传
      */
     public function addFormImage($name = '', $title = '', $tips = '', $default = '', $css = '', $size='',$ext = '',$placeholder='',$required = false){
        $element = [
            'type'          => 'image',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'css'           => $css,
            'size'          => $size,
            'ext'           => $ext,
            'placeholder'   => $placeholder,
            'required'      => $required,
        ];
        if( $this->is_tab ){
            return $element;
         }
        $this->form['form_element'][] = $element;
        return $this;
     }
     /**
      * 多图片上传
      */
     public function addFormImages($name = '', $title = '', $tips = '', $default = '', $css = '', $size='',$ext = '',$placeholder='',$required = false){
        $element = [
            'type'          => 'images',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'css'           => $css,
            'size'          => $size,
            'ext'           => $ext,
            'placeholder'   => $placeholder,
            'required'      => $required,
        ];

        if( $this->is_tab ){
            return $element;
        }

        $this->form['form_element'][] = $element;
        return $this;
     }
     /**
      * 文件上传
      */
     public function addFormFile($name = '', $title = '', $tips = '', $default = '', $css = '', $size='',$ext = '',$placeholder='',$required = false){
        $element = [
            'type'          => 'file',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'css'           => $css,
            'size'          => $size,
            'ext'           => $ext,
            'placeholder'   => $placeholder,
            'required'      => $required,
        ];
    
        if( $this->is_tab ){
            return $element;
        }

        $this->form['form_element'][] = $element;
        return $this;
     }
     /**
      * 多文件上传
      */
     public function addFormFiles($name = '', $title = '', $tips = '', $default = '', $css = '', $size='',$ext = '',$placeholder='',$required = false){
        $element = [
            'type'          => 'files',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'css'           => $css,
            'size'          => $size,
            'ext'           => $ext,
            'placeholder'   => $placeholder,
            'required'      => $required,
        ];

        if( $this->is_tab ){
            return $element;
        }

        $this->form['form_element'][] = $element;
        return $this;
     }
    
    /**
     * 添加编辑器
    */    
     public function addFormEditor($name = '', $title = '', $tips = '', $default = '', $css = '', $placeholder = '',$height = '', $required = false){
        $element = [
            'type'          => 'editor',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'css'           => $css,
            'placeholder'   => $placeholder ?: '请输入' . $title,
            'height'        => $height,
            'required'      => $required,
        ];

        if( $this->is_tab ){
            return $element;
        }

        $this->form['form_element'][] = $element;
        return $this;
     
     }

     /** 添加代码编辑器 */

     public function addFormCode($name = '', $title = '', $tips = '', $default = '',$height = '', $required = false){
        $element = [
            'type'          => 'code',
            'name'          => $name,
            'title'         => $title,
            'tips'          => $tips,
            'value'         => $default,
            'height'        => $height,
            'required'      => $required,
        ];

        if( $this->is_tab ){
            return $element;
        }

        $this->form['form_element'][] = $element;
        return $this;
     
     }
     /** 拼音 **/
     public function addFormPinyin($name = '', $title = '', $tips = '', $default = '', $css = '', $placeholder = '',$delimiter='',$pinyintype='', $pinyinfield='',$required = false){
         $element = [
             'type'         => 'pinyin',
             'name'         => $name,
             'title'        => $title,
             'tips'         => $tips,
             'value'        => $default,
             'css'          => $css,
             'placeholder'  => $placeholder ?: '请输入' . $title,
             'delimiter'    => $delimiter,
             'pinyintype'   => $pinyintype,
             'pinyinfield'  => $pinyinfield,
             'required'     => $required,
         ];

         if( $this->is_tab ){
             return $element;
         }

         $this->form['form_element'][] = $element;
         return $this;

     }
     /**
      *  标签
      */
     public function addFormTags($name = '', $title = '', $tips = '', $default = '', $css = '', $placeholder = '', $required = false)
     {
        $element = [
            'type'         => 'tags',
            'name'         => $name,
            'title'        => $title,
            'tips'         => $tips,
            'value'        => $default,
            'css'          => $css,
            'placeholder'  => $placeholder ?: '请输入' . $title,
            'required'     => $required,
        ];

        if( $this->is_tab ){
           return $element;
        }

        $this->form['form_element'][] = $element;
        return $this;
     }

    /**
     * 添加选项卡 分组 数据
     */
     public function addGroupTab($arr = []){
        if(!empty($arr)){
            $this->is_tab = true;
            foreach($arr as &$list){
               foreach($list as $k => $v){
                //删除第一个元素 返回被删除元素的值
                 $sets = array_shift($v);
                 // 首字符转换为大写并拼接为方法名
                 $method = 'addForm' . ucfirst($sets);
                 // 调用回调函数
                 $list[$k] =  call_user_func_array([$this, $method], $v);
               }
            }
            $this->is_tab = false;
        }
     
        $element = [
            'type'   => 'tab',
            'options' => $arr
        ];
        if( $this->is_tab ){
            return $element;
        }

        $this->form['form_element'][] = $element;
        return $this;
     }

     /**
      * 添加表单项 
      * @param string $type 表单项类型
      * @param string $name 表单项名，与各自方法中的参数一致
      * @return $this
      */
     public function formElement($type = '', $name = '')
     {
         if ($type != '') {
             // 获取所有参数值
             $args = func_get_args();
             // 删除数组中的第一个元素（type），并返回被删除元素的值
             array_shift($args);
             // 首字符转换为大写并拼接为方法名
             $method = 'addForm' . ucfirst($type);
             // 调用回调函数
             call_user_func_array([$this, $method], $args);
         }
         return $this;
     }

     /**
      * 一次性添加多个表单项
      * @param array $arr 表单项
      * @return $this|array
      */
     public function formElements($element = [])
     {
         if (!empty($element)) {
             foreach ($element as $val) {
                 call_user_func_array([$this, 'formElement'], $val);
             }
         }
         return $this;
     }
     /***
     * 设置表单项的值
     */
    public function setFormData($data=[]){
        if(!empty($data)){
            $this->form['form_data'] = $data;
        }
        return $this;
    }

    /**
     * 
     */
    private function setFormValue(){
        if($this->form['form_data']){
            foreach ($this->form['form_element'] as &$item) {
                // 判断是否为分组
                if ($item['type'] == 'tab') {
                    foreach ($item['options'] as &$group) {
                        foreach ($group as $key => $value) {
                            if (isset($value['name'])) {
                                if (isset($this->form['form_data'][$value['name']])) {
                                        $group[$key]['value'] = $this->form['form_data'][$value['name']];
                                    }
                                }
                            }
                        }
                } else {
                    if (isset($item['name'])) {
                        if (isset($this->form['form_data'][$item['name']])) {
                            $item['value'] = $this->form['form_data'][$item['name']];
                        }
                    }
                }
            }
        }
    }
 /**
     * 设置额外的CSS
     */
    public function setOtherCss($css=''){
        if(!empty($css)){
           $this->form['other_css']  = $css;
        }
        return $this;
    }

    /**
     *  设置额外的html
     *  $tips  位置 [top和bottom]
     */
    public function setOherHtml($html= '',$tips=''){
        if(!empty($html)){
           
           $tips != '' && $tips = '_'.$tips;

            $this->form['other_html'.$tips] = $html;
        }

        return $this;
    }

    /**
     * 额外的JS
     */
    public function setOherJs($js='')
    {
        if(!empty($js)){
            $this->form['other_js']  = $js;
        }
         return $this;
    }

    /**
     * 隐藏按钮
     * @param array|string $btn 要隐藏的按钮，如：['submit']，其中'submit'->确认按钮，'reset'->重置按钮
     * @return $this
     */
    public function hideBtn($btn = [])
    {
        if (!empty($btn)) {
            $this->form['btn_hide'] = is_array($btn) ? $btn : explode(',', $btn);
        }
        return $this;
    }

      /**
     * 添加额外按钮
     * @param string $btn 按钮内容
     * @return $this
     */
    public function addBtn(string $btn = '')
    {
        if ($btn != '') {
            $this->form['btn_other'][] = $btn;
        }
        return $this;
    }



     /**
      * 模板变量赋值
      * @param mixed  $name  要显示的模板变量
      * @param string $value 变量的值
      * @return $this
      */
     public function setFormAssign($name, $value = '')
     {
         if (is_array($name)) {
             $this->form = array_merge($this->form, $name);
         } else {
             $this->form[$name] = $value;
         }
         return $this;
     }
    /**
     * 渲染模版
     * @param string $template 模板文件名或者内容
     * @return string
     * @throws \Exception
     */
    public function setFormDisplay($template="")
    {
        // 设置表单选项值
        $this->setFormValue();
        if(!empty($template)){
            $this->template = $template;
        }
        View::assign($this->form);
        return View::fetch($this->template);
      
    }



 }
