<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<div class="container">
    <div class="box">
        <div class="box-header">
            <span class="title"><i class="fa fa-sign-in"></i> 系统提示</span>
        </div>
        <div class="box-padding">
            <h4 style="font-size: 18px">操作失败：${requestScope.message}</h4>
        </div>


    </div>
    <!--box end-->
</div>
<!--container end-->
</body>
</html>