$(function () {
    $('#cvInput').change(function () {
        if (window.FormData !== undefined) {
            var fileUpload = $('#cvInput').get(0);
            var files = fileUpload.files;

            if (files[0] == null) {
                showToast("Cảnh báo!", "Chưa chọn CV", "warning");
                return;
            }

            var formData = new FormData();
            formData.append('file', files[0]);

            $.ajax({
                type: 'POST',
                url: contextPath + '/user/upload-cv/',
                contentType: false,
                processData: false,
                data: formData,

                beforeSend: function () {
                    showLoading();
                },

                success: function (data) {
                    hideLoading();
                    if (data.status === "error") {
                        showToast("Cập nhật thất bại!", "Vui lòng thử lại", "error");
                        return;
                    }
					$("#btnViewCv").attr("href",data.url)
								   .removeClass("disabled")
					               .removeAttr("tabindex")
					               .removeAttr("aria-disabled");
					showToast("Thành công!", "CV đã được upload", "success");
					$('#cvInput').val('');			   
                },

                error: function () {
                    hideLoading();
                    showToast("Lỗi!", "Không thể upload cv", "error");
                }
            });
        }
    });
});
