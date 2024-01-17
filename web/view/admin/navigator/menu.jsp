<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">${checkActive}</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="#">Home</a></li>
                    <li class="${checkActive == 'Manage product' ? 'active': ''}"><a href="#">Manage product</a></li>
                    <li class="${checkActive == 'Manage Account' ? 'active': ''}"><a href="${pageContext.request.contextPath}/ManagerAccount">Manage account </a></li>
                </ul> </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>