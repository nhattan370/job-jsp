<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>        
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>        
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>

<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %> 
<%@ attribute name="re" type="java.lang.Object" required="true" %>
<%@ attribute name="DETAIL_RECRUITMENT" required="true" %>
<%@ attribute name="DETAIL_COMPANY" required="true" %>

<comp:wrapperCard id="${re.id}">
        <comp:informationRecruitment 
        			isDto="<%= Boolean.TRUE %>" 
        			re="${re}" 
        			DETAIL_COMPANY="${DETAIL_COMPANY}" 
        			DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"
        />
        <input type="hidden" id="idRe${re.id}" value="${re.id}">
        <sec:authorize access="hasAuthority('APPLICANT') || !isAuthenticated()">
			<div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
	    		<div>
	    			<comp:saveButton id="${re.id}"/>
	     		</div>
	     		<comp:applyButton id="${re.id}" attr="py-2"/>
			</div>
		</sec:authorize>
</comp:wrapperCard>
<jsp:include page="/WEB-INF/common/loading-overlay.jsp"></jsp:include>

<!-- Modal -->
<comp:applyModal id="${re.id}" title="${re.title}"/>
