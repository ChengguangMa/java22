<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>

    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/style.css">
    <style>

       body{
           padding-top:100px ;
       }

    </style>
</head>
<body>

<%@ include file="include/navbar.jsp" %>
<c:if test="${not empty requestScope.message}">
    <div class="alert alert-success">
            ${requestScope.message}
    </div>
</c:if>

<div class="container">
    <div class="box">
        <div class="talk-item">
            <ul class="topic-type unstyled inline" style="margin-bottom:0px;" id="nodename">
                <li class="${empty param.nodeid ? 'active':''}"><a href="/home">全部</a></li>

                <c:forEach items="${nodeList}" var="node">
                    <li class="${node.id==param.nodeid ? 'active':''}"><a href="/home?nodeid=${node.id}">${node.nodename}</a></li>
                </c:forEach>
            </ul>
        </div>
        <c:forEach items="${page.items}" var="topic">
            <div class="talk-item">
            <table class="talk-table">
                <tr>
                    <td width="50">
                        <img class="avatar" src="${qiniu}${topic.user.avatar}?imageView2/1/w/40/h/40" alt="">
                    </td>
                    <td width="80">
                        <a href="">${topic.user.username}</a>
                    </td>
                    <td width="auto">
                        <a href="/post?topicid=${topic.id}">${topic.title}</a>
                    </td>
                    <td width="50" align="center">
                        <span class="badge">${topic.replynum}</span>
                    </td>
                </tr>
            </table>
        </div>
        </c:forEach>

        <div class="pagination pagination-mini pagination-centered">
            <ul id="pagination" style="margin-bottom:20px;"></ul>
        </div>

    </div>
    <!--box end-->
</div>
<!--container end-->
<div class="footer">
    <div class="container">
        Copyright © 2017 心灵驿站
    </div>
</div>
<script src="/static/js/jquery-1.12.4.min.js"></script>
<script src="/static/js/jquery.twbsPagination.min.js"></script>
<script src="/static/js/user/notify.js"></script>


<script>

    $(function(){
        $("#pagination").twbsPagination({
            totalPages:${page.totalPage},
            visiblePages:5,
            first:'首页',
            last:'末页',
            prev:'上一页',
            next:'下一页',
            href: "${empty param.nodeid ? '?p={{number}}':'?p={{number}}&nodeid='}"+${param.nodeid}

        });

    });

</script>
</body>
</html>

