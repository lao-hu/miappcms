{__NOLAYOUT__}<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>跳转提示</title>
		<link rel="stylesheet" href="/static/plugins/layui/css/layui.css" />
	 
	</head>
  <style>
  .pear-container {
    margin: 10px;
    background-color: whitesmoke;
}
.result {
	text-align: center;

}
.result .success svg {
	color: #32C682;
	text-align: center;
	margin-top: 40px;

}
.result .error svg {
	color: #f56c6c;
	text-align: center;
	margin-top: 40px;

}
.result .title {
	margin-top: 25px;

}
.result .desc {
	margin-top: 25px;
	width: 60%;
	margin-left: 20%;
	color: rgba(0, 0, 0, .52);
}
.result .content {
	margin-top: 20px;
	width: 80%;
	border-radius: 10px;
	background-color: whitesmoke;
	height: 200px;
	margin-left: 10%;
}
.result .action {
	padding-top: 10px;
	border-top: 1px whitesmoke solid;
	margin-top: 25px;
}
.pear-btn {
    display: inline-block;
    line-height: 38px;
    white-space: nowrap;
    cursor: pointer;
    text-align: center;
    box-sizing: border-box;
    outline: none;
    transition: 0.1s;
    font-weight: 500;
    padding: 0 18px;
    height: 38px;
    font-size: 14px;
    background-color: white;
    /* border: 1px solid #dcdfe6; */
    border-radius: 2px;
}
.pear-btn-danger, .pear-btn-warming, .pear-btn-success, .pear-btn-primary {
    height: 37px;
    line-height: 37px;
    color: #fff !important;
}
.pear-btn-primary {
    border: #2D8CF0;
    background-color:#d75757 !important;
}
  </style>

	<body class="pear-container">
		<div class="layui-card">
			<div class="layui-card-body">
				<div class="result">
                <?php if($code == 1): ?>
					<div class="success">
					<svg viewBox="64 64 896 896" data-icon="check-circle" width="80px" height="80px" fill="currentColor" aria-hidden="true" focusable="false" class=""><path d="M699 353h-46.9c-10.2 0-19.9 4.9-25.9 13.3L469 584.3l-71.2-98.8c-6-8.3-15.6-13.3-25.9-13.3H325c-6.5 0-10.3 7.4-6.5 12.7l124.6 172.8a31.8 31.8 0 0 0 51.7 0l210.6-292c3.9-5.3.1-12.7-6.4-12.7z"></path><path d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372z"></path></svg>
				  </div>
                <?php else: ?>
                <div class="error">
					<svg viewBox="64 64 896 896" data-icon="close-circle" width="80px" height="80px" fill="currentColor" aria-hidden="true" focusable="false" class=""><path d="M685.4 354.8c0-4.4-3.6-8-8-8l-66 .3L512 465.6l-99.3-118.4-66.1-.3c-4.4 0-8 3.5-8 8 0 1.9.7 3.7 1.9 5.2l130.1 155L340.5 670a8.32 8.32 0 0 0-1.9 5.2c0 4.4 3.6 8 8 8l66.1-.3L512 564.4l99.3 118.4 66 .3c4.4 0 8-3.5 8-8 0-1.9-.7-3.7-1.9-5.2L553.5 515l130.1-155c1.2-1.4 1.8-3.3 1.8-5.2z"></path><path d="M512 65C264.6 65 64 265.6 64 513s200.6 448 448 448 448-200.6 448-448S759.4 65 512 65zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372z"></path></svg>
				    </div>
                <?php endif; ?>  

					<h2 class="title"><?php echo(strip_tags($msg));?></h2>
					<p class="desc">
						  页面跳转中 : 等待时间： <b id="wait"><?php echo($wait);?></b> 秒
					</p>
				
					<div class="action">
						<a id="href" href="<?php echo($url);?>" class="pear-btn pear-btn-primary href">点击直接跳转</a>
					</div>
				</div>
			</div>
		</div>
     <script type="text/javascript">
      (function(){
            var wait = document.getElementById('wait'),
                href = document.getElementById('href').href;
            var interval = setInterval(function(){
                var time = --wait.innerHTML;
                if(time <= 0) {
                    location.href = href;
                    clearInterval(interval);
                };
            }, 1000);
        })();
    </script>
	</body>
</html>
