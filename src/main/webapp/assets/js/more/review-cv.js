function updateStatus(idApply, status) {
	console.log(idApply);
	console.log(status);
    $.ajax({
        url: contextPath +'/recruiter/handle-cv',
        type: 'POST',
        data: {idApply:idApply, status: status },
        success: function (res) {

            // Ẩn button
            $("#suitableBtn" + idApply).hide();
            $("#unsuitableBtn" + idApply).hide();

            // Hiện text theo status
            if (status === 'SUITABLE') {
                $("#suitableText" + idApply).show();
				showToast("Phù hợp! ","Ứng viên phù hợp với công ty!","success");
            } else if (status === 'UNSUITABLE') {
                $("#unsuitableText" + idApply).show();
				showToast("Không phù hợp! ","Ứng viên không phù hợp với công ty.","warning");
            }
			setTimeout(function(){
				location.reload();
			},1000)
        },
        error: function (e) {
			console.log(e);
            alert("Lỗi cập nhật trạng thái!");
        }
    });
}

function viewCv(idApply) {
	console.log(idApply);
    $.ajax({
        url: contextPath + "/recruiter/view-cv",
        type: "POST",
        data: { id: idApply },
        success: function (cvLink) {
			console.log(cvLink);
            window.open(cvLink, "_blank");
            
            location.reload();
        },
        error: function () {
            alert("Lỗi khi xử lý xem CV!");
        }
    });
}

