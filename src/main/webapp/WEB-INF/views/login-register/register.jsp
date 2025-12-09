<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/common/head.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/eye-icon.css">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng kí</title>
  </head>
  <body>
  	<c:if test="${not empty mes}">
	    <script type="text/javascript">
	        swal({
	            title: "${mes}",
	            text: "Redirecting...", 
	            icon: "${status}",
	            timer: 2000,
	            buttons: true
	        });
	    </script>
	</c:if>
	
    <div class="container mt-5" style="max-width: 500px;">
    <form:form action="${REGISTER}" modelAttribute="userDTO" method="post" class="border p-4 rounded bg-light shadow-sm">

        <h2 class="text-center mb-4">Đăng ký</h2>

        <!-- Email -->
        <div class="form-group">
            <label for="email">Email</label>
            <form:input id="email" path="email" class="form-control" placeholder="Email"/>
            <small class="text-danger"><form:errors path="email"/></small>
        </div>

        <!-- Full name -->
        <div class="form-group">	
            <label for="full-name">Họ và tên</label>
            <form:input id="full-name" type="text" path="fullName" class="form-control" placeholder="Họ và tên"/>
            <small class="text-danger"><form:errors path="fullName"/></small>
        </div>

        <!-- Password -->
        <div class="form-group">
            <label for="password">Mật khẩu</label>
	            <div class="password-wrapper">
		            <form:input id="password" type="password" path="password" class="form-control" placeholder="Mật khẩu"/>
					<span id="togglePassword" class="ion-ios-eye-off toggle-password"></span>
	            </div>
            <small class="text-danger"><form:errors path="password"/></small>
            
        </div>

        <!-- Confirm Password -->
        <div class="form-group">
            <label for="confirm-password">Nhập lại mật khẩu</label>
            <form:input id="confirm-password" type="password" path="confirmPassword" class="form-control" placeholder="Nhập lại mật khẩu"/>
            <small class="text-danger"><form:errors path="confirmPassword"/></small>
        </div>

        <!-- Role -->
        <div class="form-group">
            <label for="role-select">Vai trò</label>
            <form:select id="role-select" path="role" class="form-control">
                <form:option value="" disabled="true" selected="true">Chọn vai trò</form:option>
                <c:forEach var="role" items="${roles}">
                    <form:option value="${role.id}">${role.roleName.label}</form:option>
                </c:forEach>
            </form:select>
            <small class="text-danger"><form:errors path="role"/></small>
        </div>

        <!-- Submit -->
        <button id="button-register" type="submit" class="btn btn-primary btn-block mt-3">
            Đăng ký
        </button>

        <div class="text-center mt-3">
            Quay trở lại <a href="${LOGIN}">Đăng nhập</a>
        </div>

    </form:form>
</div>
    
  </body>
  <script src="${pageContext.request.contextPath}/assets/js/more/icon-password.js"></script>
</html>