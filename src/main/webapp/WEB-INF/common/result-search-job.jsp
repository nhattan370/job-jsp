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
                    <c:forEach var="recruitment"  items="${list}" >
                        <comp:applySave 
                        		re="${recruitment}" 
                        		DETAIL_COMPANY="${DETAIL_COMPANY}" 
                        		DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"/>
                        <!-- end -->
                        <!-- Modal -->
		                   <comp:applyModal id="${recruitment.id}" title="${recruitment.title}"/>
                        
                    </c:forEach>
                    <c:if test="${list.size()==0}">
	                    <div style="text-align: center">
	                        <p style="color: red">Không có kết quả nào</p>
	                    </div>
                    </c:if>
                </div>

<%--                 <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li th:if="${numberPage>0}"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${list.number - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
                                    <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<list.totalPages - 1}"><a th:href="@{'/recruitment/search/'+ ${keySearch}(page = ${list.number + 1})}">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div> --%>
            </div>

        </div>
    </div>
</section>