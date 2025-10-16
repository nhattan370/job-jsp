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
})