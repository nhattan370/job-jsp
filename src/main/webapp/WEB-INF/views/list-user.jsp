<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>   
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>
<!-- start nav -->
	<%@ include file="/WEB-INF/common/navbar.jsp" %>
<!-- end nav -->
<c:if test="${not empty mes}">
	<div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
	  <script>
	    swal({
	      title: 'Ứng cử viên này chưa cập nhật cv!',
	      /* text: 'Redirecting...', */
	      icon: 'error',
	      timer: 3000,
	      buttons: true,
	      type: 'error'
	    })
	  </script>
	</div>
</c:if>
	<comp:pageHero title="Danh sách ứng cử viên" breadcrumb="Công việc"/>

<section class="ftco-section bg-light">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 pr-lg-5">
        <div class="row">
          <c:forEach var="applyPost" items= "${applyPosts}">
            <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
              <div class="team d-md-flex p-4 bg-white">
                <IMG style="margin-top: 10px" class="img" src="${applyPost.user.image}"
                onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/user.png';"></IMG>
                <div class="text pl-md-4">
                  <H5 class="location mb-0">${applyPost.user.fullName}</H5>
                  <p style="display: block;color: black">${applyPost.user.address}</p>
                  <span class="position" style="display: block;color: black">${applyPost.user.email}</span>
                  <p class="mb-4" style="width: 700px" >${applyPost.text}.</p>
                  <c:if test="${applyPost.nameCv != null}">
	                  <div style="margin-left: 1px; display: flex; gap: 5px" class="row">
	                    <comp:applyStatus ap="${applyPost}" HANDLE_CV="${HANDLE_CV}"/>
	                  </div>
                  </c:if>
                </div>
              </div>
            </div>
          </c:forEach>
          <c:if test="${applyPosts.size() == 0}">
	          <div  style="text-align: center">
	            <p style="color: red">Không có kết quả nào</p>
	          </div>
          </c:if>
        </div>
<%--         <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li th:if="${numberPage>0}"><a th:href="@{'/user/list-candidate/'(page = ${list.number - 1})}">&lt;</a></li>
                <th:block th:each="recruitment,state  : ${recruitmentList}">
                  <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{'/user/list-candidate/'(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                </th:block>
                <li th:if="${numberPage<list.totalPages - 1}"><a th:href="@{'/user/list-candidate/' (page = ${list.number + 1})}">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div> --%>
      </div>

    </div>
  </div>
</section>
<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>