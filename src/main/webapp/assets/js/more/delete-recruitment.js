function deleteRe(id) {
 	let idRe = $("#idRe" + id).val();

 	$.post(contextPath + '/recruiter/delete-recruitment', { idRe: idRe })
 		.done(function (data) {
			if(data.status==="delete"){
				
				document.activeElement.blur();
				$("#deleteModal" + id).modal("hide");
				$("#job-item-" + id).remove(); 
				//show toast notice warning
				showToast("Đã xóa!","Bạn đã xóa bài tuyển dụng","warning");
			}else{
				showToast("Có lỗi rồi!","Vui lòng đăng nhập để đảm bảo tránh sai sót!","error");
			}
 		})
 		.fail(function (err) {
			console.log("Status:", err.status);
			console.log("Status text:", err.statusText);
			console.log("Response text:", err.responseText);
			console.log("Response JSON:", err.responseJSON);
 			alert("Đã có lỗi xảy ra");
 		});
 }