const alertContainer = document.getElementById("alert-container");
function showToast(message1, message2, type){
	let alertId = "alert-"+Date.now();
	let alertStatus = "";
	if(type==="warning") alertStatus="alert-warning";
	if(type==="error") alertStatus="alert-danger";
	if(type==="success"|| !type) alertStatus="alert-success"; 
	
	alertContainer.innerHTML = 
		`
			<div id=${alertId} class="alert ${alertStatus} alert-dismissible fade show" role="alert">
			  <strong>${message1}</strong>${message2}
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		`
	setTimeout(()=>{
		$("#"+alertId).alert("close");
	},3000);
}