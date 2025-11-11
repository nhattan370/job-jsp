let loginId = JSON.parse(localStorage.getItem("login-id")) || "";
let savejobs = JSON.parse(localStorage.getItem("save-job")) || [];
let applyjobs = JSON.parse(localStorage.getItem("apply-job"))||[];

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
		console.log(userId)
		let heartIcon = $("#heartIcon"+reId);
		const iconWrapper = heartIcon.closest(".icon");
		if(loginId==userId){
			heartIcon.addClass("saved");
			iconWrapper.addClass("saved");		
		}
	});
	
})