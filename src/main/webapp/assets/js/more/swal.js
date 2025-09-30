function showSwal(title, status="success", buttons=true){
	swal({
	    title: title,
	    text: 'Redirecting...', 
	    icon: status,
	    timer: 2000,
	    buttons: buttons
	})
}

function handleEmpty(event){
	if(event.target.querySelector("input[name=keySearch]").value.trim()===""){
		showSwal("Vui lòng nhập giá trị", "warning");
		event.preventDefault();
	}
}

export default showSwal;