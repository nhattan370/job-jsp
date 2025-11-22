<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless" %>
<%@ attribute name="id" required="true" %>

<div class="col-md-12">
    <div class="job-post-item p-4 d-block d-lg-flex align-items-center" id="job-item-${id}">
        <jsp:doBody />
    </div>
</div>
