<%@ tag language="java" body-content="scriptless" %>
<%@ tag description="Reusable confirm modal"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>
<%@ attribute name="image" required="true" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="title" required="true" %>
<div class="hero-wrap hero-wrap-2" style="background-image: url(${pageContext.request.contextPath}/assets/images/bg_1.jpg);" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
            <div class="col-md-12 text-center mb-5">
                <h1 class="mb-3 bread">${title} </h1>
                <div class="form-group">
                    <label class="btn btn-primary btn-md btn-file">
                        Chọn ảnh<input type="file" name="file" id="${id}" hidden>
                    </label>
                </div>

                <div style="position: relative; display: inline-block;">
				    <img id="avatar" height="100" width="100"
				         style="border-radius: 50px"
				         src="${image}"
				         onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/${id=='fileUploadLogoCompany' ? 'company-default.jpg' : 'user.png'}';"
				         >
				</div>
				<jsp:include page="/WEB-INF/common/loading-overlay.jsp"></jsp:include>
            </div>
        </div>
    </div>
</div>