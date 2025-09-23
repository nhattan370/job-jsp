<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <nav class="navbar navbar-expand-lg">
        <div class="container-fluid px-md-4	">
          <a class="navbar-brand" href="/">Work CV</a>
      
          <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active"><a href="/" class="nav-link">Trang chủ</a></li>
              <li class="'nav-item"><a href="/" class="nav-link">Công việc</a></li>
              <li class="nav-item"><a href="/" class="nav-link">Ứng cử viên</a></li>
                <ul class="dropdown">
                  <li><a href="/">Hồ Sơ</a></li>
                  <li ><a href="/save-job/get-list" >Công việc đã lưu</a></li>
                  <li ><a href="/user/list-post" >Danh sách bài đăng</a></li>
                  <li ><a href="/user/get-list-apply" >Công việc đã ứng tuyển</a></li>
                  <li ><a href="/user/get-list-company" >Công ty đã theo dõi</a></li>
                  <li><a href="/auth/logout" >Đăng xuất</a></li>
                </ul>
                <li></li>
                <li class="nav-item cta mr-md-1"><a href="/recruitment/post" class="nav-link">Đăng tuyển</a></li>
              <li class="nav-item cta cta-colored"><a href="/auth/login" class="nav-link">Đăng nhập</a></li>
            </ul>
          </div>
        </div>
      </nav>