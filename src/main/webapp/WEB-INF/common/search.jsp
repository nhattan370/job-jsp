<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="row">
    <div class="col-md-12 nav-link-wrap">
        <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link ${param.typeSearch==sessionScope.listType[0] || param.typeSearch==null ? 'active' : ''} mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Tìm công việc</a>
            <a class="nav-link ${param.typeSearch==sessionScope.listType[1] ? 'active' : ''}" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Tìm ứng cử viên</a>
            <a class="nav-link ${param.typeSearch==sessionScope.listType[2] ? 'active' : ''}" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Tìm theo địa điểm</a>
        </div>
    </div>
    <div class="col-md-12 tab-wrap">
        <div class="tab-content p-4" id="v-pills-tabContent">
            <div class="tab-pane fade ${param.typeSearch==sessionScope.listType[0] || param.typeSearch==null ? 'show active' : ''}" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
                <form action="${pageContext.request.contextPath}/search/search-job" method="post" class="search-job" onsubmit="handleEmpty(event)">
                    <div class="row no-gutters">
                        <div class="col-md-10 mr-md-2">
                            <div class="form-group">
                                <div class="form-field">
                                    <div class="icon"><span class="icon-map-marker"></span></div>
                                    <input type="text" name="keySearch" class="form-control" placeholder="Tìm kiếm công việc" value="${param.keySearch}">
                                    <input type="hidden" name="typeSearch" class="form-control" value="${sessionScope.listType[0]}"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="form-group">
                                <div class="form-field">
                                    <button type="submit" class="form-control btn btn-primary">Tìm kiếm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="tab-pane fade ${param.typeSearch==sessionScope.listType[1] ? 'show active' : ''}" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab">
                <form action="${pageContext.request.contextPath}/recruiter/search" method="post" class="search-job" onsubmit="handleEmpty(event)">
                    <div class="row no-gutters">
                        <div class="col-md-10 mr-md-2">
                            <div class="form-group">
                                <div class="form-field">
                                    <div class="icon"><span class="icon-map-marker"></span></div>
                                    <input type="text" name="keySearch" class="form-control" placeholder="Tìm kiếm ứng cử viên" value="${param.keySearch}">
                                    <input type="hidden" name="typeSearch" class="form-control" value="${sessionScope.listType[1]}"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="form-group">
                                <div class="form-field">
                                    <button type="submit" class="form-control btn btn-primary">Tìm kiếm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane fade ${param.typeSearch==sessionScope.listType[2] ? 'show active' : ''}" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-performance-tab">
                <form action="${pageContext.request.contextPath}/search/search-job" method="post" class="search-job" onsubmit="handleEmpty(event)">
                    <div class="row no-gutters">
                        <div class="col-md-10 mr-md-2">
                            <div class="form-group">
                                <div class="form-field">
                                    <div class="icon"><span class="icon-map-marker"></span></div>
                                    <input type="text" name="keySearch" class="form-control" placeholder="Tìm kiếm theo địa điểm" value="${param.keySearch}">
                                    <input type="hidden" name="typeSearch" class="form-control" value="${sessionScope.listType[2]}"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="form-group">
                                <div class="form-field">
                                    <button type="submit" class="form-control btn btn-primary">Tìm kiếm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>