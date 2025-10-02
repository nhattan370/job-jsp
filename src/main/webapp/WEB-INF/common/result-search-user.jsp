<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<section class="ftco-section bg-light">
  <div class="container">
    <h4 style="margin-top: -20px">Kết quả tìm kiếm cho : <span>${keySearch}</span></h4>
    <div class="row">
      <div class="col-lg-12 pr-lg-5">
        <div class="row">
          <c:forEach var="applyPost" items="${list}">
            <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
              <div class="team d-md-flex p-4 bg-white">
                <img style="margin-top: 10px" class="img" src="${applyPost.image != null ? applyPost.image : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"/>
                <div class="text pl-md-4">
                  <H5 class="location mb-0">${applyPost.fullName}</H5>
                  <p style="display: block;color: black">${applyPost.address}</p>
                  <span class="position" style="display: block;color: black">${applyPost.email}</span>
                  <p class="mb-4" style="width: 700px">
                  	<c:out value="${applyPost.description}" escapeXml="false"/>
                  </p>
                  <c:if test="${applyPost.nameCv != null}">
	                  <div style="margin-left: 1px" class="row">
	                    <p><a href="user/getCv/${applyPost.id}" class="btn btn-primary">Xem cv</a></p>
	                  </div>
                  </c:if>
                </div>
              </div>
            </div>
          </c:forEach>
          <c:if test="${list.size() == 0}">
          <div style="text-align: center">
            <p style="color: red">Không có kết quả nào</p>
          </div>
          </c:if>
        </div>
<%--         <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li th:if="${numberPage>0}"><a th:href="@{'/user/search/' +${keySearch}(page = ${list.number - 1})}">&lt;</a></li>
                <th:block th:each="recruitment,state  : ${recruitmentList}">
                  <li th:class="${numberPage == state.index  ? 'active' : null }"><a th:href="@{'/user/search/' +${keySearch}(page = ${state.index})}" th:text="${state.index + 1}"></a></li>
                </th:block>
                <li th:if="${numberPage<list.totalPages - 1}"><a th:href="@{'/user/search/' +${keySearch}(page = ${list.number + 1})}">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div> --%>
        
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

  }
</script>