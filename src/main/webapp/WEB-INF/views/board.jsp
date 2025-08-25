<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id != null ? sessionScope.id : ''}"/>
<c:set var="loginOutLink" value="${empty loginId ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${empty loginId ? 'Login' : 'Logout'}"/>
<c:set var="userInfoLink" value="${empty loginId ? '/signup' : '/userInfo'}"/>
<c:set var="userInfoText" value="${empty loginId ? 'Sign up' : 'My Info'}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus</title>
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
            max-width: 800px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            position: relative;
            z-index: 1;
        }

        .writing-header {
            color: #ffffff;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 32px;
            padding-bottom: 24px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            letter-spacing: -0.5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 14px 20px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            color: #ffffff;
            font-size: 16px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="text"]:focus {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(120, 80, 255, 0.3);
        }

        input[type="text"]::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }

        textarea {
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
        }

        textarea:focus {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(120, 80, 255, 0.3);
        }

        textarea::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }

        .frm {
            width: 100%;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-right: 12px;
            margin-bottom: 12px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-write, .btn-modify {
            background: linear-gradient(135deg, #7850ff 0%, #5030e5 100%);
            color: white;
            position: relative;
            overflow: hidden;
        }

        .btn-write::before, .btn-modify::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #8960ff 0%, #6040f5 100%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .btn-write:hover::before, .btn-modify:hover::before {
            opacity: 1;
        }

        .btn-write i, .btn-modify i {
            position: relative;
            z-index: 1;
        }

        .btn-remove {
            background: rgba(255, 80, 120, 0.1);
            border: 1px solid rgba(255, 80, 120, 0.3);
            color: #ff5078;
        }

        .btn-remove:hover {
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

        /* 게시판 테이블 스타일 */
        .board-list {
            margin-top: 20px;
        }

        .board-table {
            width: 100%;
            border-collapse: collapse;
        }

        .board-table thead {
            background: rgba(120, 80, 255, 0.1);
            border: 1px solid rgba(120, 80, 255, 0.2);
        }

        .board-table th {
            padding: 16px;
            text-align: center;
            color: rgba(255, 255, 255, 0.9);
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid rgba(120, 80, 255, 0.3);
        }

        .board-table tbody tr {
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .board-table tbody tr:hover {
            background: rgba(120, 80, 255, 0.05);
        }

        .board-table td {
            padding: 18px 16px;
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            font-size: 14px;
        }

        .board-table .title-cell {
            text-align: left;
            color: rgba(255, 255, 255, 0.9);
            font-weight: 500;
        }

        .board-table tbody tr:hover .title-cell {
            color: #7850ff;
        }

        .board-actions {
            margin-top: 30px;
            display: flex;
            justify-content: flex-end;
        }

        .empty-message {
            text-align: center;
            padding: 60px 20px;
            color: rgba(255, 255, 255, 0.4);
        }

        .empty-message i {
            font-size: 48px;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .empty-message p {
            font-size: 16px;
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
        <li><a href="<c:url value='${userInfoLink}'/>">\${userInfoText}</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
    <c:choose>
        <c:when test="${mode eq 'new'}">
            <!-- 글쓰기 모드 -->
            <h2 class="writing-header">게시판 글쓰기</h2>
            <form id="form" class="frm" action="" method="post">
                <input type="hidden" name="bno" value="${boardDto.bno}">
                <input name="title" type="text" value="${boardDto.title}" placeholder="제목을 입력해 주세요." autofocus>
                <br>
                <textarea name="content" rows="20" placeholder="내용을 입력해 주세요.">${boardDto.content}</textarea>
                <br>
                <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
                <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
            </form>
        </c:when>
        <c:otherwise>
            <!-- 읽기 모드 (게시글 목록) -->
            <h2 class="writing-header">게시판 목록</h2>
            <div class="board-list">
                <table class="board-table">
                    <thead>
                        <tr>
                            <th width="10%">번호</th>
                            <th width="50%">제목</th>
                            <th width="15%">작성자</th>
                            <th width="15%">작성일</th>
                            <th width="10%">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty boardList}">
                                <c:forEach items="${boardList}" var="board" varStatus="status">
                                    <tr onclick="location.href='<c:url value="/board/${board.id}"/>'">
                                        <td>${boardList.size() - status.index}</td>
                                        <td class="title-cell">${board.title}</td>
                                        <td>${sessionScope.id != null ? sessionScope.id : 'user'}</td>
                                        <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></td>
                                        <td>0</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" style="text-align: center; padding: 40px; color: rgba(255, 255, 255, 0.5);">
                                        <i class="fa fa-inbox" style="font-size: 32px; margin-bottom: 10px; display: block; opacity: 0.5;"></i>
                                        등록된 게시글이 없습니다.
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            <div class="board-actions">
                <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
            </div>
        </c:otherwise>
    </c:choose>
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

        $("#writeNewBtn").on("click", function(){
            location.href="<c:url value='/board/write'/>";
        });

        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/board/write'/>");
            form.attr("method", "post");

            if(formCheck())
                form.submit();
        });

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let readonly = $("input[name=title]", "#form").attr('readonly');

            // 1. 읽기 상태이면, 수정 상태로 변경
            if(readonly!=undefined) {
                $(".writing-header").html("게시판 수정");
                $("input[name=title]", "#form").attr('readonly', false);
                $("textarea", "#form").attr('readonly', false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                return;
            }

            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/board/modify'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });

        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;

            let form = $("#form");
            form.attr("action", "<c:url value='/board/remove?page=${page}&pageSize=${pageSize}'/>");
            form.attr("method", "post");
            form.submit();
        });

        $("#listBtn").on("click", function(){
            location.href="<c:url value='/board/list?page=${page}&pageSize=${pageSize}'/>";
        });
    });
</script>
</body>
</html>