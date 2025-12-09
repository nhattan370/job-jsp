<%-- <%@ tag description="Email confirmation component" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="comp" tagdir="/WEB-INF/tags" %>   
<%@ tag language="java" body-content="scriptless" %>
<%@ attribute name="id" required="true" %>

<section th:if="${userInformation.status == 1 && userInformation.role.id == 2}" class="site-section" style="margin-top: 10px">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 mb-5">
                <h2 class="mb-4">Thông tin cá nhân</h2>
                <form action="/user/update-profile" method="post" >

                    <div class="row mb-5">
                        <div class="col-lg-12">
                            <div class="p-4 p-md-5 border rounded" method="post">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" th:value="${userInformation.email}" required placeholder="you@yourdomain.com">
                                </div>
                                <div class="form-group">
                                    <label for="job-title">Họ và tên</label>
                                    <input type="text" class="form-control" name="fullName" th:value="${userInformation.fullName}" id="job-title" required placeholder="Full name">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Địa chỉ</label>
                                    <input type="text" name="address" th:value="${userInformation.address != null ? userInformation.address : null}" required class="form-control" id="job-location" placeholder="e.g. New York">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Số điện thoại</label>
                                    <input type="text" name="phoneNumber" th:value="${userInformation.phoneNumber != null ? userInformation.phoneNumber : null}" required class="form-control" id="job-location" placeholder="+ 84">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Mô tả bản thân</label>
                                    <textarea  name="description" th:text="${userInformation.description != null ? userInformation.description : null}" class="form-control" id="editor" placeholder="Mô tả"></textarea>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <input type="submit" value="Lưu thông tin" class="btn px-4 btn-primary text-white">
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </form>
            </div>
            <div class="col-lg-6">
                <h2 class="mb-4">Thông tin công ty</h2>
                <div class="form-group">
                    <label for="company-website-tw d-block1">Cập nhật Logo</label> <br>
                    <label class="btn btn-primary btn-md btn-file">
                        Chọn logo<input type="file" name="file" id="fileUpload2" required hidden>
                    </label>
                    <div id="divLogo">
                        <img id="avatar1" height="100" width="100" style="border-radius: 50px" th:src="${companyInformation.logo != null ? companyInformation.logo : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}">
                    </div>
                </div>
                <form action="/user/update-company" method="post" enctype="multipart/form-data" >

                    <div class="row mb-5">
                        <div class="col-lg-12">
                            <div class="p-4 p-md-5 border rounded" method="post">
                                <div class="form-group">
                                    <label for="email">Email</label>

                                    <input type="text" class="form-control" required id="email1" name="email" th:value="${companyInformation.email != null ? companyInformation.email : null }" placeholder="you@yourdomain.com">
                                </div>
                                <div class="form-group">
                                    <label for="job-title">Tên công ty</label>
                                    <input type="text" class="form-control" name="nameCompany" th:value="${companyInformation.nameCompany != null ? companyInformation.nameCompany : null }" id="job-title"  placeholder="Full name" required>
                                    <input type="hidden" class="form-control" name="user_id" th:value="${companyInformation.user.id != null ? companyInformation.user.id : null}" id="job-title" placeholder="Full name">
                                    <input type="hidden" class="form-control" name="id" th:value="${companyInformation.id !=null ? companyInformation.id : null}" id="job-title" placeholder="Full name">

                                </div>
                                <div class="form-group">
                                    <label for="job-location">Địa chỉ</label>
                                    <input type="text" name="address" th:value="${companyInformation.address != null ? companyInformation.address : null}" required class="form-control" id="job-location" placeholder="e.g. New York">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Số điện thoại công ty</label>
                                    <input type="text" name="phoneNumber" th:value="${companyInformation.phoneNumber != null ? companyInformation.phoneNumber : null}" required class="form-control" id="job-location" placeholder="+ 84">
                                </div>
                                <div class="form-group">
                                    <label for="job-location">Mô tả công ty</label>
                                    <textarea  name="description" th:text="${companyInformation.description != null ? companyInformation.description : null}"  class="form-control" id="editorN" placeholder="Mô tả"></textarea>
                                </div>


                                <div style="margin-left: 0px" id="divImag1" th:if="${companyInformation.logo != null}">
                                    <img id="avatar" height="100" width="100" style="border-radius: 50px;margin-bottom: 15px" th:src="${companyInformation.logo}">
                                </div>
                                <div class="row form-group" >
                                    <div class="col-md-12">
                                        <input type="submit" value="Lưu thông tin" class="btn px-4 btn-primary text-white">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section> --%>