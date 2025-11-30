<%@ tag language="java" body-content="scriptless" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="attr" required="true" %>
<a data-toggle="modal" data-target="#exampleModal${id}" class="btn btn-primary ${attr}" id="applyBtn${id}">Apply Job</a>