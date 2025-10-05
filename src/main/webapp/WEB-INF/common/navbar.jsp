<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg navbar-light bg-dark sticky-top">
  <div class="container-fluid px-md-4 d-flex justify-content-between">
  
    <div><a class="navbar-brand" href="${pageContext.request.contextPath}">Work CV</a></div>

    <div class="navbar-nav d-flex align-items-center" id="navbarNav">
      <ul class="navbar-nav ms-auto d-flex align-items-center">

        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}">Trang chủ</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/user/job">Công việc</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/recruiter/applicant">Ứng cử viên</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link btn btn-outline-primary me-2" href="/recruitment/post">Đăng tuyển</a>
        </li>
        
        <sec:authorize access="isAuthenticated()">
	        
		<li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			        <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="Avatar" class="rounded-circle me-2" style="width:30px; height:30px; object-fit:cover;">
			        <span><sec:authentication property="principal.fullName" /></span>
			    </a>
			    <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0" aria-labelledby="navbarDropdown" style="min-width: 200px;">
			        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">Hồ Sơ</a></li>
			        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/save-job">Công việc đã lưu</a></li>
			        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/recruiter/list-post">Danh sách bài đăng</a></li>
			        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/get-list-apply">Công việc đã ứng tuyển</a></li>
			        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/get-list-company">Công ty đã theo dõi</a></li>
			        <li><hr class="dropdown-divider"></li>
			        <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">Đăng xuất</a></li>
			    </ul>
			</li>

	        
        </sec:authorize>
		
		<sec:authorize access="!isAuthenticated()">
	        <li class="nav-item">
	          <a class="nav-link btn btn-primary text-white" href="login">Đăng nhập</a>
	        </li>
		</sec:authorize>

      </ul>
    </div>
  </div>
</nav>