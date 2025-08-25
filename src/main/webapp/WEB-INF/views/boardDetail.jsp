<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id != null ? sessionScope.id : ''}"/>
<c:set var="loginOutLink" value="${empty loginId ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${empty loginId ? 'Login' : 'Logout'}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus - 게시글 상세</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica', sans-serif;
            background: #0a0a0a;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background:
                    radial-gradient(circle at 20% 50%, rgba(120, 80, 255, 0.1) 0%, transparent 50%),
                    radial-gradient(circle at 80% 80%, rgba(255, 80, 120, 0.1) 0%, transparent 50%),
                    radial-gradient(circle at 40% 20%, rgba(80, 200, 255, 0.1) 0%, transparent 50%);
            pointer-events: none;
        }

        #menu {
            width: 100%;
            background: rgba(18, 18, 18, 0.9);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            z-index: 10;
            margin-bottom: 40px;
        }

        #menu ul {
            display: flex;
            list-style: none;
            padding: 0 20px;
            align-items: center;
            height: 60px;
        }

        #menu li {
            margin-right: 30px;
        }

        #menu a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        #menu a:hover {
            color: #7850ff;
        }

        #logo {
            color: #ffffff;
            font-size: 20px;
            font-weight: 700;
            margin-right: 50px;
        }

        .container {
            background: rgba(18, 18, 18, 0.9);
            backdrop-filter: blur(20px);
            padding: 48px;
            border-radius: 16px;
            width: 100%;
            max-width: 900px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            position: relative;
            z-index: 1;
        }

        .post-header {
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding-bottom: 24px;
            margin-bottom: 32px;
        }

        .post-title {
            color: #ffffff;
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 16px;
            letter-spacing: -0.5px;
            line-height: 1.3;
        }

        .post-meta {
            display: flex;
            gap: 24px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 14px;
        }

        .post-meta-item {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .post-meta-item i {
            font-size: 12px;
            opacity: 0.7;
        }

        .post-content {
            color: rgba(255, 255, 255, 0.9);
            font-size: 16px;
            line-height: 1.8;
            margin-bottom: 48px;
            min-height: 300px;
            white-space: pre-wrap;
            word-wrap: break-word;
        }

        .post-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 24px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            user-select: none;
        }

        .btn-group {
            display: flex;
            gap: 12px;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            user-select: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .btn-modify {
            background: linear-gradient(135deg, #7850ff 0%, #5030e5 100%);
            color: white;
            position: relative;
            overflow: hidden;
        }

        .btn-modify::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #8960ff 0%, #6040f5 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
        }

        .btn-modify:hover::before {
            opacity: 1;
        }

        .btn-modify i {
            position: relative;
            z-index: 1;
        }

        .btn-delete {
            background: rgba(255, 80, 120, 0.1);
            border: 1px solid rgba(255, 80, 120, 0.3);
            color: #ff5078;
        }

        .btn-delete:hover {
            background: rgba(255, 80, 120, 0.2);
            border-color: rgba(255, 80, 120, 0.5);
        }

        .btn-list {
            background: rgba(255, 255, 255, 0.05);
            color: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn-list:hover {
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(255, 255, 255, 0.2);
            color: #ffffff;
        }

        .btn:active {
            transform: scale(0.98);
        }

        /* 읽기 모드 스타일 */
        .read-only-title {
            background: transparent;
            border: none;
            color: #ffffff;
            font-size: 36px;
            font-weight: 700;
            padding: 0;
            margin-bottom: 16px;
            cursor: default;
        }

        .read-only-content {
            background: rgba(255, 255, 255, 0.02);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 12px;
            padding: 24px;
            color: rgba(255, 255, 255, 0.9);
            font-size: 16px;
            line-height: 1.8;
            min-height: 400px;
            white-space: pre-wrap;
            word-wrap: break-word;
        }

        /* 수정 모드 스타일 */
        input[type="text"].edit-mode {
            width: 100%;
            padding: 14px 20px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            color: #ffffff;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="text"].edit-mode:focus {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(120, 80, 255, 0.3);
        }

        textarea.edit-mode {
            width: 100%;
            padding: 14px 20px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            color: #ffffff;
            font-size: 16px;
            margin-bottom: 30px;
            resize: vertical;
            min-height: 400px;
            transition: all 0.3s ease;
            outline: none;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica', sans-serif;
            line-height: 1.8;
        }

        textarea.edit-mode:focus {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(120, 80, 255, 0.3);
        }

        .post-id {
            color: rgba(255, 255, 255, 0.3);
            font-size: 14px;
            font-weight: 500;
        }
    </style>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">fastcampus</li>
        <li><a href="<c:url value='/index'/>">Home</a></li>
        <li><a href="<c:url value='/board'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>

<div class="container">
    <form id="form" action="" method="post">
        <input type="hidden" name="id" value="${board.id}">
        <div class="post-header">
            <h1 class="post-title">${board.title}</h1>
            <div class="post-meta">
                <div class="post-meta-item">
                    <i class="fa fa-hashtag"></i>
                    <span class="post-id">${board.id}</span>
                </div>
                <div class="post-meta-item">
                    <i class="fa fa-user"></i>
                    <span>${sessionScope.id != null ? sessionScope.id : 'Anonymous'}</span>
                </div>
                <div class="post-meta-item">
                    <i class="fa fa-calendar"></i>
                    <span><%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date()) %></span>
                </div>
                <div class="post-meta-item">
                    <i class="fa fa-eye"></i>
                    <span>0</span>
                </div>
            </div>
        </div>
        <div class="post-content">
            <div class="read-only-content">${board.content}</div>
        </div>
        <div class="post-actions">
            <div class="btn-group">
                <button type="button" id="modifyBtn" class="btn btn-modify">
                    <i class="fa fa-edit"></i> 수정
                </button>
                <button type="button" id="deleteBtn" class="btn btn-delete">
                    <i class="fa fa-trash"></i> 삭제
                </button>
            </div>
            <button type="button" id="listBtn" class="btn btn-list">
                <i class="fa fa-list"></i> 목록
            </button>
        </div>
    </form>
</div>

<script>
    $(document).ready(function(){
        let formCheck = function() {
            let form = document.getElementById("form");
            if(form.title.value=="") {
                alert("제목을 입력해 주세요.");
                form.title.focus();
                return false;
            }

            if(form.content.value=="") {
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return false;
            }
            return true;
        }

        $("#listBtn").on("click", function(){
            location.href="<c:url value='/board'/>";
        });

        $("#modifyBtn").on("click", function(){
            alert("수정 기능은 준비 중입니다.");
            // location.href="<c:url value='/board/modify/${board.id}'/>";
        });

        $("#deleteBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            
            let form = $("#form");
            form.attr("action", "<c:url value='/board/delete'/>");
            form.attr("method", "post");
            form.submit();
        });
    });
</script>
</body>
</html>