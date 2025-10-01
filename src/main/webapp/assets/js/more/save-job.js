import showSwal from './swal.js'

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
 
 function save(id){
	let idRe = $("#idRe"+id).val();
	$.post("user/save-job", {idRe:idRe})
		.done(function(data){
			console.log(data);
			if(data == "false"){
			 showSwal('Bạn cần phải đăng nhập!','success',true);
			}else if(data == "true"){
			 showSwal('Lưu thành công!','success',true);
			}else{
			 showSwal('Bạn đã lưu bài này rồi!','error',true);
			}
		})
		.fail(function(err){
			console.error(err);
			alert("Đã có lỗi xảy ra");
		})
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

 