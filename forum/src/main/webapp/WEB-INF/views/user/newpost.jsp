<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发布新主题</title>
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/js/editer/styles/simditor.css">
    <link rel="stylesheet" href="/static/css/emoji/simditor-emoji.css">
    <link rel="stylesheet" href="/static/css/highlightcss/default.css">

</head>
<body>
<%@include file="../include/navbar.jsp" %>
<!--header-bar end-->
<div class="container">
    <div class="box">
        <div class="box-header">
            <span class="title"><i class="fa fa-plus"></i> 发布新主题</span>
        </div>

        <form action="" id="postForm" style="padding: 20px">
            <label class="control-label">主题标题</label>
            <input type="text" name="post_title" id="post_title" class="post_title" style="width: 100%;box-sizing: border-box;height: 30px" placeholder="请输入主题标题，如果标题能够表达完整内容，则正文可以为空">
            <label class="control-label">正文</label>

            <textarea name="editor" id="editor"></textarea>

            <select name="nodeid" id="nodeid" style="margin-top:15px;">
                <option value="">请选择节点</option>
                <c:forEach items="${nodeList}" var="node">
                    <option value="${node.id}">${node.nodename}</option>
                </c:forEach>
            </select>

        </form>
        <div class="form-actions" style="text-align: right">
            <button id="postBtn" class="btn btn-primary">发布主题</button>
        </div>


    </div>
    <!--box end-->
</div>
<!--container end-->
<script src="/static/js/jquery-1.11.1.js"></script>
<script src="/static/js/editer/scripts/module.min.js"></script>
<script src="/static/js/editer/scripts/hotkeys.min.js"></script>
<script src="/static/js/editer/scripts/uploader.min.js"></script>
<script src="/static/js/editer/scripts/simditor.min.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
<script src="/static/js/user/newpost.js"></script>
<script src="/static/js/simditor-emoji.js"></script>
<script src="/static/js/highlight.pack.js"></script>
<script src="/static/js/user/notify.js"></script>
<script>
    hljs.initHighlightingOnLoad();

    var editor = new Simditor({
        textarea: $('#editor'),
        //optional options

        toolbar: [ 'emoji', 'title', 'bold', 'italic', 'underline', 'strikethrough', 'fontScale', 'color', 'ol', 'ul', 'blockquote', 'code', 'table', 'link', 'image', 'hr', 'indent', 'outdent', 'alignment'],
           emoji: {
                imagePath: '/static/img/emoji/',
//            images:['+1.png', '100.png', '109.png', '1234.png', '-1.png', 'a.png']
          },
        upload:{
            url:"http://up-z1.qiniu.com/",
            params:{"token":"${token}"},
            fileKey:"file"
        }

    });

</script>


</body>
</html>