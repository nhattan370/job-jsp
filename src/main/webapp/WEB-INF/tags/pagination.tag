<%@ tag language="java" body-content="scriptless" %>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="ob" type="java.lang.Object" required="true" %>
<%@ attribute name="link" required="true" %> 	
<div class="row mt-5">
    <div class="col-12">
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">

                <!-- PREV -->
               	<c:if test="${ob.currentPage > 1}">
	                <li class="page-item">
	                    <a class="page-link" href="${link}page=${ob.currentPage-1}" aria-label="Previous">
	                        <span aria-hidden="true">&laquo;</span>
	                    </a>
	                </li>
                </c:if>

                <!-- PAGE NUMBERS -->
                <c:forEach var="i" begin="1" end="${ob.totalPages}">
                    <li class="page-item ${i == ob.currentPage ? 'active' : ''}">
                        <a class="page-link" href="${link}page=${i}">${i}</a>
                    </li>
                </c:forEach>

                <!-- NEXT -->
                <c:if test="${ob.currentPage < ob.totalPages}">
	                <li class="page-item">
	                    <a class="page-link" href="${link}page=${ob.currentPage+1}" aria-label="Next">
	                        <span aria-hidden="true">&raquo;</span>
	                    </a>
	                </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>
