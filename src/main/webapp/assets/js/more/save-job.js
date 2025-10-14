let alertContainer = document.getElementById("alert-container");
/*function save(id){
     var name = "#idRe" +id;
     var idRe = $(name).val();
     var formData = new FormData();
     formData.append('idRe', idRe);
     $.ajax(
         {
             type: 'POST',
             url: 'user/save-job',
             contentType: false,
             processData: false,
             data: formData,
             success: function (data) {
                 console.log(data);
                 if(data == "false"){
					 showSwal('Bạn cần phải đăng nhập!','success',true);
                 }else if(data == "true"){
					 showSwal('Lưu thành công!','success',true);
                 }else{
					 showSwal('Bạn đã lưu bài này rồi!','error',true);
                 }
             },
             error: function (err) {
                 alert(err);
             }
         }
     )
 }*/
 
/* function showToast(){
	<div id="alertBox" class="alert alert-success alert-dismissible fade show" role="alert">
	  <strong>Thành công!</strong> Lưu công việc thành công!
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
	  <strong>Đã bỏ lưu!</strong> Công việc đã được gỡ khỏi danh sách lưu.
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
 }*/
 
 function showToast(message1, message2, type){
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
 }
 
 function save(id) {
 	let idRe = $("#idRe" + id).val();

 	$.get("user/save-job", { idRe: idRe })
 		.done(function (data) {
 			console.log(data);
			if(data.status==="save"){
				showToast("Thành công!","Lưu công việc thành công!","success");
			}else if(data.status==="delete"){
				showToast("Đã bỏ lưu!","Công việc đã được gỡ khỏi danh sách lưu.","warning");
			}else{
				showToast("Không ổn rồi!","Không thể thực hiện được thao tác gì!","error");
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


 function choosed(id){
     var name = '#choose' + id;
     var name1 = 'loai1' + id;
     var name2 = 'loai2' + id;
     var button1 = 'button1' + id;
     var button2 = 'button2' + id;
     var giaitri = $(name).val();
     if(giaitri == 1){
         document.getElementById(name1).style.display = 'block'
         document.getElementById(name2).style.display = 'none'
         document.getElementById(button1).style.display = 'block'
         document.getElementById(button2).style.display = 'none'
     }else{
         document.getElementById(name2).style.display = 'block'
         document.getElementById(name1).style.display = 'none'
         document.getElementById(button2).style.display = 'block'
         document.getElementById(button1).style.display = 'none'
     }
 }

 