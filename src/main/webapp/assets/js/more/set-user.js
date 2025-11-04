let loginId = JSON.parse(localStorage.getItem("login-id")) || "";

function getCookie(name){
	const match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
	if (match) return match[2];
	return null;
}

$(document).ready(function(){
	const cookieUser = getCookie("loginId");
	if(loginId!=cookieUser && cookieUser){
		loginId=cookieUser;
		localStorage.setItem("login-id",cookieUser);		
	}
	
	savejobs.forEach((item)=>{
		const [reId, userId] = item.split("_");
		let heartIcon = $("#heartIcon"+reId);
		const iconWrapper = heartIcon.closest(".icon");
		if(loginId==userId){
			heartIcon.addClass("saved");
			iconWrapper.addClass("saved");		
		}
	});
	
	applyJobs.forEach((item)=>{
		const [reId, userId] = item.split("_");
		let applyBtn = $("#applyBtn"+reId);
		if(loginId==userId){
			applyBtn.addClass("btn-disabled");
			applyBtn.text("Applied");
			applyBtn.prop("disabled", true);
		}
	})
})