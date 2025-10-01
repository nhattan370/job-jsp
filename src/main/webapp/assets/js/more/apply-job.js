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