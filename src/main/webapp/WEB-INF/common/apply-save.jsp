<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>        
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
	    			<comp:saveButton id="${recruitment.id}"/>
	     		</div>
	     		<comp:applyButton id="${recruitment.id}"/>
			</div>
		</sec:authorize>
    </div>
</div>
<!-- end -->

<!-- Modal -->
<comp:applyModal id="${recruitment.id}" title="${recruitment.title}"/>
