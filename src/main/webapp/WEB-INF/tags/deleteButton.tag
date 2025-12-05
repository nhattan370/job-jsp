<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag language="java" body-content="scriptless" %>

<%@ attribute name="id" required="true" %>
<%@ attribute name="type" required="false" %>
<%@ attribute name="title" required="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:set var="displayType" value="${empty type ? 'icon' : type}" />
<c:set var="displayTitle" value="${empty title ? 'Rút đơn' : title}" />

<c:choose>
    <c:when test="${displayType == 'button'}">
        <button type="button"
                class="btn btn-outline-danger btn-sm mr-2"
                data-toggle="modal"
                data-target="#deleteModal${id}">
            ${displayTitle}
        </button>
    </c:when>

    <c:otherwise>
        <a data-toggle="modal"
           data-target="#deleteModal${id}"
           class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
           <span class="icon-delete"></span>
        </a>
    </c:otherwise>
</c:choose>