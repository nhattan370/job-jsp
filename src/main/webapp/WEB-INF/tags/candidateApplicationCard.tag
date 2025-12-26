<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %> 
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>

<%@ attribute name="ap" type="model.ApplyPost" required="true" %>
<%@ attribute name="HANDLE_CV" required="true" %>
<%@ attribute name="SHOW_CV" required="true" %>

<div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
    <div class="team d-md-flex p-4 bg-white">
        <IMG style="margin-top: 10px" class="img" src="${ap.user.image}"
                onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/user.png';"></IMG>
        <div class="text pl-md-4">
            <h5 class="location mb-0">${ap.user.fullName}</h5>
            <p style="display: block;color: black">${ap.user.address}</p>
            <span class="position" style="display: block;color: black">${ap.user.email}</span>
            <p class="mb-4" style="width: 700px">${ap.text}.</p>
            <div class="row">
            	<c:if test="${ap.nameCv != null}">		                                    	
	            	<comp:applyStatus HANDLE_CV="${HANDLE_CV}" ap="${ap}" SHOW_CV="${SHOW_CV}"/>
            	</c:if>
            </div>
        </div>
    </div>
</div>
<%--              <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
              <div class="team d-md-flex p-4 bg-white">
				<img style="margin-top: 10px" class="img"
				     src="${not empty applyPost.image ? applyPost.image : pageContext.request.contextPath.concat('/assets/images/user.png')}" />
                <div class="text pl-md-4">
                  <H5 class="location mb-0">${applyPost.fullName}</H5>
                  <p style="display: block;color: black">${applyPost.address}</p>
                  <span class="position" style="display: block;color: black">${applyPost.email}</span>
                  <p class="mb-4" style="width: 700px">
                  	<c:out value="${applyPost.description}" escapeXml="false"/>
                  </p>
                  <c:if test="${applyPost.nameCv != null}">
	                  <div style="margin-left: 1px" class="row">
	                    <p><a href="user/getCv/${applyPost.id}" class="btn btn-primary">Xem cv</a></p>
	                  </div>
                  </c:if>
                </div>
              </div>
            </div>  --%>