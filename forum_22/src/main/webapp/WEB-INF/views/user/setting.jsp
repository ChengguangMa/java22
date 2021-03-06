<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/js/sweetalert.css">
    <link rel="stylesheet" href="/static/js/uploader/webuploader.css">
    <style>
        element.style{
            background:#006dcc;
        }
    </style>
</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<div class="container">
    <div class="box">
        <div class="box-header">
            <span class="title"><i class="fa fa-cog"></i> 基本设置</span>
        </div>

        <form action="" class="form-horizontal" id="basicForm">
            <div class="control-group">
                <label class="control-label">账号</label>
                <div class="controls">
                    <input type="text" value="${sessionScope.curr_user.username}" readonly>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">电子邮件</label>
                <div class="controls">
                    <input type="text" name="email" value="${sessionScope.curr_user.email}">
                </div>
            </div>
            <div class="form-actions">
                <button type="button" class="btn btn-primary" id="basicBtn">保存</button>
            </div>

        </form>

    </div>
    <!--box end-->
    <div class="box">
        <div class="box-header">
            <span class="title"><i class="fa fa-key"></i> 密码设置</span>
            <span class="pull-right muted" style="font-size: 12px">如果你不打算更改密码，请留空以下区域</span>
        </div>

        <form action="" class="form-horizontal" id="passwordForm">
            <div class="control-group">
                <label class="control-label">原始密码</label>
                <div class="controls">
                    <input type="password" name="oldpassword">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">新密码</label>
                <div class="controls">
                    <input type="password" name="newpassword" id="newpassword">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">重复密码</label>
                <div class="controls">
                    <input type="password" name="repassword">
                </div>
            </div>
            <div class="form-actions">
                <button type="button" id="passwordBtn" class="btn btn-primary">保存</button>
            </div>

        </form>

    </div>
    <!--box end-->

    <div class="box">
        <div class="box-header">
            <span class="title"><i class="fa fa-user"></i> 头像设置</span>
        </div>

        <form action="" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">当前头像</label>
                <div class="controls">

                    <img id="avatar" src="http://oj7itjrjq.bkt.clouddn.com/${sessionScope.curr_user.avatar}?imageView2/1/w/40/h/40" class="img-circle" alt="设置头像">
                </div>
            </div>
            <hr>
            <p style="padding-left: 20px">关于头像的规则</p>
            <ul>
                <li>禁止使用任何低俗或者敏感图片作为头像</li>
                <li>如果你是男的，请不要用女人的照片作为头像，这样可能会对其他会员产生误导</li>
            </ul>
            <div class="form-actions">
                <div id="picker" >选择新头像</div>
            </div>


        </form>

    </div>
    <!--box end-->

</div>
<!--container end-->
<script src="/static/js/jquery-1.11.1.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
<script src="/static/js/user/setting.js"></script>
<script src="/static/js/uploader/webuploader.min.js"></script>
<script src="/static/js/sweetalert.min.js"></script>
<script src="/static/js/user/notify.js"></script>
<script>

    $(function () {
    var uploader=WebUploader.create({
        swf:"/static/js/uploader/Uploader.swf",
        server:"http://up-z1.qiniu.com/",
        pick:"#picker",
        auto:"true",
        fileVal:'file',
        formData:{'token':'${token}'},
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/!*'
        }
    });
        uploader.on('uploadSuccess',function(file,data){
            var fileKey=data.key;
            //修改数据库中的值
            $.post("/setting?action=avatar",{'fileKey':fileKey})
                .done(function (data) {

                  if (data.state=='success') {
                      var url = "http://oj7itjrjq.bkt.clouddn.com/" + fileKey;
                      $("#avatar").attr("src",url+"?imageView2/1/w/40/h/40");
                      $("#navbar_avatar").attr("src",url+"?imageView2/1/w/20/h/20");

                      swal("头像上传成功", "", "success");
                  }
                }).error(function () {
                alert("头像设置失败");
            })

        });
        uploader.on('uploadError',function () {
            sweetAlert("上传失败请稍后再试", "Something went wrong!", "error");
        });

    })


</script>


</body>
</html>