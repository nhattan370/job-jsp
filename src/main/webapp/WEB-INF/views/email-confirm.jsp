<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/common/head.jsp" %>
</head>
<body>
  	<c:if test="${not empty mes}">
	    <script type="text/javascript">
	        swal({
	            title: "${mes}",
	            text: "Redirecting...", 
	            icon: "${status}",
	            timer: 2000,
	            buttons: true
	        });
	    </script>
	</c:if>
	<sec:authorize access="hasAuthority('RECRUITER_PENDING')">
	hello
		<div class="container-fluid" style="text-align: center">
		    <c:if test="${sessionScope.comfirm_await=='unsuccessful'}">
			    <p style="font-size: 20px; font-weight: bold; color: #333; margin-top: 10px">
			        Xác thực email đăng nhập
			    </p>
			    <div style="width: 600px; height: 400px; border-radius: 5px;
			    box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto; padding: 15px;">
			
			        <p style="line-height: 35px; font-size: 16px">
			            Xin chào, 
			            <span style="font-weight: bold; color:#333;">
			                ${userInformation.fullName}
			            </span>.
			            Vui lòng kiểm tra email để xác thực tài khoản.
			            <br>
			            Trường hợp 
			            <span style="font-weight: bold; color: #e74c3c;">không nhận được email</span>,
			            bạn vui lòng bấm nút 
			            <span style="font-weight: bold; color: #5f80ec;">“Nhận email xác thực”</span> dưới đây.
			        </p>
			
			        <div class="row form-group">
			            <form action="${COMFIRM_ACCOUNT}" method="post" class="col-md-12">
			                <input type="hidden" name="email" value="${userInformation.email}">
			                <input type="submit" value="Nhận email xác thực"
			                       class="btn px-4 btn-primary text-white"
			                       style="font-weight: bold;">
			            </form>
			        </div>
			        
			        <p style="margin-top: 15px;">
			            Mọi thắc mắc vui lòng liên hệ bộ phận 
			            <span style="font-weight: bold; color:#333;">CSKH của WorkCV</span>:
			        </p>
			
			        <p>
			            - Điện thoại:
			            <span style="color:#5f80ec; font-weight: bold;">(024) 6680 5588</span><br>
			            - Email:
			            <a href="https://mail.google.com/" style="color:#5f80ec; font-weight: bold;">hotro@workcv.vn</a>
			        </p>
			    </div>
		    </c:if>
		    <c:if test="${sessionScope.comfirm_await=='sending'}">
		        <div style="width: 600px; height: 400px; border-radius: 5px;
		        box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto; padding: 15px;">
		
		            <p style="line-height: 35px; font-size: 16px">
		                Xin chào,
		                <span style="font-weight: bold; color:#333;">
		                    ${userInformation.fullName}
		                </span>.
		                <br>
		                Bạn đã 
		                <span style="font-weight: bold; color:#27ae60;">gửi yêu cầu xác thực thành công</span>.
		                <br>
		                Vui lòng kiểm tra mail để hoàn tất xác thực.
		                <br>Cảm ơn bạn!!!
		            </p>
		            
					<p style="text-align:center; margin-top:30px;">
			            <a href="https://mail.google.com/" target="_blank"
			               style="display:inline-block; padding:10px 20px; background-color:#5f80ec;
			                      color:white; text-decoration:none; border-radius:5px; font-weight:bold;">
			                Mở Gmail
			            </a>
			        </p>
			        
		            <p style="margin-top: 15px;">
		                Mọi thắc mắc vui lòng liên hệ bộ phận 
		                <span style="font-weight: bold; color:#333;">CSKH của WorkCV</span>:
		            </p>
		
		            <p>
		                - Điện thoại:
		                <span style="color:#5f80ec; font-weight: bold;">(024) 6680 5588</span><br>
		                - Email:
		                <a href="https://mail.google.com/" style="color:#5f80ec; font-weight: bold;">hotro@workcv.vn</a>
		            </p>
		        </div>
		    </c:if>
		</div>
	</sec:authorize>
	
    <sec:authorize access="hasAuthority('RECRUITER')">
   	<div style="width: 600px; height: 400px; border-radius: 5px;
       box-shadow: rgba(0, 0, 0, 0.4) 0px 0px 10px; margin: 20px auto; padding: 15px;">

           <p style="line-height: 35px; font-size: 16px">
               Xin chào,
               <span style="font-weight: bold; color:#333;">
                   ${userInformation.fullName}
               </span>.
               <br>
               Bạn đã 
               <span style="font-weight: bold; color:#27ae60;">xác thực thành công</span>.
               <br>Hãy đến <span style="font-weight: bold">trang chủ</span> và trải nghiệm dịch vụ thôi nào
               <br>Cảm ơn bạn!!!
           </p>
           
           <p style="text-align:center; margin-top:30px;">
            <a href="${pageContext.request.contextPath}"
               style="display:inline-block; padding:10px 20px; background-color:#27ae60;
                      color:white; text-decoration:none; border-radius:5px; font-weight:bold;">
                Mở trang chủ
            </a>
        </p>

           <p style="margin-top: 15px;">
               Mọi thắc mắc vui lòng liên hệ bộ phận 
               <span style="font-weight: bold; color:#333;">CSKH của WorkCV</span>:
           </p>

           <p>
               - Điện thoại:
               <span style="color:#5f80ec; font-weight: bold;">(024) 6680 5588</span><br>
               - Email:
               <a style="color:#5f80ec; font-weight: bold;">hotro@workcv.vn</a>
           </p>
       </div>
   </sec:authorize>
<!-- start footer -->
<%@ include file="/WEB-INF/common/footer.jsp" %>
<!-- end footer -->
</body>
</html>