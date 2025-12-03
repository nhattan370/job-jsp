   
   $(function () {
          $('#fileUploadLogoCompany').change(function () {
              if (window.FormData !== undefined) {
                  var fileUpload = $('#fileUploadLogoCompany').get(0);
                  var files = fileUpload.files;
                  var formData = new FormData();
                  formData.append('file', files[0]);
                  if(files[0] == null){
                      showToast("Cảnh báo!", "Chưa chọn logo", "warning");
                  }
                  $.ajax(
                      {
                          type: 'POST',
                          url: contextPath +'/recruiter/upload-logo/',
                          contentType: false,
                          processData: false,
                          data: formData,
						  
						  beforeSend: function () {
						  	showLoading();
						  },
						  
                          success: function (data) {
                              console.log(data)
                              if(data.status == "error"){
							  	hideLoading();
								showToast("Cập nhật thất bại!", "Vui lòng thử lại", "error");
								return;
                              }
							  
							  // Preload ảnh mới
	                         var img = new Image();
	                         img.onload = function () {
	                             $('#avatar').attr('src', data.url + '?v=' + new Date().getTime());
	  						     $('#avatar-nav').attr('src', data.url + '?v=' + new Date().getTime());
	                             hideLoading();
	                             showToast("Thành công!", "Cập nhật hoàn thành", "success");
	                         };

	                         img.src = data.url + '?v=' + new Date().getTime();
                          },
                          error: function () {
							hideLoading();
							showToast("Lỗi!", "Không thể upload ảnh", "error");
                          }
                      }
                  )
              }
          })
      })