<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="enums.UserStatus" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>User Status Notification</title>
   <%@ include file="/WEB-INF/common/head.jsp" %>
</head>
<body class="bg-light">
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
      <sec:authentication property="principal" var="principal"/>
        <c:choose>
          <c:when test="${principal == null}">
            <div class="mb-3">
              Tài khoản của bạn chưa đăng nhập.
            </div>
          </c:when>

          <c:when test="${principal.user == null}">
            <div class="mb-3">
              Không thể đọc thông tin tài khoản.
            </div>
          </c:when>
          
          <c:otherwise>
          
          <c:set var="status" value="${principal.user.status}" />
          	<c:choose>
          		 <c:when test="${status == UserStatus.LOCKED}">
            <div class="mb-3">
              Tài khoản của bạn đã bị khóa
            </div>
          </c:when>

          <c:when test="${status == UserStatus.DISABLED}">
            <div class="mb-3">
              Thông tin đăng nhập không còn hiệu lực.
            </div>
          </c:when>

          <c:when test="${status == UserStatus.EXPIRED}">
            <div class="mb-3">
              Tài khoản đã hết hạn.
            </div>
          </c:when>
          	</c:choose>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</body>
</html>
