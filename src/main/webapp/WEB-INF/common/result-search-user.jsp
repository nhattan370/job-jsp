<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %> 
<section class="ftco-section bg-light">
  <div class="container">
    <h4 style="margin-top: -20px">Kết quả tìm kiếm cho : <span>${param.keySearch}</span></h4>
    <div class="row">
      <div class="col-lg-12 pr-lg-5">
        <div class="row">
        <c:if test="${list.totalItems > 0}">
			<c:forEach var="user" items="${list.data}">
           	<div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
              <div class="team d-md-flex p-4 bg-white">
        		<IMG style="margin-top: 10px" class="img" src="${user.image}"
               		 onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/user.png';"></IMG>
                <div class="text pl-md-4">
                  <H5 class="location mb-0">${user.fullName}</H5>
                  <p style="display: block;color: black">${user.address}</p>
                  <span class="position" style="display: block;color: black">${user.email}</span>
                  <p class="mb-4" style="width: 700px">
                  	<c:out value="${user.description}" escapeXml="false"/>
                  </p>
                  <c:if test="${user.cv.fileName != null}">
	                  <div style="margin-left: 1px" class="row">
	                    <p><a href="${user.cv.fileName}" target="_blank" class="btn btn-primary">Xem cv</a></p>
	                  </div>
                  </c:if>
                </div>
              </div>
            </div> 
			</c:forEach>
        </c:if>
        <c:if test="${list.totalItems == 0}">
          <div style="text-align: center">
            <p style="color: red">Không có kết quả nào</p>
          </div>
        </c:if>
        </div>
        <comp:pagination ob="${list}" link="${SEARCH_APPLICANT}?keySearch=${param.keySearch}&typeSearch=${sessionScope.listType[1]}&"></comp:pagination>
        
      </div>
    </div>
  </div>
</section>

