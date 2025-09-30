import showSwal from './swal.js'

function save(id){
     var name = "#idRe" +id;
     var idRe = $(name).val();
     var formData = new FormData();
     formData.append('idRe', idRe);
     $.ajax(
         {
             type: 'POST',
             url: '/save-job/save/',
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

 function apply(id){
     var name = "#idRe" +id;
     var nameModal = "#exampleModal" +id;
     var nameFile = "#fileUpload"+id;
     var nameText = "#text" +id;
     var idRe = $(name).val();
     var textvalue = $(nameText).val();
     var fileUpload = $(nameFile).get(0);
     var files = fileUpload.files;
     var formData = new FormData();
     formData.append('file', files[0]);
     formData.append('idRe', idRe);
     formData.append('text', textvalue);
     if(files[0] == null){
		 showSwal('Bạn cần phải chọn cv!', 'error', true);
     } else {
         $.ajax(
             {
                 type: 'POST',
                 url: '/user/apply-job/',
                 contentType: false,
                 processData: false,
                 data: formData,
                 success: function (data) {
                     if (data == "false") {
						 showSwal('Bạn cần phải đăng nhập!', 'error', true);
                     } else if (data == "true") {
						 showSwal('Ứng tuyển thành công!', 'success', true);
                         $(nameModal).modal('hide');
                         $('#fileUpload').val("");
                     } else {
						 showSwal('Bạn đã ứng tuyển công việc này!', 'error', true);
                         $(nameModal).modal('hide');
                         $('#fileUpload').val("");
                     }
                 },
                 error: function (err) {
                     alert(err);
                 }
             }
         )
     }

 }
 
 function apply1(id){
     var name = "#idRe" +id;
     var nameModal = "#exampleModal" +id;
     var nameFile = "#fileUpload"+id;
     var nameText = "#text" +id;
     var idRe = $(name).val();
     var textvalue = $(nameText).val();
     var formData = new FormData();
     formData.append('idRe', idRe);
     formData.append('text', textvalue);
     $.ajax(
         {
             type: 'POST',
             url: '/user/apply-job1/',
             contentType: false,
             processData: false,
             data: formData,
             success: function (data) {
                 if(data == "false"){
					 showSwal('Bạn cần phải đăng nhập!', 'error', true);
                 }else if(data == "true"){
                     swal({
                         title: 'Ứng tuyển thành công!',
                         /* text: 'Redirecting...', */
                         icon: 'success',
                         timer: 3000,
                         buttons: true,
                         type: 'success'
                     })
					 showSwal('Ứng tuyển thành công!', 'success', true);
                     $(nameModal).modal('hide');
                     $('#fileUpload').val("");
                 }else{
					 showSwal('Bạn đã ứng tuyển công việc này!', 'error', true);
                     $(nameModal).modal('hide');
                     $('#fileUpload').val("");
                 }
             },
             error: function (err) {
                 alert(err);
             }
         }
     )
 }