<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %> 
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>

<%@ attribute name="ap" type="model.ApplyPost" required="true" %>
<%@ attribute name="HANDLE_CV" required="true" %>

<div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
    <div class="team d-md-flex p-4 bg-white">
        <IMG class="img" src="${ap.user.image != null ? ap.user.image : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"></IMG>
        <div class="text pl-md-4">
            <h5 class="location mb-0">${ap.user.fullName}</h5>
            <p style="display: block;color: black">${ap.user.address}</p>
            <span class="position" style="display: block;color: black">${ap.user.email}</span>
            <p class="mb-4" style="width: 700px">${ap.user.description}.</p>
            <div class="row">
            	<c:if test="${ap.nameCv != null}">
                	<p><a href="${ap.nameCv}" target="_blank" class="btn btn-primary">Xem cv</a></p>			                                    	
            	</c:if>
<%--                 <c:if test="${ap.status.name() == 'PENDING'}">
                 	<p style="margin-left: 10px"><a class="btn btn-outline-primary" href="${param.HANDLE_CV}${ap.id}" >Duyệt</a></p>
                </c:if>
                <c:if test="${ap.status.name() == 'VIEWED'}">
                	<p style="margin-left: 10px"><a class="btn btn-outline-success" href="${param.HANDLE_CV}${ap.id}" >Đã xem</a></p>
            	</c:if>
            	<c:if test="${ap.status.name() == 'SUITABLE'}">
            		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #1e7e34;font-weight: bold" >Đã duyệt</span></p>
            	</c:if>
            	<c:if test="${ap.status.name() == 'UNSUITABLE'}">
            		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #dc3545;font-weight: bold" >Đã xem</span></p>
            	</c:if>
            	<c:if test="${ap.status.name() == 'WITHDRAWN'}">
            		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #fd7e14;font-weight: bold" >Ứng viên rút đơn</span></p>
            	</c:if> --%>
            	<comp:applyStatus status="${ap.status}" id="${ap.id}" HANDLE_CV="${HANDLE_CV}"/>
            </div>
        </div>
    </div>
</div>