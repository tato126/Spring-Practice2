<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)!=null ? pageContext.request.session.getAttribute('id') : null}"/>
<c:set var="loginId" value="${loginId != null ? loginId : ''}"/>
<c:set var="loginOutLink" value="${empty loginId ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${empty loginId ? 'Login' : 'Logout'}"/>
<c:set var="userInfoLink" value="${empty loginId ? '/signup' : '/userInfo'}"/>
<c:set var="userInfoText" value="${empty loginId ? 'Sign up' : 'My Info'}"/>
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
            margin-bottom: 60px;
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

        .content-container {
            background: rgba(18, 18, 18, 0.9);
            backdrop-filter: blur(20px);
            padding: 80px 48px;
            border-radius: 16px;
            width: 100%;
            max-width: 800px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            position: relative;
            z-index: 1;
            text-align: center;
            margin-top: 40px;
        }

        h1 {
            color: #ffffff;
            font-size: 56px;
            font-weight: 700;
            margin-bottom: 32px;
            letter-spacing: -1.5px;
            background: linear-gradient(135deg, #7850ff 0%, #50c8ff 50%, #ff5078 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: gradient 3s ease infinite;
            background-size: 200% 200%;
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h1:nth-child(2) {
            font-size: 48px;
            animation-delay: 0.5s;
        }

        h1:nth-child(3) {
            font-size: 40px;
            animation-delay: 1s;
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
<div class="content-container">
    <h1>This is HOME</h1>
    <h1>This is HOME</h1>
    <h1>This is HOME</h1>
</div>
</body>
</html>