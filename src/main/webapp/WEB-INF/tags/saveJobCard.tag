<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>

<%-- <%@ attribute name="idSa" required="true" %>
<%@ attribute name="idRe" required="true" %>
<%@ attribute name="idCo" required="true" %>
<%@ attribute name="type" required="true" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="nameCompany" required="true" %>
<%@ attribute name="address" required="true" %>
<%@ attribute name="DETAIL_RECRUITMENT" required="true" %>
<%@ attribute name="DETAIL_COMPANY" required="true" %> --%>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %> 
<%@ attribute name="sa" type="java.lang.Object" required="true" %>
<%@ attribute name="DETAIL_RECRUITMENT" required="true" %>
<%@ attribute name="DETAIL_COMPANY" required="true" %>

<div class="col-md-12 ">
    <div class="job-post-item p-4 d-block d-lg-flex align-items-center" id="job-item-${idSa}"> 
         <comp:informationRecruitment 
	    					isDto="<%= Boolean.FALSE %>"
	    					re="${sa.recruitment}"
	    					DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"
	    					DETAIL_COMPANY="${DETAIL_COMPANY}"
	    				/>
         
         <input type="hidden" id="idSa${idSa}" value="${idSa}">
         <input type="hidden" id="idRe${idRe}" value="${idRe}">
         <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
             <div><comp:deleteButton id="${idSa}"/></div>
             <comp:applyButton id="${idRe}"/>
         </div>
    </div>
</div>
<!-- Modal xác nhận xóa -->
<comp:modalDelete     
	id="${idSa}"
    idHidden="idSa"
    title="${title}"
    onConfirm="deleteSaveJob(${idSa})"/>

<comp:applyModal id="${idRe}" title="${title}"/>
