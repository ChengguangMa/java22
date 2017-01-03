<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/admin.css">
    <link rel="stylesheet" href="/static/js/sweetalert.css">

    <style>
        .mt20 {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%@include file="../include/adminnavbar.jsp" %>
<!--header-bar end-->
<div class="container-fluid mt20">
    <a href="/admin/newnode?_=2" class="btn btn-success">添加新节点</a>
    <table class="table">
        <thead>
        <tr>
            <th>节点名称</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
      <c:forEach items="${nodeList}" var="node">
            <td>${node.nodename}</td>
            <td>
                <a href="/admin/updatenode?nodeid=${node.id}">修改</a>
                <a href="javascript:;" class="delnode" rel="${node.id}">删除</a>
            </td>
        </tr>
      </c:forEach>
        </tbody>
    </table>
</div>
<!--container end-->
<script src="/static/js/jquery-1.12.4.min.js"></script>
<script src="/static/js/jquery.twbsPagination.min.js"></script>
<script src="/static/js/sweetalert.min.js"></script>

<script>

    $(function () {

        $(".delnode").click(function () {
            var nodeid=$(this).attr("rel");

            swal({
                    title: "你确定要删除吗?",
                    text: "你将要删除这个主题帖!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定!",
                    closeOnConfirm: false
                },
                function(){
                    $.ajax({
                        url:'/admin/delNode',
                        type:'post',
                        data:{'nodeid':nodeid},
                        success:function (data) {
                            if(data.state == 'success') {
                                swal({title:"删除成功!"},function () {
                                    window.history.go(0);
                                });
                            } else {
                                swal(data.message);
                            }
                        },
                        error:function () {
                            swal("服务器异常,删除失败请稍后再试")
                        }
                    })
                });

        });




    })


</script>

</body>
</html>

