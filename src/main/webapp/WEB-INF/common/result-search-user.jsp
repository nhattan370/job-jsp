<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<section class="ftco-section bg-light">
  <div class="container">
    <h4 style="margin-top: -20px">Kết quả tìm kiếm cho : <span>${keySearch}</span></h4>
    <div class="row">
      <div class="col-lg-12 pr-lg-5">
        <div class="row">
          <c:forEach var="applyPost" items="${list}">
            <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
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
            </div>
          </c:forEach>
          <c:if test="${list.size() == 0}">
          <div style="text-align: center">
            <p style="color: red">Không có kết quả nào</p>
          </div>
          </c:if>
        </div>
<%--         <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li th:if="${numberPage>0}"><a th:href="@{'/user/search/' +${keySearch}(page = ${list.number - 1})}">&lt;</a></li>
                <th:block th:each="recruitment,state  : ${recruitmentList}">
                  <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{'/user/search/' +${keySearch}(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                </th:block>
                <li th:if="${numberPage<list.totalPages - 1}"><a th:href="@{'/user/search/' +${keySearch}(page = ${list.number + 1})}">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div> --%>
        
      </div>
    </div>
  </div>
</section>