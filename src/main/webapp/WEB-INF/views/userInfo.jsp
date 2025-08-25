<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Info</title>
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
            justify-content: center;
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

        .info-container {
            background: rgba(18, 18, 18, 0.9);
            backdrop-filter: blur(20px);
            padding: 48px;
            border-radius: 16px;
            width: 100%;
            max-width: 520px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            position: relative;
            z-index: 1;
        }

        .info-header {
            margin-bottom: 40px;
            padding-bottom: 24px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .info-header h1 {
            color: #ffffff;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .info-header p {
            color: rgba(255, 255, 255, 0.5);
            font-size: 14px;
            font-weight: 400;
        }

        .info-section {
            margin-bottom: 32px;
        }

        .info-item {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 16px;
            transition: all 0.3s ease;
        }

        .info-item:hover {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(120, 80, 255, 0.3);
        }

        .info-label {
            color: rgba(255, 255, 255, 0.5);
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .info-value {
            color: #ffffff;
            font-size: 18px;
            font-weight: 500;
            word-break: break-all;
        }

        .info-value.mono {
            font-family: 'SF Mono', 'Monaco', 'Inconsolata', 'Fira Code', monospace;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            background: rgba(80, 255, 160, 0.1);
            border: 1px solid rgba(80, 255, 160, 0.3);
            border-radius: 20px;
            color: #50ffa0;
            font-size: 12px;
            font-weight: 600;
            margin-top: 24px;
        }

        .action-buttons {
            display: flex;
            gap: 16px;
            margin-top: 40px;
            padding-top: 32px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn {
            flex: 1;
            padding: 14px 24px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            letter-spacing: 0.5px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #7850ff 0%, #5030e5 100%);
            color: white;
            position: relative;
            overflow: hidden;
        }

        .btn-primary::before {
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

        .btn-primary:hover::before {
            opacity: 1;
        }

        .btn-primary span {
            position: relative;
            z-index: 1;
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.05);
            color: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(255, 255, 255, 0.2);
            color: #ffffff;
        }

        .btn:active {
            transform: scale(0.98);
        }

        .meta-info {
            margin-top: 32px;
            padding: 20px;
            background: rgba(120, 80, 255, 0.05);
            border: 1px solid rgba(120, 80, 255, 0.2);
            border-radius: 12px;
        }

        .meta-info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 0;
            color: rgba(255, 255, 255, 0.6);
            font-size: 13px;
        }

        .meta-info-item:not(:last-child) {
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .meta-info-item strong {
            color: rgba(255, 255, 255, 0.8);
        }
    </style>
</head>
<body>
<div class="info-container">
    <div class="info-header">
        <h1>사용자 정보</h1>
        <p>로그인된 계정 정보입니다</p>
    </div>

    <div class="info-section">
        <div class="info-item">
            <div class="info-label">사용자 아이디</div>
            <div class="info-value">${id}</div>
        </div>

        <div class="info-item">
            <div class="info-label">비밀번호</div>
            <div class="info-value mono">${pwd}</div>
        </div>

        <div class="status-badge">
            ● 활성 상태
        </div>
    </div>

    <div class="meta-info">
        <div class="meta-info-item">
            <span>로그인 시간</span>
            <strong><%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %></strong>
        </div>
        <div class="meta-info-item">
            <span>세션 ID</span>
            <strong><%= session.getId().substring(0, 8) %>...</strong>
        </div>
        <div class="meta-info-item">
            <span>접속 IP</span>
            <strong><%= request.getRemoteAddr() %></strong>
        </div>
    </div>

    <div class="action-buttons">
        <button class="btn btn-primary" onclick="location.href='/index'">
            <span>대시보드로 이동</span>
        </button>
        <button class="btn btn-secondary" onclick="location.href='/logout'">
            로그아웃
        </button>
    </div>
</div>
</body>
</html>