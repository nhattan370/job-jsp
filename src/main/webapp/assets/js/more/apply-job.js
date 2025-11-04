let applyJobs = JSON.parse(localStorage.getItem("apply-job"))||[];

function showSwal(title, status="success", buttons=true){
	swal({
	    title: title,
	    text: 'Redirecting...', 
	    icon: status,
	    timer: 2000,
	    buttons: buttons
	})
}

function apply(id){
     var name = "#idRe" +id;
     var nameModal = "#exampleModal" +id;
     var nameFile = "#fileUpload"+id;
     var nameText = "#text-s" +id;
     var idRe = $(name).val();
     var textvalue = $(nameText).val();
     var fileUpload = $(nameFile).get(0);
     var files = fileUpload.files;
     var formData = new FormData();
     formData.append('file', files[0]);
     formData.append('idRe', idRe);
     formData.append('text', textvalue);
	 console.log(textvalue);
     if(files[0] == null){
		 showSwal('Bạn cần phải chọn cv!', 'error', true);
     } else {
		
         $.ajax(
             {
                 type: 'POST',
                 url: 'user/apply-job/',
                 contentType: false,
                 processData: false,
                 data: formData,
                 success: function (data) {
					console.log(data);
                     if (data.status == "save") {
						 showSwal('Ứng tuyển thành công!', 'success', true);
						 $(nameModal).modal('hide');
						 $('#fileUpload').val("");
						 // Disable nút Apply Job
						 let applyBtn = $("#applyBtn" + id);
						 applyBtn.prop("disabled", true);
						 applyBtn.addClass("btn-disabled");
						 applyBtn.text("Applied");
						 
						 //Save in localStorage
						 applyJobs = !applyJobs.includes(data.key) ? [...applyJobs, data.key] : applyJobs;
						 localStorage.setItem("apply-job",JSON.stringify(applyJobs));
						 
                     } else if (data.status == "already-save") {
						 showSwal('Bạn đã ứng tuyển công việc này!', 'error', true);
                         $(nameModal).modal('hide');
                         $('#fileUpload').val("");
                     } else {
						 showSwal('Bạn cần phải đăng nhập!', 'error', true);
                     }
                 },
                 error: function (err) {
					console.log(err);
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
     var nameText = "#text-f" +id;
     var idRe = $(name).val();
     var textvalue = $(nameText).val();
     var formData = new FormData();
     formData.append('idRe', idRe);
     formData.append('text', textvalue);
     $.ajax(
         {
             type: 'POST',
             url: 'user/apply-job1/',
             contentType: false,
             processData: false,
             data: formData,
             success: function (data) {
                 if(data.status == "save"){
					showSwal('Ứng tuyển thành công!', 'success', true);
					$(nameModal).modal('hide');
					$('#fileUpload').val("");
                 }else if(data.status == "already-save"){
					showSwal('Bạn đã ứng tuyển công việc này!', 'warning', true);
					$(nameModal).modal('hide');
					$('#fileUpload').val("");
                 }else if(data.status=="no_cv"){
					showSwal('Vui lòng cập nhật cv', 'warning', true);
					$(nameModal).modal('hide');
					$('#fileUpload').val("");
				 }else{
					 showSwal('Bạn cần phải đăng nhập!', 'error', true);
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