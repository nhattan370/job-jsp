<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/email-enter.css">
    <%@ include file="/WEB-INF/common/head.jsp" %>
</head>
<body>

<div class="container">
    <div class="forgot-container">
        <div class="card shadow-sm">
            <div class="card-body">
                <h4 class="text-center mb-3">🔐 Quên mật khẩu</h4>
                <p class="text-muted text-center small">
                    Nhập email bạn đã đăng ký, chúng tôi sẽ gửi link đặt lại mật khẩu.
                </p>

                <c:if test="${not empty mes}">
                    <div class="alert alert-danger">
                        ${mes}
                    </div>
                </c:if>

                <form action="${SEND_NEW_PASSWORD}" method="post">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email"
                               class="form-control"
                               id="email"
                               name="email"
                               placeholder="example@gmail.com"
                               required>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">
                        Gửi yêu cầu
                    </button>
                </form>

                <div class="text-center mt-3">
                    <a href="${LOGIN}" class="small">
                        ← Quay lại đăng nhập
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>
