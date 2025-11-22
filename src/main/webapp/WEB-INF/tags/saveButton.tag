<%@ tag language="java" body-content="scriptless" %>
<%@ attribute name="id" required="true" %>
<a onclick="save(${id})" class="text-center d-flex justify-content-center align-items-center icon mr-2">
	<span id="heartIcon${id}" class="icon-heart"></span>
</a>