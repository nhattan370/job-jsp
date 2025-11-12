
function follow(){
           var name = "#idCompany";
           var idCompany = $(name).val();
           var formData = new FormData();
           formData.append('idCompany', idCompany);
           $.ajax(
               {
                   type: 'POST',
                   url: contextPath +'/user/follow-company/',
                   contentType: false,
                   processData: false,
                   data: formData,
                   success: function (data) {
                       if(data.status == "follow"){
						
						//Sửa trái tim
						//Sửa bên set-user cái trái tim luôn
						
						followCompany = !followCompany.includes(data.key) ? [...followCompany, data.key] : followCompany;
						localStorage.setItem("follow-company", JSON.stringify(followCompany));
						
						showToast("Thành công!","Lưu công việc thành công!","success");
                       }else if(data.status == "unfollow"){
						
						followCompany = followCompany.filter(items => items != data.key);
						localStorage.setItem("follow-company", JSON.stringify(followCompany));
						
						showToast("Đã bỏ lưu!","Công ty đã được gỡ khỏi danh sách lưu.","warning");
                       }else{
						showToast("Có lỗi rồi!","Vui lòng đăng nhập để đảm bảo tránh sai sót!","error");
                       }
                   },
                   error: function (err) {
                       alert(err);
                   }
               }
           )
       }