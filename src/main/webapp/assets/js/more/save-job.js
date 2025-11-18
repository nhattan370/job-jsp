 function save(id) {
 	let idRe = $("#idRe" + id).val();
	let heartIcon = $("#heartIcon"+id);
	const iconWrapper = heartIcon.closest(".icon");
	
	let followText = $("#followText"+id);

 	$.get(contextPath + '/user/save-job', { idRe: idRe })
 		.done(function (data) {
			if(data.status==="save"){
				//Show change icon
				if(heartIcon&&iconWrapper){
					heartIcon.addClass("saved");
					iconWrapper.addClass("saved");				
				}
				if(heartIcon&&followText){
					heartIcon.removeClass("icon-heart-o").addClass("icon-heart heart-followed");
					followText.text("Đã lưu");
				}
				
				//Save icon localStorage
				savejobs = !savejobs.includes(data.key) ? [...savejobs, data.key] : savejobs;
				localStorage.setItem("save-job", JSON.stringify(savejobs));
				
				//show toast notice success
				showToast("Thành công!","Lưu công việc thành công!","success");
			}else if(data.status==="delete"){
				//Show change icon
				if(heartIcon&&iconWrapper){
					heartIcon.removeClass("saved");
					iconWrapper.removeClass("saved");
				}
				if(heartIcon&&followText){
					heartIcon.removeClass("icon-heart heart-followed").addClass("icon-heart-o");
					followText.text("Lưu");
				}
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
