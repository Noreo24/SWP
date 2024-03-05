<div id="breadcrumb" class="section" style="padding-bottom: 10px; padding-top: 10px; position: sticky; top: 110px; z-index: 100;">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">${checkActive}</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="Home">Home</a></li>
                    <li class="${checkActive == 'Manage product' ? 'active': ''}"><a href="${pageContext.request.contextPath}/manageProduct">Manage Product</a></li>
                    <li class="${checkActive == 'Manage Account' ? 'active': ''}"><a href="${pageContext.request.contextPath}/ManagerAccount">Manage Account </a></li>
                    <li class="${checkActive == 'Manage Brand' ? 'active': ''}"><a href="${pageContext.request.contextPath}/ManagerBrand">Manage Brand </a></li>
                </ul> 
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>