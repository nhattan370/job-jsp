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

	<section class="ftco-section bg-light">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-9 pr-lg-5">
	                <div class="row justify-content-center pb-3">
	                    <div class="col-md-12 heading-section ">
	                        <span class="subheading">CÔNG VIỆC ĐƯỢC NHIỀU NGƯỜI ỨNG TUYỂN</span>
	                        <h2 class="mb-4">Các bài đăng về việc làm nổi bật</h2>
	
	                    </div>
	                </div>
	                <div class="row">
	                    <c:forEach  var="recruitment" items="${recruitments}">
	                        <div class="col-md-12 ">
	                            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
	                                <div class="one-third mb-4 mb-md-0">
	                                    <div class="job-post-item-header align-items-center">
	                                        <span class="subadge">${recruitment.type}</span>
	                                        <h2 class="mr-3 text-black"><a href="recruitment/detail?${recruitment.id}">${recruitment.title}</a></h2>
	                                    </div>
	                                    <div class="job-post-item-body d-block d-md-flex">
	                                        <div class="mr-3"><span class="icon-layers"></span> <a href="#">${recruitment.nameCompany}</a></div>
	                                        <div><span class="icon-my_location"></span> <span>${recruitment.address}</span></div>
	                                    </div>
	                                </div>
	                                <input type="hidden" id="idRe${recruitment.id}" value="${recruitment.id}">
	<%--                                 <div th:if="${session.user}" class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
	                                    <div th:if="${session.user.role.id == 1}">
	                                        <a onclick="save(${recruitment.id})" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
	                                            <span class="icon-heart"></span>
	                                        </a>
	                                    </div>
	                                    <a th:if="${session.user.role.id == 1}" data-toggle="modal" data-target="#exampleModal${recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
	                                </div> --%>
	                                <div th:unless="${session.user}" class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
	                                    <div >
	                                        <a onclick="save(${recruitment.id})" class="icon text-center d-flex justify-content-center align-items-center icon mr-2">
	                                            <span class="icon-heart"></span>
	                                        </a>
	                                    </div>
	                                    <a  data-toggle="modal" data-target="#exampleModal${recruitment.id}" class="btn btn-primary py-2">Apply Job</a>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- end -->
	                        <!-- Modal -->
	                        <div class="modal fade" id="exampleModal${recruitment.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	                            <div class="modal-dialog" role="document">
	                                <div class="modal-content">
	                                    <div class="modal-header">
	                                        <h5 class="modal-title" id="exampleModalLabel">Ứng tuyển: <span>${recruitment.title}</span></h5>
	                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                            <span aria-hidden="true">&times;</span>
	                                        </button>
	                                    </div>
	                                    <form method="post" action="user/apply-job">
	                                        <div class="modal-body">
	                                            <div class="row">
	                                                <div class="col-12">
	                                                    <select id="choose${recruitment.id}" onchange="choosed(${recruitment.id})" class="form-control" aria-label="Default select example">
	                                                        <option selected>Chọn phương thức nộp</option>
	                                                        <option value="1">Dùng cv đã cập nhật</option>
	                                                        <option value="2">Nộp cv mới</option>
	                                                    </select>
	                                                </div>
	                                                <div id="loai1${recruitment.id}" style="display:none" class="col-12">
	                                                    <label for="fileUpload"
	                                                           class="col-form-label">Giới thiệu:</label>
	                                                    <textarea rows="10" cols="3" class="form-control" id="text${recruitment.id}" ></textarea>
	                                                </div>
	                                                <div id="loai2${recruitment.id}" style="display:none" class="col-12">
	
	                                                    <label for="fileUpload"
	                                                           class="col-form-label">Chọn cv:</label>
	                                                    <input type="file" class="form-control"
	                                                           id="fileUpload${recruitment.id}" name="file" required>
	                                                    <label for="fileUpload"
	                                                           class="col-form-label">Giới thiệu:</label>
	                                                    <textarea rows="10" cols="3" class="form-control" id="text${recruitment.id}" ></textarea>
	                                                </div>
	
	                                            </div>
	                                            <div class="modal-footer">
	                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
	                                                <button type="button" id="button1${recruitment.id}" style="display: none" onclick="apply1(${recruitment.id})" class="btn btn-primary">Nộp</button>
	                                                <button type="button" id="button2${recruitment.id}" style="display: none" onclick="apply(${recruitment.id})" class="btn btn-primary">Nộp</button>
	                                            </div>
	                                        </div>
	                                    </form>
	
	
	                                </div>
	                            </div>
	                        </div>
	                    </c:forEach>
	
	                </div>
	            </div>
	            <div class="col-lg-3 sidebar">
	                <div class="row justify-content-center pb-3">
	                    <div class="col-md-12 heading-section ">
	                        <h2 class="mb-4">Công ty nổi bật</h2>
	                    </div>
	                </div>
	                <c:forEach items="${companies}" var="company">
	                <div class="sidebar-box">
	                    <div class="">
	                        <a href="user/detail-company?${company.id}" class="company-wrap"><img src="${company.logo}" class="img-fluid" alt="Colorlib Free Template"></a>
	                        <div class="text p-3">
	                            <h3><a href="/user/detail-company?${company.id}">${company.nameCompany}</a></h3>
	                            <p><span class="number" style="color: black">${company.totalRecruitments}</span> <span>Vị trí ứng tuyển</span></p>
	                        </div>
	                    </div>
	                </div>
	                </c:forEach>
	            </div>
	        </div>
	    </div>
	</section>
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