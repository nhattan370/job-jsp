
/*function showToast(message1, message2, type){
	let alertId = "alert-"+Date.now();
	
	let alertStatus = "";
	if(type==="warning") alertStatus="alert-warning";
	if(type==="error") alertStatus="alert-danger";
	if(type==="success"|| !type) alertStatus="alert-success"; 
	
	alertContainer.innerHTML = 
		`
			<div id=${alertId} class="alert ${alertStatus} alert-dismissible fade show" role="alert">
			  <strong>${message1}</strong>${message2}
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		`
	setTimeout(()=>{
		$("#"+alertId).alert("close");
	},3000);
}*/
 
function save(id) {
 	let idRe = $("#idRe" + id).val();
	let heartIcon = $("#heartIcon"+id);
	const iconWrapper = heartIcon.closest(".icon");

 	$.get(contextPath + '/user/save-job', { idRe: idRe })
 		.done(function (data) {
			if(data.status==="save"){
				//Show change icon
				heartIcon.addClass("saved");
				iconWrapper.addClass("saved");
				
				//Save icon localStorage
				savejobs = !savejobs.includes(data.key) ? [...savejobs, data.key] : savejobs;
				localStorage.setItem("save-job", JSON.stringify(savejobs));
				
				//show toast notice success
				showToast("Thành công!","Lưu công việc thành công!","success");
			}else if(data.status==="delete"){
				//Show change icon
				heartIcon.removeClass("saved");
				iconWrapper.removeClass("saved");
				
				//delete from localStorage
				savejobs = savejobs.filter(items => items != data.key);
				localStorage.setItem("save-job", JSON.stringify(savejobs));
				
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


 