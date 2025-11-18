
function follow(){
           let idCompany = $("#idCompany").val();
		   let heartIcon = $("#heartIcon"+idCompany);
		   let followText = $("#followText"+idCompany);
           let formData = new FormData();
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
						
						followCompanies = !followCompanies.includes(data.key) ? [...followCompanies, data.key] : followCompanies;
						localStorage.setItem("follow-company", JSON.stringify(followCompanies));
						
						showToast("Thành công!","Lưu công ty thành công!","success");
						
						heartIcon.removeClass("icon-heart-o").addClass("icon-heart heart-followed");
						followText.text("Đang theo dõi");
                       }else if(data.status == "unfollow"){
						
						followCompanies = followCompanies.filter(items => items != data.key);
						localStorage.setItem("follow-company", JSON.stringify(followCompanies));
						
						showToast("Đã bỏ lưu!","Công ty đã được gỡ khỏi danh sách lưu.","warning");
						
						heartIcon.removeClass("icon-heart heart-followed").addClass("icon-heart-o");
						followText.text("Theo dõi");
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