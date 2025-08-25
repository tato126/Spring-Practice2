<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)!=null ? pageContext.request.session.getAttribute('id') : null}"/>
<c:set var="loginId" value="${loginId != null ? loginId : ''}"/>
<c:set var="loginOutLink" value="${empty loginId ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${empty loginId ? 'Login' : 'Logout'}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>fastcampus</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
        }

        #menu ul {
            display: flex;
            list-style: none;
            padding: 0 20px;
            align-items: center;
            height: 60px;
            max-width: 1200px;
            margin: 0 auto;
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

        form {
            background: rgba(18, 18, 18, 0.9);
            backdrop-filter: blur(20px);
            padding: 48px;
            border-radius: 16px;
            width: 100%;
            max-width: 420px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #title {
            color: #ffffff;
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 32px;
            letter-spacing: -0.5px;
        }

        #msg {
            width: 100%;
            min-height: 30px;
            text-align: center;
            font-size: 14px;
            color: #ff5078;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        input[type='text'], input[type='password'] {
            width: 100%;
            padding: 14px 20px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            color: #ffffff;
            font-size: 16px;
            margin-bottom: 16px;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type='text']:focus, input[type='password']:focus {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(120, 80, 255, 0.3);
        }

        input[type='text']::placeholder, input[type='password']::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }

        button {
            width: 100%;
            padding: 14px 24px;
            background: linear-gradient(135deg, #7850ff 0%, #5030e5 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin: 20px 0 30px 0;
            position: relative;
            overflow: hidden;
        }

        button::before {
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

        button:hover::before {
            opacity: 1;
        }

        button:active {
            transform: scale(0.98);
        }

        button span {
            position: relative;
            z-index: 1;
        }

        form > div:last-child {
            color: rgba(255, 255, 255, 0.6);
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        form > div:last-child label {
            display: flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
        }

        form > div:last-child input[type="checkbox"] {
            width: auto;
            margin: 0;
            cursor: pointer;
        }

        form > div:last-child a {
            color: rgba(255, 255, 255, 0.6);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        form > div:last-child a:hover {
            color: #7850ff;
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
<form action="<c:url value="/login"/>" method="post" onsubmit="return formCheck(this);">
    <h3 id="title">Login</h3>
    <div id="msg">
        <c:if test="${not empty param.msg}">
            <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
        </c:if>
    </div>
    <input type="text" name="id" value="${cookie.id.value}" placeholder="아이디 입력" autofocus>
    <input type="password" name="pwd" placeholder="비밀번호">
    <input type="hidden" name="toURL" value="${param.toURL}">
    <button>로그인</button>
    <div>
        <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
        <a href="">비밀번호 찾기</a> |
        <a href="">회원가입</a>
    </div>
    <script>
        function formCheck(frm) {
            let msg ='';
            if(frm.id.value.length==0) {
                setMessage('id를 입력해주세요.', frm.id);
                return false;
            }
            if(frm.pwd.value.length==0) {
                setMessage('password를 입력해주세요.', frm.pwd);
                return false;
            }
            return true;
        }
        function setMessage(msg, element){
            document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
            if(element) {
                element.select();
            }
        }
    </script>
</form>
</body>
</html>