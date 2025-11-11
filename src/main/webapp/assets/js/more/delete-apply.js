function deleteApply(id) {
 	let idApply = $("#idApply" + id).val();

 	$.post(contextPath + '/user/delete-apply-job', { idApply: idApply })
 		.done(function (data) {
			if(data.status==="delete"){
				//delete from localStorage
				applyjobs = applyjobs.filter(items => items != data.key);
				localStorage.setItem("apply-job", JSON.stringify(applyjobs));
				
				document.activeElement.blur();
				$("#deleteModal" + id).modal("hide");
				$("#job-item-" + id).remove(); 
				//show toast notice warning
				showToast("Đã hủy!","Bạn đã hủy công việc ứng tuyển.","warning");
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