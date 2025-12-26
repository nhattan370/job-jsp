<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>   
<section class="ftco-section bg-light">
	
    <div class="container">
        <h4 style="margin-top: -20px">Kết quả tìm kiếm cho : ${param.keySearch}</h4>
        <div class="row">
            <div class="col-lg-12 pr-lg-5">
                <div class="row">
                    <c:forEach var="recruitment" items="${list.data}" >
                        <comp:applySave 
                        		re="${recruitment}" 
                        		DETAIL_COMPANY="${DETAIL_COMPANY}" 
                        		DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"/>
                        <!-- end -->
                        <!-- Modal -->
		                   <comp:applyModal id="${recruitment.id}" title="${recruitment.title}"/>
                    </c:forEach>
                    <c:if test="${list.totalItems==0}">
	                    <div style="text-align: center">
	                        <p style="color: red">Không có kết quả nào</p>
	                    </div>
                    </c:if>
                </div>
                <comp:pagination ob="${list}" link=""></comp:pagination>
            </div>

        </div>
    </div>
</section>