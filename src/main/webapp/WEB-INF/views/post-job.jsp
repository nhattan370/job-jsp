<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head><%@ include file="/WEB-INF/common/head.jsp" %></head>
<body>
<!-- start nav -->
	<%@ include file="/WEB-INF/common/navbar.jsp" %>
<!-- end nav -->
	<comp:pageHero title="Đăng bài tuyển dụng" breadcrumb="Đăng bài"/>
<c:if test="${not empty mes}">
	<div class="toast" data-delay="2500" style="position:fixed; top: 100PX; right: 10PX;z-index: 2000;width: 300px">
	    <script>
	        swal({
	            title: '${mes}',
	            /* text: 'Redirecting...', */
	            icon: '${status}',
	            timer: 3000,
	            buttons: true,
	            type: '${status}'
	        })
	    </script>
	</div> 
</c:if>
<section class="site-section">
    <div class="container">
    <form:form action="${ADD_POST}" method="post" modelAttribute="reDTO">

    
		<div class="row mb-5">
		    <div class="col-12">
		        <div class="text-center py-3 border-bottom">
		            <h2 class="font-weight-bold text-primary mb-0">Đăng bài</h2>
		        </div>
		    </div>
		</div>
		
		    
		<div class="row mb-3">
		    <div class="col-12 text-right">
		        <a href="${POST}" class="btn btn-success btn-lg">
		            <i class="fa fa-plus-circle mr-2"></i> Tạo bài tuyển dụng mới
		        </a>
		    </div>
		</div>

   <div class="row mb-5">
    <div class="col-lg-10 mx-auto">
        <div class="p-4 p-md-5 border rounded shadow-lg bg-white">

            <h3 class="text-black mb-4 border-bottom pb-2 font-weight-bold text-center">
                Chi tiết bài tuyển dụng
            </h3>

            <!-- Tiêu đề -->
            <div class="form-group">
                <label for="title">Tiêu đề</label>
                <form:input class="form-control" id="title" placeholder="Tiêu đề" path="title"/>
                <small class="text-danger"><form:errors path="title"/></small>
            </div>

            <!-- Kinh nghiệm -->
            <div class="form-group">
                <label for="experience">Kinh nghiệm</label>
                <form:input class="form-control" id="experience" placeholder="Kinh nghiệm" path="experience"/>
                <small class="text-danger"><form:errors path="experience"/></small>
            </div>
            
            <!-- Loại công việc -->
            <div class="form-group">
                <label for="type">Loại công việc</label>
                <form:select class="form-control" path="type">
                    <form:option selected="true" disabled="true" value="">Chọn loại công việc</form:option>
                    <form:option value="Part time">Part time</form:option>
                    <form:option value="Full time">Full time</form:option>
                    <form:option value="Freelancer">Freelancer</form:option>
                </form:select>
                <small class="text-danger"><form:errors path="type"/></small>
            </div>

            <!-- Category -->
            <div class="form-group">
                <label for="category">Danh mục công việc</label>
                <form:select class="form-control" path="category">
                    <form:option selected="true" disabled="true" value="">Chọn danh mục công việc</form:option>
                    <c:forEach var="cat" items="${categories}">
                        <form:option value="${cat.id}">${cat.name}</form:option>
                    </c:forEach>
                </form:select>
                <small class="text-danger"><form:errors path="category"/></small>
            </div>

            <!-- Số người -->
            <div class="form-group">
                <label for="quantity">Số người cần tuyển</label>
                <form:input class="form-control" id="quantity" placeholder="Số người cần tuyển" path="quantity"/>
                <small class="text-danger"><form:errors path="quantity"/></small>
            </div>

            <!-- Địa chỉ -->
            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <form:input class="form-control" id="address" placeholder="Địa chỉ công ty" path="address"/>
                <small class="text-danger"><form:errors path="address"/></small>
            </div>

            <!-- Deadline -->
            <div class="form-group">
                <label for="deadline">Hạn ứng tuyển</label>
                <form:input type="date" class="form-control" id="deadline" path="deadline"/>
                <small class="text-danger"><form:errors path="deadline"/></small>
            </div>

            <!-- Lương -->
            <div class="form-group">
                <label for="salary">Lương</label>
                <form:input class="form-control" id="salary" placeholder="Mức lương" path="salary"/>
                <small class="text-danger"><form:errors path="salary"/></small>
            </div>
            
            <!-- Mô tả -->
            <div class="form-group">
                <label for="description">Mô tả công việc</label>
                <form:textarea class="form-control" id="description" placeholder="Mô tả" path="description"></form:textarea>
                <small class="text-danger"><form:errors path="description"/></small>
            </div>
            
            <form:input type="hidden" path="id" />
            <!-- Submit Button -->
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary btn-lg px-5">
                    <i class="fa fa-paper-plane mr-2"></i> Đăng tuyển
                </button>
            </div>

        </div>
    </div>
</div>

    </form:form>
    </div>
</section>
<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>