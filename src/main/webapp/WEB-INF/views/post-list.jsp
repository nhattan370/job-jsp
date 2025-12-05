<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>   
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>
<%@ include file="/WEB-INF/common/navbar.jsp" %>

<comp:pageHero title="Danh sách bài đăng" breadcrumb="Danh sách"/>

<c:if test="${not empty mes}">
 <div class="toast" data-delay="2500" style="position:fixed; top: 100PX; left: 10PX;z-index: 2000;width: 300px">
    <script>
        swal({
            title: '${mes}',
            /* text: 'Redirecting...', */
            icon: '${status}',
            timer: 3000,
            buttons: true,
            type: 'success'
        })
    </script>
 </div>
</c:if>
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 pr-lg-4">
                <div class="row">
                	<c:if test="${reDTO.size()==0}">
                        <div class="row form-group" >
                            <label for="company-website-tw d-block">Danh sách bài tuyển dụng </label> <br>
                            <div class="col-md-12">
                                <a href="${POST}" class="btn px-4 btn-primary text-white">Đăng tuyển</a>
                            </div>
                        </div>
                    </c:if>
                 <c:if test="${reDTO.size()>0}">
                    <c:forEach var="re" items= "${reDTO}">
                    	<comp:wrapperCard id="${re.id}">
                    		<comp:informationRecruitment 
			 					isDto="<%= Boolean.TRUE %>"
			 					re="${re}"
			 					DETAIL_RECRUITMENT="${DETAIL_RECRUITMENT}"
			 					DETAIL_COMPANY="${DETAIL_COMPANY}"
	    					/>
	    					
	    					<comp:deleteButton id="${re.id}" type="button" title="Xóa bài"></comp:deleteButton>
	    					<a href="${DETAIL_RECRUITMENT}${re.id}" class="btn btn-primary py-2 ml-2">Chi tiết</a>
                            <a href="${POST}?id=${re.id}" class="btn btn-warning py-2 ml-2">Cập nhật</a>
                    	</comp:wrapperCard>
                        
                        <!-- Modal -->
                        	<comp:modalDelete onConfirm="deleteRe(${re.id})" idHidden="idRe" id="${re.id}" title="${re.title}"></comp:modalDelete>                   
                        <!-- Modal -->
                        </c:forEach>
                    </c:if>
                </div>
<%--                 <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li th:if="${numberPage>0}"><a th:href="@{/user/list-post(page = ${list.number - 1})}">&lt;</a></li>
                                <th:block th:each="recruitment,state  : ${recruitmentList}">
<!--                                    <th:block th:if="${numberPage == 0}">-->
<!--                                        <li th:class="${numberPage == 0 ? 'active' : null }"><a th:href="@{/user/list-post(page = ${state.index})}" th:text="${state.index + 1}"></a></li>-->
<!--                                    </th:block>-->
                                        <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{/user/list-post(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                                </th:block>
                                <li th:if="${numberPage<list.totalPages - 1}"><a th:href="@{/user/list-post(page = ${list.number + 1})}">&gt;</a></li>
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