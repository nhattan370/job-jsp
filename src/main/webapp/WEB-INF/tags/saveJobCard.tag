<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>

<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %> 
<%@ attribute name="sa" type="java.lang.Object" required="true" %>
<%@ attribute name="DETAIL_RECRUITMENT" required="true" %>
<%@ attribute name="DETAIL_COMPANY" required="true" %>

<comp:wrapperCard id="${sa.id}">
         <comp:informationRecruitment 
 					isDto="<%= Boolean.FALSE %>"
 					re="${sa.recruitment}"
 					DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"
 					DETAIL_COMPANY="${DETAIL_COMPANY}"
	    />
         
         <input type="hidden" id="idSa${sa.id}" value="${sa.id}">
         <input type="hidden" id="idRe${sa.recruitment.id}" value="${sa.recruitment.id}">
         <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
             <div><comp:deleteButton id="${sa.id}"/></div>
             <comp:applyButton id="${sa.recruitment.id}" attr="py-2"/>
         </div>
</comp:wrapperCard>
<!-- Modal xác nhận xóa -->
<comp:modalDelete     
	id="${sa.id}"
    idHidden="idSa"
    title="${sa.recruitment.title}"
    onConfirm="deleteSaveJob(${sa.id})"/>

<comp:applyModal id="${sa.recruitment.id}" title="${sa.recruitment.title}"/>
