<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>

<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %> 
<%@ attribute name="ap" type="java.lang.Object" required="true" %>
<%@ attribute name="DETAIL_RECRUITMENT" required="true" %>
<%@ attribute name="DETAIL_COMPANY" required="true" %>

<comp:wrapperCard id="${ap.id}">
<%-- <div class="col-md-12 ">
    <div class="job-post-item p-4 d-block d-lg-flex align-items-center" id="job-item-${ap.id}"> --%>
         <comp:informationRecruitment isDto="<%= Boolean.FALSE %>" 
         							  re="${ap.recruitment}" 
         							  DETAIL_COMPANY="${DETAIL_COMPANY}" 
         							  DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"/>
         <input type="hidden" id="idApply${ap.id}" value="${ap.id}">
         <div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
              <div>
                  <comp:deleteButton id="${ap.id}" type="button"></comp:deleteButton>             
              </div>
              <comp:applyStatus status="${ap.status}"/>
    </div>
<!--   </div>
</div> -->
</comp:wrapperCard>
               
<!-- Modal xác nhận xóa -->
	<comp:modalDelete
		 id="${ap.id}"
		 idHidden="idApply"
		 title="${ap.recruitment.title}"
		 onConfirm="deleteApply(${ap.id})"
	/>