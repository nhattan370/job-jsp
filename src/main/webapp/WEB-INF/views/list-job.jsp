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
	<comp:pageHero title="Browse Job" breadcrumb="Job Post"/>

<section style="display: block" class="ftco-section">
  <div class="">
    <div class="row justify-content-center mb-5">
      <div class="col-md-7 heading-section text-center ">
        <span class="subheading">Job Categories</span>
        <h2 class="mb-0">Top Categories</h2>
      </div>
    </div>
    <div class="row">
<!--           <li><a href="#">PHP Programming <br><span class="number">400</span> <span>Open position</span><i class="ion-ios-arrow-forward"></i></a></li> -->
      <c:forEach var="cat" items="${categories}">
      		<div class="col-md-3">
			    <ul class="category text-center">
			        <li>
			        	<a style="text-decoration: none !important;" href="${LIST_RECRUITMENT_BY_CATEGORY}${cat.id}">
							${cat.name}<br>
			        		<span class="number">${cat.numberChoose}</span> 
			        		<span>Vị trí</span>
			        		<i class="ion-ios-arrow-forward"></i>
			        	</a>
			        </li>
			    </ul>
			</div>
      </c:forEach>
    </div>
  </div>
</section>
	<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
	<!-- end footer -->
</body>
</html>