<%-- 
    Document   : common-menu
    Created on : Jun 6, 2017, 1:40:24 PM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- header start -->
<!-- classes:  -->
<!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
<!-- "dark": dark version of header e.g. class="header dark clearfix" -->
<!-- "full-width": mandatory class for the full-width menu layout -->
<!-- "centered": mandatory class for the centered logo layout -->
<!-- ================ --> 
<header class="header  fixed   dark clearfix">

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <!-- header-left start -->
                <!-- ================ -->
                <div class="header-left clearfix">
                    <!-- logo -->
                    <div id="logo" class="logo">
                        <a href="#logo">
                            <img id="logo_img" src="<c:url value="/resources/images/logo.png"/>" alt="Super Logic">
                        </a>
                    </div>
                    <!-- name-and-slogan -->
                    <div class="site-slogan">

                    </div>									
                </div>
                <!-- header-left end -->
            </div>
            <div class="col-md-8">

                <!-- header-right start -->
                <!-- ================ -->
                <div class="header-right clearfix">

                    <!-- main-navigation start -->
                    <!-- classes: -->
                    <!-- "onclick": Makes the dropdowns open on click, this the default bootstrap behavior e.g. class="main-navigation onclick" -->
                    <!-- "animated": Enables animations on dropdowns opening e.g. class="main-navigation animated" -->
                    <!-- "with-dropdown-buttons": Mandatory class that adds extra space, to the main navigation, for the search and cart dropdowns -->
                    <!-- ================ -->
                    <div class="main-navigation  animated with-dropdown-buttons">

                        <!-- navbar start -->
                        <!-- ================ -->
                        <nav class="navbar navbar-default" role="navigation">
                            <div class="container-fluid">

                                <!-- Toggle get grouped for better mobile display -->
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>

                                </div>

                                <!-- Collect the nav links, forms, and other content for toggling -->
                                <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                    <!-- main-menu -->
                                    <ul class="nav navbar-nav ">
                                        <li>
                                            <a href="<c:url value="/index"/>" >Início</a>
                                        </li>
                                        <li>
                                            <a href="<c:url value="/public/about"/>" >Sobre</a>                                                            
                                        </li>
                                        <li >
                                            <a href="<c:url value="/public/news"/>" >Publicações</a>
                                        </li>
                                    </ul>
                                    <!-- main-menu end -->

                                    <!-- header buttons -->
                                    <div class="header-dropdown-buttons">
                                        <!--Join Us-->
                                        <a href="<c:url value="/public/joinUs"/>" class="btn btn-sm hidden-xs btn-primary">Junte-se a Nós <i class="fa icon-users pl-5"></i></a>
                                        <a href="<c:url value="/public/joinUs"/>" class="btn btn-lg visible-xs btn-block btn-primary">Junte-se a Nós<i class="fa icon-users pl-5"></i></a>
                                        <!--Sign In-->
                                        <a href="<c:url value="/home/start"/>" class="btn btn-sm hidden-xs btn-success">Acessar<i class="fa icon-forward pl-5"></i></a>
                                        <a href="<c:url value="/home/start"/>" class="btn btn-lg visible-xs btn-block btn-success">Acessar<i class="fa icon-forward pl-5"></i></a>
                                    </div>
                                    <!-- header buttons end-->

                                </div>

                            </div>
                        </nav>
                        <!-- navbar end -->

                    </div>
                    <!-- main-navigation end -->
                </div>
                <!-- header-right end -->

            </div>
        </div>
    </div>

</header>
<!-- header end -->
