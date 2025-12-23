<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>

<%@ attribute name="re" type="java.lang.Object" required="true" %>
<%@ attribute name="isDto" type="java.lang.Boolean" required="true" %>
<%@ attribute name="DETAIL_RECRUITMENT" required="true" %>
<%@ attribute name="DETAIL_COMPANY" required="true" %>

<div class="one-third mb-4 mb-md-0"> 
     <div class="job-post-item-header align-items-center">
     	<span class="subadge">${re.id}.</span>
     	<span class="subadge">${re.type}</span>
    	<h2 class="mr-3 text-black"><a href="${DETAIL_RECRUITMENT}${re.id}">${re.title}</a></h2>
    </div> 
    <div class="job-post-item-body d-block d-md-flex">
         <div class="mr-3">
         	<span class="icon-layers"></span> 
         	<a href="${DETAIL_COMPANY}${isDto ? re.idCompany : re.company.id}">
         		${isDto ? re.nameCompany : re.company.nameCompany}
         	</a>
         </div>
         <div>
         	<span class="icon-my_location"></span> 
         	<span>${re.address}</span>
         </div>
    </div>
</div>