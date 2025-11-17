
function deleteFollowCompany(id) {
 	let idFc = $("#idFc" + id).val();

 	$.post(contextPath + '/user/delete-follow-company', { idFc: idFc })
 		.done(function (data) {
			if(data.status==="delete"){
				//delete from localStorage
				followCompanies = followCompanies.filter(items => items != data.key);
				localStorage.setItem("follow-company", JSON.stringify(followCompanies));
				
				document.activeElement.blur();
				$("#deleteModal" + id).modal("hide");
				$("#job-item-" + id).remove(); 
				//show toast notice warning
				showToast("Đã bỏ theo dõi!","Công ty đã được gỡ khỏi danh sách theo dõi.","warning");
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