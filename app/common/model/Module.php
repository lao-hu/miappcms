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
 *2022-04-22 19:51:46
 *作者：老胡
 *文件描述：
 */


namespace app\common\model;

use think\facade\Db;

class Module extends Base{

    // 一对多关联的情况
    public function Field(){
        return $this->hasMany('Field','module_id');
    }
    /**
     * 添加模块时创建表，并初始化主键字段、添加时间、修改时间等字段；如有表且符合要求，则直接添加字段
     * @param string $tableName 表名称
     * @return bool|string
     */
    public static function createTables($tableName)
    {
        // 获取模块信息
        $module = self::where('table_name', $tableName)->find();
        if (!$module) {
            return '[module] 表中不存在 table_name 为' . $tableName . '的记录，无法继续';
        }
        // 1 栏目表 2 后台表
        $table_Type = $module->getData('table_type'); 
         // 主键
        $pk        = $module->getData('pk');        
        // 获取表注释    
        $table_desc = $module->getData('table_desc');
        // 获取单页模式
        $issingle = $module->getData('issingle');
        // 获取完整表名称
        $table_Name = config('database.connections.mysql.prefix') . $tableName;
        // 取得所有表名称
        $tables = Db::getTables();


        $field_model = new Field();

 // 已有表则不再创建表，尝试维护字段信息
    if(in_array($table_Name,$tables)){
        // 检测是否包含需要的字段
        $required_field = [$pk,'create_time','update_time'];

        // 自动添加排序字段
        if ($module->is_sort) {
            $required_field[] = 'sort';
        }
        // 自动添加状态字段
        if ($module->is_status) {
            $required_field[] = 'status';
        }
         // 表类型为 栏目表 里面以下字段：[栏目ID、标题、关键词、描述、内容、模板、推荐位]
         if($table_Type == 1){
            $required_field[] = 'cate_id';
            $required_field[] = 'title';
            $required_field[] = 'keywords';
            $required_field[] = 'description';
            $required_field[] = 'content';
            $required_field[] = 'template';
            $required_field[] = 'recommend_id';
         }

        $need_data = [];
            // 获取当前表字段
            $current_fields    = Db::getTableFields($table_Name);
            foreach($required_field as $k => $values){
                 if(array_search($values,$current_fields) === false){
                     $need_data[] = $values;
                 }
            }
            if($need_data){
                return '请手动在【'.$table_Name.'】表，创建如下字段：'.implode('，',$need_data);
            }

            // 插入 id
            $data[] = [
                'module_id' => $module->id,
                'field' => $pk,
                'name' => '主键',
                'tips' => '',
                'type' => 'hidden',
                'minlength' => 0,
                'maxlength' => 0,
                'sort' => 0,
                'is_list'=>1,
                'status' => 1,
                'setup' => "array('default'=>'','css'=>'','fieldtype'=>'int')",
                'note' => '自增ID'
            ];
             // 自动添加排序字段
            if($module->is_sort){
                $data[] = [
                    'module_id' => $module->id,
                    'field' => 'sort',
                    'name' => '排序',
                    'tips' => '',
                    'type' => 'number',
                    'required' => 1,
                    'minlength' => 0,
                    'maxlength' => 0,
                    'is_add'  => 1,
                    'is_edit'  => 1,
                    'is_list'=>1,
                    'search_type' => '=',
                    'is_sort' => 1,
                    'sort' => 97,
                    'status' => 1,
                    'setup' => "array('default'=>'','css'=>'','placeholder'=>'','fieldtype'=>'int',)",
                    'note' => '排序'
                ]; 
            }
            // 自动添加状态字段
            if($module->is_status){
                $data[] = [
                    'module_id'     => $module->id,
                    'field'         => 'status',
                    'name'          => '状态',
                    'tips'          => '',
                    'type'          => 'radio',
                    'minlength'     => 0,
                    'maxlength'     => 0,
                    'is_add'        => 1,
                    'is_edit'       => 1,
                    'is_list'       =>1,
                    'required'      => 1,
                    'is_search'     => 0,
                    'search_type'   => '=',
                    'is_sort'       => 0,
                    'sort'          => 98,
                    'status'        => 1,
                    'setup'         => "array('default'=>'1','css'=>'','placeholder'=>'','fieldtype'=>'tinyint',)",
                    'note'          => '状态'
                ]; 
            }
            // 表类型为 栏目表 里面以下字段：[栏目ID、标题、关键词、描述、内容、模板]
            if($table_Type == 1){
                // 栏目id
                $data[] = [
                    'module_id'      => $module->id,
                    'field'          => 'cate_id',
                    'name'           => '栏目',
                    'required'       => '1',
                    'maxlength'      => '0',
                    'type'           => 'select',
                    'source'    => '2',
                    'relation_model' => 'Cate',
                    'relation_field' => 'cate_name',
                    'is_add'         => '1',
                    'is_edit'        => '1',
                    'is_list'        => '1',
                    'is_search'      => '1',
                    'is_sort'        => '0',
                    'search_type'    => '=',
                    'status'         => '1',
                    'sort'           => '2',
                    'note'         => '栏目',
                    'setup'          => "array ('default' => '', 'css' => '','placeholder'=>'','fieldtype' => 'int',)"
                ];
                // 标题
                $data[] = [
                    'module_id'      => $module->id,
                    'field'          => 'title',
                    'name'           => '标题',
                    'required'       => '0',
                    'maxlength'      => '0',
                    'type'           => 'text',
                    'source'    => '0',
                    'relation_model' => '',
                    'relation_field' => '',
                    'is_add'         => '1',
                    'is_edit'        => '1',
                    'is_list'        => '0',
                    'is_search'      => '0',
                    'is_sort'        => '0',
                    'search_type'    => '=',
                    'status'         => '1',
                    'sort'           => '43',
                    'note'         => '关键词',
                    'setup'          => "array ('default' => '', 'css' => '','placeholder'=>'', 'fieldtype' => 'varchar',)"
                ];

                // 关键词
                $data[] = [
                    'module_id'      => $module->id,
                    'field'          => 'keywords',
                    'name'           => '关键词',
                    'required'       => '0',
                    'maxlength'      => '0',
                    'type'           => 'text',
                    'source'    => '0',
                    'relation_model' => '',
                    'relation_field' => '',
                    'is_add'         => '1',
                    'is_edit'        => '1',
                    'is_list'        => '0',
                    'is_search'      => '0',
                    'is_sort'        => '0',
                    'search_type'    => '=',
                    'status'         => '1',
                    'sort'           => '44',
                    'note'         => '关键词',
                    'setup'          => "array ('default' => '', 'css' => '', 'placeholder'=>'','fieldtype' => 'varchar',)"
                ];
                // 描述
                $data[] = [
                    'module_id'      => $module->id,
                    'field'          => 'description',
                    'name'           => '描述',
                    'required'       => '0',
                    'maxlength'      => '255',
                    'type'           => 'textarea',
                    'source'    => '0',
                    'relation_model' => '',
                    'relation_field' => '',
                    'is_add'         => '1',
                    'is_edit'        => '1',
                    'is_list'        => '0',
                    'is_search'      => '0',
                    'is_sort'        => '0',
                    'search_type'    => '=',
                    'status'         => '1',
                    'sort'           => '45',
                    'note'         => '描述',
                    'setup'          => "array ('default' => '', 'css' => '', 'placeholder'=>'','fieldtype' => 'varchar',)"
                ];
                // 内容
                $data[] = [
                    'module_id'      => $module->id,
                    'field'          => 'content',
                    'name'           => '内容',
                    'required'       => '0',
                    'maxlength'      => '0',
                    'type'           => 'editor',
                    'source'    => '0',
                    'relation_model' => '',
                    'relation_field' => '',
                    'is_add'         => '1',
                    'is_edit'        => '1',
                    'is_list'        => '0',
                    'is_search'      => '0',
                    'is_sort'        => '0',
                    'search_type'    => '=',
                    'status'         => '1',
                    'sort'           => '45',
                    'note'           => '内容',
                    'setup'          => "array('default' => '', 'css' => '','placeholder'=>'','height'=>'', 'fieldtype' => 'text',)"
                ];
               // 模板
                $data[] = [
                    'module_id'      => $module->id,
                    'field'          => 'template',
                    'name'           => '模板',
                    'tips'           => '设置此条记录的模板，如：article_show.html 或 article_show， 注：不用带后缀',
                    'required'       => '0',
                    'maxlength'      => '100',
                    'type'           => 'text',
                    'source'    => '0',
                    'relation_model' => '',
                    'relation_field' => '',
                    'is_add'         => '1',
                    'is_edit'        => '1',
                    'is_list'        => '0',
                    'is_search'      => '0',
                    'is_sort'        => '0',
                    'search_type'    => '=',
                    'status'         => '1',
                    'sort'           => '45',
                    'note'         => '模板',
                    'setup'          => "array ('default' => '', 'css' => '','placeholder'=>'','height'=>'', 'fieldtype' => 'varchar',)"
                ];
                // 推荐位
                $data[] = [
                    'module_id'      => $module->id,
                    'field'          => 'recommend_id',
                    'name'           => '推荐位',
                    'required'       => '0',
                    'maxlength'      => '10',
                    'type'           => 'select',
                    'source'         => '2',
                    'relation_model' => 'Recommend',
                    'relation_field' => 'name',
                    'is_add'         => '1',
                    'is_edit'        => '1',
                    'is_list'        => '0',
                    'is_search'      => '1',
                    'is_sort'        => '0',
                    'search_type'    => '=',
                    'status'         => '1',
                    'sort'           => '6',
                    'note'           => '推荐位',
                    'setup'          => "array ('default' => '', 'css' => '','placeholder'=>'','fieldtype' => 'int',)"
                ];
                
            }
           
            // 添加创建时间。更新时间
           $data[] =[
               
                    'module_id' => $module->id,
                    'field' => 'create_time',
                    'name' => '创建时间',
                    'tips' => '',
                    'type' => 'datetime',
                    'minlength' => 0,
                    'maxlength' => 0,
                    'is_list'=>1,
                    'search_type' => '=',
                    'sort' => 99,
                    'status' => 1,
                    'setup' => "array('default'=>'','format'=>'Y-m-d H:i:s','css'=>'','placeholder'=>'','fieldtype'=>'int',)",
                    'note' => '创建时间'
           ];

           $data[] = [
                    'module_id' => $module->id,
                    'field' => 'update_time',
                    'name' => '更新时间',
                    'tips' => '',
                    'type' => 'datetime',
                    'minlength' => 0,
                    'maxlength' => 0,
                    'is_list'=>1, 
                    'sort'=> 100,
                    'search_type' => '=',
                    'status' => 1,
                    'setup' => "array('default'=>'','format'=>'Y-m-d H:i:s','css'=>'','placeholder'=>'','fieldtype'=>'int',)",
                    'note' => '更新时间'
            ];

            // 从数据库中获取表字段信息
            $sql        = "SELECT * FROM `information_schema`.`columns` WHERE TABLE_SCHEMA = :table_schema AND table_name = :table_name "
                        . "ORDER BY ORDINAL_POSITION";
            $column_list = Db::query($sql, ['table_schema' => config('database.connections.mysql.database'), 'table_name' => $table_Name]);
         
            // 查看是否设置主键
            $pri_key = '';

            foreach($column_list as $k => $values){
                if ($values['COLUMN_KEY'] == 'PRI') {
                    $pri_key = $values['COLUMN_NAME'];
                    break;
                }
                if (!$pri_key) {
                    return '请设置 [' . $table_Name . '] 表的主键';
                }
            }

            // 循环所有字段
            foreach($column_list as $key => $values){
                $continue = false;
                foreach($data as $kk => $vv ){
                    if($vv['field']  == $values['COLUMN_NAME']){
                        $continue = true;
                        break;
                    }
                   
                }
                if($continue == true){
                    continue;
                }

                // 获取字段类型
                $inputType = self::getFieldType($values);
                
                $maxlength = substr(substr($values['COLUMN_TYPE'], strripos($values['COLUMN_TYPE'], "(") + 1), 0, strrpos(substr($values['COLUMN_TYPE'], strripos($values['COLUMN_TYPE'], "(") + 1), ")")); // 字符长度
                if (strpos($maxlength, ',') !== false) {
                    $maxlength = explode(',', $maxlength)[0];
                }
                $step = $inputType == 'number' && $values['NUMERIC_SCALE'] > 0 ? "0." . str_repeat(0, $values['NUMERIC_SCALE'] - 1) . "1" : 1;

                $columnName    = $values['COLUMN_NAME'];                                          // 字段名称
                $columnComment = explode(':', $values['COLUMN_COMMENT'])[0] ?: $columnName;       // 字段别名
                $note        = $columnComment;                                             // 字段备注
                $default       = $values['COLUMN_DEFAULT'];                                       // 默认值
                $maxlength     = $maxlength ?: 0;                                            // 字符长度
                $dataType      = $values['DATA_TYPE'];                                            // 字段类型
                $isAdd         = 1;                                                          // 添加状态
                $isEdit        = 1;                                                          // 修改状态
                $isList        = 1;                                                          // 列表状态
                $isSearch      = 1;                                                          // 搜索状态
                $isSort        = 1;                                                          // 排序状态
                $searchType    = '=';                                                        // 搜索类型

                // 部分类型的默认值为0
                if (in_array($dataType, ['tinyint', 'bigint', 'int', 'mediumint', 'smallint', 'decimal', 'double', 'float'])) {
                    $default = $default ?: 0;
                }

                // 部分类型需要小数点
                
                $numericScale = 0;
                if ($values['NUMERIC_SCALE']) {
                    $numericScale = $values['NUMERIC_SCALE'];
                }
                
                if ($inputType == 'number') {
                    $isSearch = 0;
                    $setup    = "array ('default' => '{$default}',  'css' => '','placeholder'=>'',  'fieldtype' => '{$dataType}', )";
                    $data[]   = [
                        'module_id'      => $module->id,
                        'field'          => $columnName,
                        'name'           => $columnComment,
                        'required'       => '0',
                        'maxlength'      => $maxlength,
                        'type'           => $inputType,
                        'source'    => '0',
                        'relation_model' => '',
                        'relation_field' => '',
                        'is_add'         => $isAdd,
                        'is_edit'        => $isEdit,
                        'is_list'        => $isList,
                        'is_search'      => $isSearch,
                        'is_sort'        => $isSort,
                        'search_type'    => $searchType,
                        'status'         => '1',
                        'sort'           => '50',
                        'note'         => $note,
                        'setup'          => $setup,
                    ];
                } elseif ($inputType == 'datetime') {
                    $isSearch = 0;
                    $setup    = "array ('default' => '{$default}', 'format' => 'Y-m-d H:i:s',  'css' => '', 'placeholder' => '', 'fieldtype' => '{$dataType}',)";
                    $data[]   = [
                        'module_id'      => $module->id,
                        'field'          => $columnName,
                        'name'           => $columnComment,
                        'required'       => '0',
                        'maxlength'      => $maxlength,
                        'type'           => $inputType,
                        'source'    => '0',
                        'relation_model' => '',
                        'relation_field' => '',
                        'is_add'         => $isAdd,
                        'is_edit'        => $isEdit,
                        'is_list'        => $isList,
                        'is_search'      => $isSearch,
                        'is_sort'        => $isSort,
                        'search_type'    => $searchType,
                        'status'         => '1',
                        'sort'           => '50',
                        'note'         => $note,
                        'setup'          => $setup,
                    ];
                } elseif (in_array($inputType, ['image', 'images', 'file', 'files'])) {
                    $isSearch = 0;
                    $isSort   = 0;
                    $setup    = "array ('default' => '{$default}',  'css' => '', 'placeholder' => '', 'fieldtype' => '{$dataType}',)";
                    $data[]   = [
                        'module_id'      => $module->id,
                        'field'          => $columnName,
                        'name'           => $columnComment,
                        'required'       => '0',
                        'maxlength'      => $maxlength,
                        'type'           => $inputType,
                        'source'    => '0',
                        'relation_model' => '',
                        'relation_field' => '',
                        'is_add'         => $isAdd,
                        'is_edit'        => $isEdit,
                        'is_list'        => $isList,
                        'is_search'      => $isSearch,
                        'is_sort'        => $isSort,
                        'search_type'    => $searchType,
                        'status'         => '1',
                        'sort'           => '50',
                        'note'         => $note,
                        'setup'          => $setup,
                    ];
                } elseif ($inputType == 'editor') {
                    $isList   = 0;
                    $isSearch = 0;
                    $isSort   = 0;
                    $setup    = "array ('default' => '{$default}',  'css' => '', 'height' => '','placeholder' => '', 'fieldtype' => '{$dataType}',)";
                    $data[]   = [
                        'module_id'      => $module->id,
                        'field'          => $columnName,
                        'name'           => $columnComment,
                        'required'       => '0',
                        'maxlength'      => $maxlength,
                        'type'           => $inputType,
                        'source'    => '0',
                        'relation_model' => '',
                        'relation_field' => '',
                        'is_add'         => $isAdd,
                        'is_edit'        => $isEdit,
                        'is_list'        => $isList,
                        'is_search'      => $isSearch,
                        'is_sort'        => $isSort,
                        'search_type'    => $searchType,
                        'status'         => '1',
                        'sort'           => '50',
                        'note'         => $note,
                        'setup'          => $setup,
                    ];
                } elseif ($inputType == 'password') {
                    $isList   = 0;
                    $isSearch = 0;
                    $isSort   = 0;
                    $isEdit   = 0;
                    $setup    = "array ('default' => '{$default}',  'css' => '','placeholder' => '', 'fieldtype' => '{$dataType}',)";
                    $data[]   = [
                        'module_id'      => $module->id,
                        'field'          => $columnName,
                        'name'           => $columnComment,
                        'required'       => '0',
                        'maxlength'      => $maxlength,
                        'type'           => $inputType,
                        'source'    => '0',
                        'relation_model' => '',
                        'relation_field' => '',
                        'is_add'         => $isAdd,
                        'is_edit'        => $isEdit,
                        'is_list'        => $isList,
                        'is_search'      => $isSearch,
                        'is_sort'        => $isSort,
                        'search_type'    => $searchType,
                        'status'         => '1',
                        'sort'           => '50',
                        'note'         => $note,
                        'setup'          => $setup,
                    ];
                } else {
                    $setup  = "array ('default' => '{$default}',  'css' => '', 'placeholder' => '', 'fieldtype' => '{$dataType}',)";
                    $data[] = [
                        'module_id'      => $module->id,
                        'field'          => $columnName,
                        'name'           => $columnComment,
                        'required'       => '0',
                        'maxlength'      => $maxlength,
                        'type'           => $inputType,
                        'source'    => '0',
                        'relation_model' => '',
                        'relation_field' => '',
                        'is_add'         => $isAdd,
                        'is_edit'        => $isEdit,
                        'is_list'        => $isList,
                        'is_search'      => $isSearch,
                        'is_sort'        => $isSort,
                        'search_type'    => $searchType,
                        'status'         => '1',
                        'sort'           => '50',
                        'note'         => $note,
                        'setup'          => $setup,
                    ];
                }

            }
          //  halt($data);
            $field_model ->saveAll($data);
            return true;

    }else{

           $sql  = '
            `' . $pk . '` INT(11) unsigned NOT NULL AUTO_INCREMENT COMMENT \'主键\',
            ';
            // 为栏目表时
            if($table_Type == 1){
               $sql .= '
                `cate_id` int(10) unsigned NOT NULL DEFAULT \'0\' COMMENT \'栏目id\',
                `title` VARCHAR(255) NOT NULL DEFAULT \'\' COMMENT \'标题\' COLLATE \'utf8_general_ci\',
                `keywords` VARCHAR(255) NOT NULL DEFAULT \'\' COMMENT \'关键词\' COLLATE \'utf8_general_ci\',
                `description` varchar(255) NULL DEFAULT NULL COMMENT \'描述\' COLLATE \'utf8_general_ci\',
                `content` TEXT(65535) NULL DEFAULT NULL COMMENT \'内容\' COLLATE \'utf8_general_ci\',
                `template` varchar(100) NOT NULL DEFAULT \'\' COMMENT \'模板\' COLLATE \'utf8_general_ci\',
                `recommend_id` int(10) unsigned NOT NULL DEFAULT \'0\' COMMENT \'推荐位\',
                ';   
            }
            // 自动添加排序字段
            if($module->is_sort){
               $sql .= '`sort` INT(11) unsigned NOT NULL DEFAULT \'0\' COMMENT \'排序\',';
            }
            // 自动添加状态字段
            if($module->is_status){
               $sql .= '`status` TINYINT(1) DEFAULT \'1\' COMMENT \'状态\',';
            }
    
           $sql  .= '
           `create_time` INT(11) unsigned NOT NULL DEFAULT \'0\' COMMENT \'创建时间\',
           `update_time` INT(11) unsigned NOT NULL DEFAULT \'0\' COMMENT \'更新时间\',
           ';

             /**
             * 创建数据表;
             */
        $sql = "CREATE TABLE IF NOT EXISTS `{$table_Name}` (
            {$sql}
            PRIMARY KEY (`{$pk}`)
           )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='{$table_desc}'";
        }
        try{
            Db::execute($sql);
         }catch(\Exception $e){
             return $e->getMessage();
         }
        // 添加 字段 
        $data[] = [
            'module_id' => $module->id,
            'field' => $pk,
            'name' => '主键',
            'tips' => '',
            'type' => 'hidden',
            'minlength' => 0,
            'maxlength' => 0,
            'sort' => 0,
            'is_edit'=>1,
            'is_list'=>1,
            'status' => 1,
            'setup' => "array('default'=>'','css'=>'','fieldtype'=>'int')",
            'note' => '自增ID'
        ];
       
        // 表类型为 栏目表 里面以下字段：[栏目ID、标题、关键词、描述、内容、模板]
        if($table_Type == 1){
            // 栏目id
            $data[] = [
                'module_id'      => $module->id,
                'field'          => 'cate_id',
                'name'           => '栏目',
                'required'       => '1',
                'maxlength'      => '0',
                'type'           => 'select',
                'source'    => '2',
                'relation_model' => 'Cate',
                'relation_field' => 'cate_name',
                'is_add'         => '1',
                'is_edit'        => '1',
                'is_list'        => '1',
                'is_search'      => '1',
                'is_sort'        => '0',
                'search_type'    => '=',
                'status'         => '1',
                'sort'           => '2',
                'note'         => '栏目',
                'setup'          => "array ('default' => '0', 'css' => '','placeholder'=>'','fieldtype' => 'int',)"
            ];
            // 标题
            $data[] = [
                'module_id'      => $module->id,
                'field'          => 'title',
                'name'           => '标题',
                'required'       => '0',
                'maxlength'      => '0',
                'type'           => 'text',
                'source'    => '0',
                'relation_model' => '',
                'relation_field' => '',
                'is_add'         => '1',
                'is_edit'        => '1',
                'is_list'        => '0',
                'is_search'      => '0',
                'is_sort'        => '0',
                'search_type'    => '=',
                'status'         => '1',
                'sort'           => '43',
                'note'         => '关键词',
                'setup'          => "array ('default' => '0', 'css' => '','placeholder'=>'', 'fieldtype' => 'varchar',)"
            ];

            // 关键词
            $data[] = [
                'module_id'      => $module->id,
                'field'          => 'keywords',
                'name'           => '关键词',
                'required'       => '0',
                'maxlength'      => '0',
                'type'           => 'text',
                'source'    => '0',
                'relation_model' => '',
                'relation_field' => '',
                'is_add'         => '1',
                'is_edit'        => '1',
                'is_list'        => '0',
                'is_search'      => '0',
                'is_sort'        => '0',
                'search_type'    => '=',
                'status'         => '1',
                'sort'           => '44',
                'note'         => '关键词',
                'setup'          => "array ('default' => '0', 'css' => '', 'placeholder'=>'','fieldtype' => 'varchar',)"
            ];
            // 描述
            $data[] = [
                'module_id'      => $module->id,
                'field'          => 'description',
                'name'           => '描述',
                'required'       => '0',
                'maxlength'      => '255',
                'type'           => 'textarea',
                'source'    => '0',
                'relation_model' => '',
                'relation_field' => '',
                'is_add'         => '1',
                'is_edit'        => '1',
                'is_list'        => '0',
                'is_search'      => '0',
                'is_sort'        => '0',
                'search_type'    => '=',
                'status'         => '1',
                'sort'           => '45',
                'note'         => '描述',
                'setup'          => "array ('default' => '0', 'css' => '', 'placeholder'=>'','fieldtype' => 'varchar',)"
            ];
            // 内容
            $data[] = [
                'module_id'      => $module->id,
                'field'          => 'content',
                'name'           => '内容',
                'required'       => '0',
                'maxlength'      => '0',
                'type'           => 'editor',
                'source'    => '0',
                'relation_model' => '',
                'relation_field' => '',
                'is_add'         => '1',
                'is_edit'        => '1',
                'is_list'        => '0',
                'is_search'      => '0',
                'is_sort'        => '0',
                'search_type'    => '=',
                'status'         => '1',
                'sort'           => '45',
                'note'         => '内容',
                'setup'          => "array ('default' => '0', 'css' => '','placeholder'=>'','height'=>'', 'fieldtype' => 'text',)"
            ];
          // 模板
          $data[] = [
            'module_id'      => $module->id,
            'field'          => 'template',
            'name'           => '模板',
            'tips'           => '设置此条记录的模板，如：article_show.html 或 article_show， 注：不用带后缀',
            'required'       => '0',
            'maxlength'      => '100',
            'type'           => 'text',
            'source'    => '0',
            'relation_model' => '',
            'relation_field' => '',
            'is_add'         => '1',
            'is_edit'        => '1',
            'is_list'        => '0',
            'is_search'      => '0',
            'is_sort'        => '0',
            'search_type'    => '=',
            'status'         => '1',
            'sort'           => '45',
            'note'         => '模板',
            'setup'          => "array ('default' => '0', 'css' => '','placeholder'=>'','height'=>'', 'fieldtype' => 'varchar',)"
        ];
            // 推荐位
            $data[] = [
                'module_id'      => $module->id,
                'field'          => 'recommend_id',
                'name'           => '推荐位',
                'required'       => '0',
                'maxlength'      => '10',
                'type'           => 'select',
                'source'         => '2',
                'relation_model' => 'Recommend',
                'relation_field' => 'name',
                'is_add'         => '1',
                'is_edit'        => '1',
                'is_list'        => '0',
                'is_search'      => '1',
                'is_sort'        => '0',
                'search_type'    => '=',
                'status'         => '1',
                'sort'           => '6',
                'note'           => '推荐位',
                'setup'          => "array ('default' => '', 'css' => '','placeholder'=>'','fieldtype' => 'int',)"
            ];
        }

          // 自动添加排序字段
          if($module->is_sort){
            $data[] = [
                'module_id' => $module->id,
                'field' => 'sort',
                'name' => '排序',
                'tips' => '',
                'type' => 'number',
                'required' => 0,
                'minlength' => 0,
                'maxlength' => 0,
                'is_add'  => 1,
                'is_edit'  => 1,
                'is_list'=>1,
                'search_type' => '=',
                'is_sort' => 1,
                'sort' => 97,
                'status' => 1,
                'setup' => "array('default'=>'','css'=>'','placeholder'=>'','fieldtype'=>'int',)",
                'note' => '排序'
            ]; 
        }
        // 自动添加状态字段
        if($module->is_status){
            $data[] = [
                'module_id'     => $module->id,
                'field'         => 'status',
                'name'          => '状态',
                'tips'          => '',
                'type'          => 'radio',
                'required'      => 0,
                'minlength'     => 0,
                'maxlength'     => 0,
                'source'        => 1,
                'dict_id'       => 1,
                'is_add'        => 1,
                'is_edit'       => 1,
                'is_list'       =>1,
                'required'      => 1,
                'is_search'     => 1,
                'search_type'   => '=',
                'is_sort'       => 0,
                'sort'          => 98,
                'status'        => 1,
                'setup'         => "array('default'=>'1','css'=>'','placeholder'=>'','fieldtype'=>'tinyint',)",
                'note'          => '状态'
            ]; 
        }

             // 添加创建时间。更新时间
           $data[] =[
            
                 'module_id' => $module->id,
                 'field' => 'create_time',
                 'name' => '创建时间',
                 'tips' => '',
                 'type' => 'datetime',
                 'minlength' => 0,
                 'maxlength' => 0,
                 'is_list'=>1,
                 'search_type' => '=',
                 'sort' => 99,
                 'status' => 1,
                 'setup' => "array('default'=>'','format'=>'Y-m-d H:i:s','css'=>'','placeholder'=>'','fieldtype'=>'int',)",
                 'note' => '创建时间'
            ];
            $data[] =   [
                 'module_id' => $module->id,
                 'field' => 'update_time',
                 'name' => '更新时间',
                 'tips' => '',
                 'type' => 'datetime',
                 'minlength' => 0,
                 'maxlength' => 0,
                 'is_list'=>1, 
                 'sort'=> 100,
                 'search_type' => '=',
                 'status' => 1,
                 'setup' => "array('default'=>'','format'=>'Y-m-d H:i:s','css'=>'','placeholder'=>'','fieldtype'=>'int',)",
                 'note' => '更新时间'
            ];
             
      
          // 存储到field 数据表
        $field_model->saveAll($data); 
        return true;
    }

/**
     * 根据字段信息获取字段类型
     * @param $field 字段信息
     * @return string
     */
    private static function getFieldType($field)
    {
        $inputType = 'text';
        switch ($field['DATA_TYPE']) {
            case 'bigint':
            case 'int':
            case 'mediumint':
            case 'smallint':
            case 'tinyint':
                $inputType = 'number';
                break;
            case 'enum':
            case 'set':
            case 'decimal':
            case 'double':
            case 'float':
                $inputType = 'number';
                break;
            case 'longtext':
            case 'text':
                $inputType = 'textarea';
                break;
            case 'mediumtext':
                $inputType = 'textarea';
                break;
            case 'smalltext':
            case 'tinytext':
            case 'year':
            case 'date':
            case 'time':
            case 'datetime':
            case 'timestamp':
            default:
                break;
        }
        // 获取字段类型
        $fieldsName = $field['COLUMN_NAME'];

        // 时间类型
        foreach (['time'] as $values) {
            if (preg_match("/{$values}$/i", $fieldsName) && $field['DATA_TYPE'] == 'int') {
                $inputType = 'datetime';
                break;
            }
        }

        // 单图片类型
        foreach (['image', 'avatar'] as $values) {
            if (preg_match("/{$values}$/i", $fieldsName) && in_array($field['DATA_TYPE'], ['varchar', 'text', 'mediumtext'])) {
                $inputType = 'image';
                break;
            }
        }

        // 多图片类型
        foreach (['images', 'avatars'] as $values) {
            if (preg_match("/{$values}$/i", $fieldsName) && in_array($field['DATA_TYPE'], ['varchar', 'text', 'mediumtext'])) {
                $inputType = 'images';
                break;
            }
        }

        // 单文件类型
        foreach (['file'] as $values) {
            if (preg_match("/{$values}$/i", $fieldsName) && in_array($field['DATA_TYPE'], ['varchar', 'text', 'mediumtext'])) {
                $inputType = 'file';
                break;
            }
        }

        // 多文件类型
        foreach (['files'] as $values) {
            if (preg_match("/{$values}$/i", $fieldsName) && in_array($field['DATA_TYPE'], ['varchar', 'text', 'mediumtext'])) {
                $inputType = 'files';
                break;
            }
        }

        // 编辑器类型
        foreach (['content'] as $values) {
            if (preg_match("/{$values}$/i", $fieldsName) && in_array($field['DATA_TYPE'], ['varchar', 'text', 'mediumtext'])) {
                $inputType = 'editor';
                break;
            }
        }

        // 密码类型
        foreach (['password'] as $values) {
            if (preg_match("/{$values}$/i", $fieldsName) && in_array($field['DATA_TYPE'], ['varchar'])) {
                $inputType = 'password';
                break;
            }
        }

        return $inputType;
    }   
    /**
     *  编辑数据表
     */
    public static function changeTables($data){
        $moudle = self::where('id',$data['id'])->find();
        if(empty($moudle)){
            return "要修改 {$data['module_name']} 模块数据不存在";
        }
        // 获取表前缀
        $prefix = config('database.connections.mysql.prefix');
         // 获取完整数据表名
        //$table_Name = $prefix.$data['table_name'];
        $oldTableName = $prefix. $moudle->table_name;
        $newTableName = $prefix.$data['table_name'];
        $pk = $moudle->pk;
        $sql = '';
        $field = Field::find($moudle->id);
        // 更新主键
        if($moudle->pk != $data['pk']){
            $sql = "ALTER TABLE `{$oldTableName}` CHANGE COLUMN `{$pk}` `{$data['pk']}` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ";
            try{
                Db::execute($sql);
            }catch(\Exception $e){
                return '主键字段更改失败：'.$e->getMessage();
            }
          $field->pk = $data['pk'];
          $field->force()->save();
        }
        // 更新数据表
        if($moudle->table_name != $data['table_name'])
        {
            $sql = "RENAME TABLE `{$oldTableName}` TO `{$newTableName}`";
            try{
                Db::execute($sql);
            }catch(\Exception $e){
                return '数据表名更改失败：'.$e->getMessage();
            }
            
            $field->table_name = $data['table_name'];
            $field->force()->save();
        }
        

        return true;
    }

    /**
     * 删除Field表对应的字段数据
     */
    public static function getFieldDel($id){
         $do = strpos($id,",") !== false ? 'in' : '=';
         $res = Field::where("module_id",$do,$id)->delete();
         return $res;
    }

}
