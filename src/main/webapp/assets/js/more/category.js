const INCREMENT = 4;
let categories = JSON.parse(localStorage.getItem("categories"));
let container = document.getElementById("category-container");

if(!categories){
	fetch(`api/categories`)
		.then(res=>res.json())
		.then(data => {
				localStorage.setItem("categories", JSON.stringify(data));
				categories=data;
				renderCategory();
			}
		);	
}else{
	renderCategory();
}

//Show the category 
function renderCategory(){
	let text = '';
	for(let i=0; i<categories.length ; i+=INCREMENT){
		let sliceCat=categories.slice(i, i+INCREMENT);
		text+=`<div class="carousel-item ${ i===0 ? 'active' : ''}">`;
		text+=`<div class="row">`
		sliceCat.forEach(cat => {
			text+=`
			<div class="col-md-3">
			    <ul class="category text-center">
			        <li>
			        	<a style="text-decoration: none !important;" href="/recruitment/category/${cat.id}">
							<p>${cat.name}</p>
			        		<span class="number">${cat.numberChoose}</span> 
			        		<span>Vị trí</span>
			        		<i class="ion-ios-arrow-forward"></i>
			        	</a>
			        </li>
			    </ul>
			</div>
			`
		});
		text+=`</div>`
		text+=`</div>`;
	}
	container.innerHTML = text;
}

/*function getNextCategories(){
	startIndex+=INCREMENT;
	if(startIndex>=categories.length) startIndex=0;
	renderCategory();
}*/





