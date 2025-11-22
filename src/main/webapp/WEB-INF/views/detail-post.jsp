<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>   
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>
<!-- start nav -->
	<%@ include file="/WEB-INF/common/navbar.jsp" %>
<!-- end nav -->
  <comp:pageHero title="Chi tiết công việc" breadcrumb="Chi tiết"/>

<section style="margin-top: 10px" class="site-section">
    <div class="container">
        <div class="row align-items-center mb-5">
            <div class="col-lg-8 mb-4 mb-lg-0">
                <div class="d-flex align-items-center">
                    <div class="border p-2 d-inline-block mr-3 rounded">
                        <img width="100" height="100" src="${recruitment.company.logo}" alt="Image">
                    </div>
                    <div>
                        <h2></h2>
                        <div>
                            <span class="icon-briefcase mr-2"></span><a class="ml-0 mr-2 mb-2"></a>
                            <span  class="icon-room mr-2"></span ><span class="m-2"></span>
                            <span class="icon-clock-o mr-2"></span><span class="m-2"></span>
                        </div>
                        <input type="hidden">
                    </div>
                </div>
            </div>
            <sec:authorize access="hasAuthority('USER') || !isAuthenticated()">
	            <div class="col-lg-4">
	                <div class="row">
	                    <div class="col-6">
	                        <a onclick="save(${recruitment.id})" class="btn btn-block btn-light btn-md">
	                        	<span class="icon-heart-o mr-2 text-danger" id="heartIcon${recruitment.id}"></span>
                        		<span id="followText${recruitment.id}">Lưu</span>
                        	</a>
	                    </div>
	                    <div class="col-6">
	                        <a data-toggle="modal" data-target="#exampleModal${recruitment.id}" class="btn btn-block btn-primary btn-md" id="applyBtn${recruitment.id}">Ứng tuyển</a>
	                    </div>
	                </div>
	            </div>
            </sec:authorize>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <div class="mb-5">
                    <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Mô tả công việc</h3>
                    <p>${recruitment.description}</p>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="bg-light p-3 border rounded mb-4">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Tóm tắt công việc</h3>
                    <ul class="list-unstyled pl-3 mb-0">
                       <li class="mb-2"> <strong class="text-black">Ngày tạo: </strong> <span>${recruitment.createdAt}</span> </li>
                        <li class="mb-2"><strong class="text-black">Kiểu công việc: </strong> <span>${recruitment.type}</span></li>
                        <li class="mb-2"><strong class="text-black">Loại công việc: </strong> <span>${recruitment.category.name}</span></li>
                        <li class="mb-2"><strong class="text-black">Kinh nghiệm: </strong> <span>${recruitment.experience}</span></li>
                        <li class="mb-2"><strong class="text-black">Địa chỉ: </strong> <span>${recruitment.address}</span></li>
                        <li class="mb-2"><strong class="text-black">Lương: </strong> <span>${recruitment.salary}</span></li>
                        <li class="mb-2"><strong class="text-black">Số lượng: </strong><span>${recruitment.quantity}</span></li>
                        <li class="mb-2"><strong class="text-black">Hạn nộp cv: </strong><span>${recruitment.deadline}</span></li>
                    </ul>
                </div>

                <div class="bg-light p-3 border rounded">
                    <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3>
                    <div class="px-3">
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-facebook"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-linkedin"></span></a>
                        <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
	<comp:applyModal id="${recruitment.id}" title="${recruitment.title}"/>

<section class="site-section" id="next">
    <div class="container">

        <div class="row mb-5 justify-content-center">
            <div class="col-md-7 text-center">
            	<sec:authorize access="hasAuthority('USER') || !isAuthenticated()"><h2 class="section-title mb-2">Những công việc liên quan</h2></sec:authorize>
            	<sec:authorize access="hasAuthority('RECRUITER')"><h2 class="section-title mb-2">Danh sách ứng viên ứng tuyển</h2></sec:authorize>
            </div>
        </div>
        
        <sec:authorize access="hasAuthority('RECRUITER')">
        	<c:if test="${applyPosts!=null}">
	        	<div class="row">
		            <div class="col-lg-12 pr-lg-4">
		                <div class="row">
		                    <c:if test="${applyPosts.size() > 0}"> 
			                    <c:forEach var="applyPost" items="${applyPosts}">
			                    	<c:set var="applyPost" value="${applyPost}" scope="request"/>
				    				<jsp:include page="/WEB-INF/common/candidate-application-card.jsp">
				    					<jsp:param name="HANDLE_CV" value="${HANDLE_CV}"/>
	    							</jsp:include>
			                    </c:forEach>
		                    </c:if>
		                    <c:if test="${applyPosts.size()<1}">
		                        <p>Chưa có ứng cử viên nào ứng tuyển</p>
		                    </c:if>
		                </div>
		            </div>
		          </div>
	          </c:if>
          </sec:authorize>
      </div>
        
        <sec:authorize access="hasAuthority('USER') || !isAuthenticated()">
        	<c:if test="${recruitments!=null}">
        		<c:if test="${recruitments.size()>0}">
		        	<c:forEach var="recruitment" items= "${recruitments}">
		        	 	<c:set var="recruitment" value="${recruitment}" scope="request"/> 
				    	<jsp:include page="/WEB-INF/common/apply-save.jsp">
				    		<jsp:param name="DETAIL_RECRUITMENT" value="${DETAIL_RECRUITMENT}" />
	        				<jsp:param name="DETAIL_COMPANY" value="${DETAIL_COMPANY}" />
	    				</jsp:include>
		        	</c:forEach>
	        	</c:if>
	        	<c:if test="${recruitments.size()<1}">
	        		<p>Chưa có bài viết nào</p>
	        	</c:if>
	        </c:if>
        </sec:authorize>
</section> 

<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>