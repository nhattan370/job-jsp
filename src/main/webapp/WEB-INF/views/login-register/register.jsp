<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/common/url.jspf" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng kí</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/register.css" />
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
  
    <div class="container">
      <form:form action="${REGISTER}" modelAttribute="userDTO" method="post">
        <h1>Đăng kí</h1>
        <div class="form-control">
          <form:input id="email" path="email" placeholder="email"/>
          <small class="text-danger"><form:errors path="email"/></small>
        </div>

        <div class="form-control">
          <form:input id="full-name" type="text" path="fullName" placeholder="Họ và tên"/>
		  <small class="text-danger"><form:errors path="fullName"/></small>
        </div>

        <div class="form-control">
          <form:input id="password" type="password" path="password" placeholder="Mật khẩu"/>
          <small class="text-danger"><form:errors path="password"/></small>
        </div>

        <div class="form-control">
          <form:input id="confirm-password" type="password" placeholder="Nhập lại mật khẩu" path="confirmPassword"/>
		  <small class="text-danger"><form:errors path="confirmPassword"/></small>
        </div>
        <div class="form-control">
          <form:select id="role-select" path="role">
            <form:option class="option-empty" value="Vai trò" disabled="true" selected="true"></form:option>
            <c:forEach var="role" items="${roles}">
               <form:option value="${role.id}">${role.roleName.label}</form:option>
            </c:forEach>  
          </form:select>
		  <small class="text-danger"><form:errors path="role"/></small>
        </div>
        <button id="button-register" type="submit">Đăng kí</button>
        <div class="signup-link">Quay trở lại <a href="${LOGIN}">Đăng nhập</a></div>
      </form:form>
    </div>
  </body>
</html>