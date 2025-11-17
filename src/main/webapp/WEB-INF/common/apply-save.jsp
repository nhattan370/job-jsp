<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>            
<div class="col-md-12 ">
    <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
        <div class="one-third mb-4 mb-md-0">
            <div class="job-post-item-header align-items-center">
                <span class="subadge">${recruitment.type}</span>
                <h2 class="mr-3 text-black"><a href="${param.DETAIL_RECRUITMENT}${recruitment.id}">${recruitment.title}</a></h2>
            </div>
            <div class="job-post-item-body d-block d-md-flex">
                <div class="mr-3"><span class="icon-layers"></span> <a href="${param.DETAIL_COMPANY}${recruitment.idCompany}">${recruitment.nameCompany}</a></div>
                <div><span class="icon-my_location"></span> <span>${recruitment.address}</span></div>
            </div>
        </div>
        <input type="hidden" id="idRe${recruitment.id}" value="${recruitment.id}">
          <sec:authorize access="hasAuthority('USER') || !isAuthenticated()">
<div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
    <div>
    	<a onclick="save(${recruitment.id})"
class="text-center d-flex justify-content-center align-items-center icon 
       mr-2">
 <span id="heartIcon${recruitment.id}"
          class="icon-heart">
    </span>
</a>
     </div>
     <a data-toggle="modal" data-target="#exampleModal${recruitment.id}" class="btn btn-primary py-2" id="applyBtn${recruitment.id}">Apply Job</a>
</div>
</sec:authorize>
    </div>
</div>
<!-- end -->

<!-- Modal -->
<jsp:include page="/WEB-INF/common/apply-modal.jsp">
	<jsp:param value="${recruitment.id}" name="id"/>
	<jsp:param value="${recruitment.title}" name="title"/>
</jsp:include>
