let loginId =  JSON.parse(localStorage.getItem("login-id")) || "";
let savejobs = JSON.parse(localStorage.getItem("save-job")) || [];
let applyjobs = JSON.parse(localStorage.getItem("apply-job"))||[];
let followCompanies = JSON.parse(localStorage.getItem("follow-company"))||[];

function showLoading() {
    $('#globalLoadingOverlay').css('display', 'flex');
}

function hideLoading() {
    $('#globalLoadingOverlay').hide();
}

function getCookie(name){
	const match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
	if (match) return match[2];
	return null;
}

$(document).ready(function(){
	const cookieUser = getCookie("loginId");
	if(loginId!=cookieUser){
		loginId= cookieUser ? cookieUser : -1;
		localStorage.setItem("login-id",cookieUser);		
	}
	applyjobs.forEach((item)=>{
		const [reId, userId] = item.split("_");
		let applyBtn = $("#applyBtn"+reId);
		if(loginId==userId){
			applyBtn.addClass("btn-disabled");
			applyBtn.text("Applied");
			applyBtn.prop("disabled", true);
		}
	})
	savejobs.forEach((item)=>{
		const [reId, userId] = item.split("_");
		let heartIcon = $("#heartIcon"+reId);
		const iconWrapper = heartIcon.closest(".icon");
		let followText = $("#followText"+reId);
		if(loginId==userId){
			if(heartIcon&&iconWrapper){
				heartIcon.addClass("saved");
				iconWrapper.addClass("saved");		
			}
			if(heartIcon&&followText){
				heartIcon.removeClass("icon-heart-o").addClass("icon-heart heart-followed");
				followText.text("Đã lưu");
			}
		}
	});
	followCompanies.forEach((item)=>{
		const [coId, userId] = item.split("_");
		let heartIcon = $("#heartIcon"+coId);
		let followText = $("#followText"+coId);
		if(loginId==userId){
			heartIcon.removeClass("icon-heart-o").addClass("icon-heart heart-followed");
			followText.text("Đang theo dõi");	
		}		
	});
	
})