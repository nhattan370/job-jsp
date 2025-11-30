<%@ tag language="java" body-content="scriptless" %>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="type" required="false" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:set var="displayType" value="${empty type ? 'icon' : type}" />

<c:if test="${displayType=='icon'}">
	<a onclick="save(${id})" class="text-center d-flex justify-content-center align-items-center icon mr-2">
		<span id="heartIcon${id}" class="icon-heart"></span>
	</a>
</c:if>

<c:if test="${displayType=='button'}">
	<a onclick="save(${id})" class="btn btn-block btn-light btn-md">
		<span class="icon-heart-o mr-2 text-danger" id="heartIcon${id}"></span>
		<span id="followText${id}">Lưu</span>
	</a>
</c:if>