<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-right">
                <c:if test="${sessionScope.acc != null}">
                    <li><a href="${pageContext.request.contextPath}/logoutcontroller">Log out</a></li>
                    <li><a href="${pageContext.request.contextPath}/view/user/profile.jsp"><i class="fa fa-user-o"></i> My Account - ${sessionScope.acc.getFullName()}</a></li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li><a href="${pageContext.request.contextPath}/view/common/login.jsp"><i class="fa fa-user-o"></i> Log in</a></li>
                </c:if>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="${pageContext.request.contextPath}/home" class="logo">
                            <img style="width: 250px" src="${pageContext.request.contextPath}/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select class="input-select">
                                <option value="0">Danh mục</option>
                                <c:forEach items="${catelist}" var="c">
                                    <option value="${c.getCategory_id()}">${c.getCategory_name()}</option>
                                </c:forEach>
                            </select>
                            <input class="input" placeholder="Search here">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Cart -->
                        <div >
                            <a href="${pageContext.request.contextPath}/cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <div class="qty">3</div>
                            </a>
                        </div>
                        <!-- MyOrder -->
                        <div>
                            <a href="${pageContext.request.contextPath}/myOrder">
                                <i class="fa fa-list-alt"></i>
                                <span>Your Orders</span>
                                <div class="qty">4</div>
                            </a>
                        </div>
                        <!-- /MyOrder -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>