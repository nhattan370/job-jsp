<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
                      <div class="col-md-12" style="box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px;margin: 20px auto;">
                          <div class="team d-md-flex p-4 bg-white">
                              <IMG class="img" src="${applyPost.user.image != null ? applyPost.user.image : 'https://st.quantrimang.com/photos/image/072015/22/avatar.jpg'}"></IMG>
                              <div class="text pl-md-4">
                                  <h5 class="location mb-0">${applyPost.user.fullName}</h5>
                                  <p style="display: block;color: black">${applyPost.user.address}</p>
                                  <span class="position" style="display: block;color: black">${applyPost.user.email}</span>
                                  <p class="mb-4" style="width: 700px">${applyPost.user.description}.</p>
                                  <div class="row">
                                  	<c:if test="${applyPost.nameCv != null}">
                                      	<p><a href="${applyPost.nameCv}" target="_blank" class="btn btn-primary">Xem cv</a></p>			                                    	
                                  	</c:if>
                                      <c:if test="${applyPost.status.name() == 'PENDING'}">
                                       	<p style="margin-left: 10px"><a class="btn btn-outline-primary" href="${param.HANDLE_CV}${applyPost.id}" >Duyệt</a></p>
                                      </c:if>
                                      <c:if test="${applyPost.status.name() == 'VIEWED'}">
                                      	<p style="margin-left: 10px"><a class="btn btn-outline-success" href="${param.HANDLE_CV}${applyPost.id}" >Đã xem</a></p>
                                  	</c:if>
                                  	<c:if test="${applyPost.status.name() == 'SUITABLE'}">
                                  		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #1e7e34;font-weight: bold" >Đã duyệt</span></p>
                                  	</c:if>
                                  	<c:if test="${applyPost.status.name() == 'UNSUITABLE'}">
                                  		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #dc3545;font-weight: bold" >Đã xem</span></p>
                                  	</c:if>
                                  	<c:if test="${applyPost.status.name() == 'WITHDRAWN'}">
                                  		<p style="margin-left: 10px;margin-top: 15px"><span style="color: #fd7e14;font-weight: bold" >Ứng viên rút đơn</span></p>
                                  	</c:if>
                                  </div>
                              </div>
                          </div>
                      </div>