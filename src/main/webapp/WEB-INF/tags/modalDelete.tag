<%@ tag description="Reusable confirm modal"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="id" required="true" %>
<%@ attribute name="title" required="false" %>
<%@ attribute name="nameCompany" required="false" %>
<%@ attribute name="idHidden" required="true" %>
<%@ attribute name="onConfirm" required="true" %>

<div class="modal fade" id="deleteModal${id}" role="dialog" aria-labelledby="deleteModalLabel${id}" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content border-0 shadow">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="deleteModalLabel${id}">Xác nhận xóa</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
            </div>
			<form>
	            <div class="modal-body">
	            	<c:if test="${idHidden=='idSa'}">
	                	<p>Bạn có chắc chắn muốn <strong>bỏ lưu</strong> công việc
	                	<span class="text-primary font-weight-bold">${title}</span> không?</p>
	            	</c:if>
	                <c:if test="${idHidden=='idFc'}">
	                	<p>Bạn có chắc chắn muốn <strong>bỏ theo dõi</strong> công ty
						<span class="text-primary font-weight-bold">${nameCompany}</span> không?</p>
	                </c:if>
					<c:if test="${idHidden=='idApply'}">
						<p>Bạn có chắc chắn muốn <strong>hủy bỏ ứng tuyển</strong> công việc
						<span class="text-primary font-weight-bold">${title}</span> không?</p>
						<p> <strong>!!!Lưu ý: </strong>Nếu hủy bỏ ứng tuyển thì bạn sẽ <span class="text-danger font-weight-bold">không thể ứng tuyển công việc này được nữa</span> </p>
					</c:if>
	            </div>
					 <input type="hidden" id="${idHidden}${id}" value="${id}"/>
	
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
	                <button type="button" class="btn btn-danger" onclick="${onConfirm}">Đồng ý</button>
	            </div>
	        </form>
        </div>
    </div>
</div>
