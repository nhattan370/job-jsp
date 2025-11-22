<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>        
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>        
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>

<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %> 
<%@ attribute name="re" type="java.lang.Object" required="true" %>
<%@ attribute name="DETAIL_RECRUITMENT" required="true" %>
<%@ attribute name="DETAIL_COMPANY" required="true" %>

<comp:wrapperCard id="${re.id}">
<!-- <div class="col-md-12 ">
    <div class="job-post-item p-4 d-block d-lg-flex align-items-center"> -->
        <comp:informationRecruitment 
        			isDto="<%= Boolean.TRUE %>" 
        			re="${re}" 
        			DETAIL_COMPANY="${DETAIL_COMPANY}" 
        			DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"
        />
        
        <input type="hidden" id="idRe${re.id}" value="${re.id}">
        <sec:authorize access="hasAuthority('USER') || !isAuthenticated()">
			<div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
	    		<div>
	    			<comp:saveButton id="${re.id}"/>
	     		</div>
	     		<comp:applyButton id="${re.id}"/>
			</div>
		</sec:authorize>
<!--     </div>
</div> -->
</comp:wrapperCard>

<!-- Modal -->
<comp:applyModal id="${recruitment.id}" title="${recruitment.title}"/>
