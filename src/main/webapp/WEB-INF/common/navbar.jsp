<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-dark sticky-top">
  <div class="container-fluid px-md-4 d-flex justify-content-between">
  
    <div><a class="navbar-brand" href="">Work CV</a></div>

    <div class="navbar-nav d-flex align-items-center" id="navbarNav">
      <ul class="navbar-nav ms-auto d-flex align-items-center">

        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Trang chủ</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="/">Công việc</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="/">Ứng cử viên</a>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
            aria-expanded="false">
            Hồ sơ
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/">Hồ Sơ</a></li>
            <li><a class="dropdown-item" href="/save-job/get-list">Công việc đã lưu</a></li>
            <li><a class="dropdown-item" href="/user/list-post">Danh sách bài đăng</a></li>
            <li><a class="dropdown-item" href="/user/get-list-apply">Công việc đã ứng tuyển</a></li>
            <li><a class="dropdown-item" href="/user/get-list-company">Công ty đã theo dõi</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/auth/logout">Đăng xuất</a></li>
          </ul>
        </li>

        <li class="nav-item">
          <a class="nav-link btn btn-outline-primary me-2" href="/recruitment/post">Đăng tuyển</a>
        </li>

        <li class="nav-item">
          <a class="nav-link btn btn-primary text-white" href="/auth/login">Đăng nhập</a>
        </li>

      </ul>
    </div>
  </div>
</nav>