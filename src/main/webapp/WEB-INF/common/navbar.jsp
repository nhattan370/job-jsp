<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-dark sticky-top">
  <div class="container-fluid px-md-4 d-flex justify-content-between">
    <div><a class="navbar-brand" href="${HOME}">Work CV</a></div>
    <div class="navbar-nav d-flex align-items-center" id="navbarNav">
      <ul class="navbar-nav ms-auto d-flex align-items-center">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${HOME}">Trang chủ</a>
        </li>

		<sec:authorize access="!isAuthenticated() || hasAuthority('APPLICANT')">
	        <li class="nav-item">
	          <a class="nav-link" href="${JOB}">Công việc</a>
	        </li>
		</sec:authorize>

		<sec:authorize access="hasAuthority('RECRUITER')">
	        <li class="nav-item">
	          <a class="nav-link" href="${LIST_APPLICANT}">Ứng cử viên</a>
	        </li>
		</sec:authorize>
        
        <sec:authorize access="hasAuthority('RECRUITER')">
	        <li class="nav-item">
	          <a class="nav-link btn btn-outline-primary me-2" href="${POST}">Đăng tuyển</a>
	        </li>
        </sec:authorize>

		<sec:authorize access="isAuthenticated()">
			<div class="dropdown nav-item">
				  <button class="nav-link btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    		<sec:authentication property="principal" var="principal"/>
			    		<img src="${principal.user.image}"
			    			 onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/user.png'"
			                         class="rounded-circle mr-2" id="avatar-nav" style="width:30px; height:30px; object-fit:cover;">
			            <span><sec:authentication property="principal.user.fullName"/></span>
				  </button>
			  
				  <div class="dropdown-menu dropdown-menu-end shadow-lg border-0" aria-labelledby="dropdownMenuButton" style="min-width: 200px;">
				  		<sec:authorize access="isAuthenticated()">
						    <a class="dropdown-item" href="${pageContext.request.contextPath}/auth/profile-user">Hồ Sơ Cá Nhân</a>
					    </sec:authorize>
					    <sec:authorize access="hasAuthority('RECRUITER')">
						    <a class="dropdown-item" href="${pageContext.request.contextPath}/recruiter/profile-company">Hồ Sơ Công Ty</a>
					    </sec:authorize>
			    		<sec:authorize access="hasAuthority('RECRUITER')">
			                <a class="dropdown-item" href="${LIST_POST}">Danh sách bài đăng</a>
			                <a class="dropdown-item" href="${POST}">Đăng tuyển</a>
			            </sec:authorize>
			            
					    <sec:authorize access="hasAuthority('APPLICANT')">
			                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/list-save-job">Công việc đã lưu</a>
			                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/get-list-apply">Công việc đã ứng tuyển</a>
			                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/list-follow-company">Công ty đã theo dõi</a>
			            </sec:authorize>
					
			            <hr class="dropdown-divider">
			            <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
				  </div>
			</div>
		</sec:authorize>
		<sec:authorize access="!isAuthenticated()">
	        <li class="nav-item">
	          <a class="nav-link btn btn-primary text-white" href="${LOGIN}">Đăng nhập</a>
	        </li>
		</sec:authorize>

      </ul>
    </div>
  </div>
</nav>
