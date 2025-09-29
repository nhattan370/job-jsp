<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/common/head.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/more/categories.css">
</head>
<body>
<!-- start nav -->
	<%@ include file="/WEB-INF/common/navbar.jsp" %>

<!-- show swal -->
	<div class="toast" data-delay="2000" style="position:fixed;top: 100PX; right: 10PX;z-index: 2000;width: 300px">
	
	</div>
	
<!-- general interface -->
	<%@include file="/WEB-INF/common/general.jsp" %>
	
	<!-- show feature job when it doesn't handle search -->
	<c:if test="${typeSearch==null}">
	<section class="ftco-section">
	    <div class="container">
	        <div class="row justify-content-center mb-5">
	            <div style="display: block" class="col-md-7 heading-section text-center">
	                <span class="subheading">Danh mục công việc</span>
	                <h2 class="mb-0">Top Danh Mục</h2>
	            </div>
	        </div>
	        
	        <!--Render in js  -->
	
	        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="false">
	        
				<div class="carousel-inner" id="category-container">
				</div>
				<button class="prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				</button>
				<button class="next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
				</button>
			</div>      
	        <!--Render in js  -->
	        
	    </div>
	</section>

	<section class="ftco-section services-section">
	    <div class="container">
	        <div class="row d-flex">
	            <div class="col-md-3 d-flex align-self-stretch ">
	                <div class="media block-6 services d-block">
	                    <div class="icon"><span class="flaticon-resume"></span></div>
	                    <div class="media-body">
	                        <h3 class="heading mb-3">Tìm kiếm hàng triệu việc làm</h3>
	                        <p> ở và nguồn cung cấp của họ.Cơ hội nghề nghiệp phong phú, chỉ một cú nhấp chuột để bắt đầu hành trình mới.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3 d-flex align-self-stretch ">
	                <div class="media block-6 services d-block">
	                    <div class="icon"><span class="flaticon-team"></span></div>
	                    <div class="media-body">
	                        <h3 class="heading mb-3">Dễ dàng quản lý công việc</h3>
	                        <p>Theo dõi, sắp xếp và tối ưu hóa công việc của bạn mọi lúc, mọi nơi.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3 d-flex align-self-stretch ">
	                <div class="media block-6 services d-block">
	                    <div class="icon"><span class="flaticon-career"></span></div>
	                    <div class="media-body">
	                        <h3 class="heading mb-3">Top Nghề nghiệp</h3>
	                        <p>Khám phá những ngành nghề hot nhất và định hướng sự nghiệp bền vững cho tương lai.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-3 d-flex align-self-stretch ">
	                <div class="media block-6 services d-block">
	                    <div class="icon"><span class="flaticon-employees"></span></div>
	                    <div class="media-body">
	                        <h3 class="heading mb-3">Ứng viên Chuyên gia Tìm kiếm</h3>
	                        <p>Kết nối nhanh chóng với ứng viên chất lượng, phù hợp đúng nhu cầu tuyển dụng.</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

		<%@include file="/WEB-INF/common/featured-job.jsp" %>
	</c:if>
	<!-- show result search with typeSearch=job -->
	<c:if test="${typeSearch==sessionScope.listType[0]}"><%@include file="/WEB-INF/common/result-search-job.jsp" %></c:if>
	<!-- show result search with typeSearch=user -->
	<c:if test="${typeSearch==sessionScope.listType[1]}"><%@include file="/WEB-INF/common/result-search-user.jsp"%></c:if>
	<!-- show result search with typeSearch=address -->
	<c:if test="${typeSearch==sessionScope.listType[2]}"><%@include file="/WEB-INF/common/result-search-address.jsp"%></c:if>
	
<script>
    function save(id){
        var name = "#idRe" +id;
        var idRe = $(name).val();
        var formData = new FormData();
        formData.append('idRe', idRe);
        $.ajax(
            {
                type: 'POST',
                url: '/save-job/save/',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                    console.log(data);
                    if(data == "false"){
                        swal({
                            title: 'Bạn cần phải đăng nhập!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }else if(data == "true"){
                        swal({
                            title: 'Lưu thành công!',
                            /* text: 'Redirecting...', */
                            icon: 'success',
                            timer: 3000,
                            buttons: true,
                            type: 'success'
                        })
                    }else{
                        swal({
                            title: 'Bạn đã lưu bài này rồi!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }
                },
                error: function (err) {
                    alert(err);
                }
            }
        )
    }

    function choosed(id){
        var name = '#choose' + id;
        var name1 = 'loai1' + id;
        var name2 = 'loai2' + id;
        var button1 = 'button1' + id;
        var button2 = 'button2' + id;
        var giaitri = $(name).val();
        if(giaitri == 1){
            document.getElementById(name1).style.display = 'block'
            document.getElementById(name2).style.display = 'none'
            document.getElementById(button1).style.display = 'block'
            document.getElementById(button2).style.display = 'none'
        }else{
            document.getElementById(name2).style.display = 'block'
            document.getElementById(name1).style.display = 'none'
            document.getElementById(button2).style.display = 'block'
            document.getElementById(button1).style.display = 'none'
        }
    }

    function apply(id){
        var name = "#idRe" +id;
        var nameModal = "#exampleModal" +id;
        var nameFile = "#fileUpload"+id;
        var nameText = "#text" +id;
        var idRe = $(name).val();
        var textvalue = $(nameText).val();
        var fileUpload = $(nameFile).get(0);
        var files = fileUpload.files;
        var formData = new FormData();
        formData.append('file', files[0]);
        formData.append('idRe', idRe);
        formData.append('text', textvalue);
        if(files[0] == null){
            swal({
                title: 'Bạn cần phải chọn cv!',
                /* text: 'Redirecting...', */
                icon: 'error',
                timer: 3000,
                buttons: true,
                type: 'error'
            })
        } else {
            $.ajax(
                {
                    type: 'POST',
                    url: '/user/apply-job/',
                    contentType: false,
                    processData: false,
                    data: formData,
                    success: function (data) {
                        if (data == "false") {
                            swal({
                                title: 'Bạn cần phải đăng nhập!',
                                /* text: 'Redirecting...', */
                                icon: 'error',
                                timer: 3000,
                                buttons: true,
                                type: 'error'
                            })
                        } else if (data == "true") {
                            swal({
                                title: 'Ứng tuyển thành công!',
                                /* text: 'Redirecting...', */
                                icon: 'success',
                                timer: 3000,
                                buttons: true,
                                type: 'success'
                            })
                            $(nameModal).modal('hide');
                            $('#fileUpload').val("");
                        } else {
                            swal({
                                title: 'Bạn đã ứng tuyển công việc này!',
                                /* text: 'Redirecting...', */
                                icon: 'error',
                                timer: 3000,
                                buttons: true,
                                type: 'error'
                            })
                            $(nameModal).modal('hide');
                            $('#fileUpload').val("");
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                }
            )
        }

    }
    function apply1(id){
        var name = "#idRe" +id;
        var nameModal = "#exampleModal" +id;
        var nameFile = "#fileUpload"+id;
        var nameText = "#text" +id;
        var idRe = $(name).val();
        var textvalue = $(nameText).val();
        var formData = new FormData();
        formData.append('idRe', idRe);
        formData.append('text', textvalue);
        $.ajax(
            {
                type: 'POST',
                url: '/user/apply-job1/',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                    if(data == "false"){
                        swal({
                            title: 'Bạn cần phải đăng nhập!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                    }else if(data == "true"){
                        swal({
                            title: 'Ứng tuyển thành công!',
                            /* text: 'Redirecting...', */
                            icon: 'success',
                            timer: 3000,
                            buttons: true,
                            type: 'success'
                        })
                        $(nameModal).modal('hide');
                        $('#fileUpload').val("");
                    }else{
                        swal({
                            title: 'Bạn đã ứng tuyển công việc này!',
                            /* text: 'Redirecting...', */
                            icon: 'error',
                            timer: 3000,
                            buttons: true,
                            type: 'error'
                        })
                        $(nameModal).modal('hide');
                        $('#fileUpload').val("");
                    }
                },
                error: function (err) {
                    alert(err);
                }
            }
        )


    }
</script>
<!-- start footer -->
	<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
<script src="${pageContext.request.contextPath}/assets/js/more/category.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>