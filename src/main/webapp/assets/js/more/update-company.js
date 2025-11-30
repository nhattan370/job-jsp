   
   $(function () {
          $('#fileUpload2').change(function () {
              if (window.FormData !== undefined) {
                  var fileUpload = $('#fileUpload2').get(0);
                  var files = fileUpload.files;
                  var email = $("#email").val();
                  var formData = new FormData();
                  formData.append('file', files[0]);
                  formData.append('email', email);
                  if(files[0] == null){
                      $(".toast").toast("show");
                  } else {
                      $.ajax(
                          {
                              type: 'POST',
                              url: contextPath +'/user/upload-company/',
                              contentType: false,
                              processData: false,
                              data: formData,
                              success: function (urlImage) {
                                  console.log(urlImage)
                                  if(urlImage == "Error"){
                                      document.getElementById("change").style.backgroundColor = 'red';
                                      swal({
                                          title: 'Cập nhật logo thất bại!',
                                          /* text: 'Redirecting...', */
                                          icon: 'error',
                                          timer: 3000,
                                          buttons: true,
                                          type: 'error'
                                      })
                                      $("#divLogo").css("display","block")
                                  }else{
                                      $('#avatar1').attr('src', urlImage)
                                      swal({
                                          title: 'Cập nhật logo thành công!',
                                          /* text: 'Redirecting...', */
                                          icon: 'success',
                                          timer: 3000,
                                          buttons: true,
                                          type: 'success'
                                      })
                                  }

                              },
                              error: function (err) {
                                  alert(err);
                              }
                          }
                      )
                  }

              }
          })
      })