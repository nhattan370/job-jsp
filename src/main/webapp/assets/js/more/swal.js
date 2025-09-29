function showSwal(title, status='success', buttons=true){
	swal({
	    title: title,
	    text: 'Redirecting...', 
	    icon: status,
	    timer: 2000,
	    buttons: buttons,
	    type: status
	})
}

function renderSwal(title, status='success', buttons=true){
	
}