
function deleteSaveJob(id) {
 	let idSa = $("#idSa" + id).val();

 	$.post(contextPath + '/user/delete-save-job', { idSa: idSa })
 		.done(function (data) {
			if(data.status==="delete"){
				//delete from localStorage
				savejobs = savejobs.filter(items => items != data.key);
				localStorage.setItem("save-job", JSON.stringify(savejobs));
				
				document.activeElement.blur();
				$("#deleteModal" + id).modal("hide");
				$("#job-item-" + id).remove(); 
				//show toast notice warning
				showToast("Đã bỏ lưu!","Công việc đã được gỡ khỏi danh sách lưu.","warning");
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