<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <c:import url="/WEB-INF/views/shared/csrf.jsp" />
        <title>Song Community Factory | Projetos </title>
        <c:import url="/WEB-INF/views/shared/common-header.jsp" /> 
        <!-- Custom css --> 
        <link href="<c:url value="/resources/css/project.css"/>" rel="stylesheet">

    </head>

    <!-- body classes:  -->
    <!-- "boxed": boxed layout mode e.g. <body class="boxed"> -->
    <!-- "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> -->
    <!-- "transparent-header": makes the header transparent and pulls the banner to top -->
    <!-- "gradient-background-header": applies gradient background to header -->
    <!-- "page-loader-1 ... page-loader-6": add a page loader to the page (more info @components-page-loaders.html) -->
    <body class="no-trans front-page transparent-header  ">

        <!-- scrollToTop -->
        <!-- ================ -->
        <div class="scrollToTop circle"><i class="icon-up-open-big"></i></div>

        <!-- page wrapper start -->
        <!-- ================ -->
        <div class="page-wrapper">

            <!-- header-container start -->
            <div class="header-container">
                <c:import url="/WEB-INF/views/shared/common-menu.jsp" />
            </div>
            <!-- header-container end -->

            <div class="breadcrumb-container">
                <div class="container">
                    <ol class="breadcrumb">
                        <li><i class="fa fa-home pr-10"></i><a href="#">Erro</a></li>
                    </ol>
                </div>
            </div>

            <!-- section start -->
            <!-- ================ -->
            <section class="main-container light-gray-bg pv-30 clearfix">

                <div class="container">
                    <div class="row">

                        <!-- main start -->
                        <!-- ================ -->
                        <div class="main col-md-8">

                            <!-- page-title start -->
                            <!-- ================ -->
                            <h2 class="page-title">Hum... Algo de errado não esta certo!</h2>
                            <div class="separator-2"></div>
                            
                            <div class="alert alert-warning alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>Erro ao tentar acessar:</strong> ${url}
                            </div>
                            
                            <c:import url="/WEB-INF/views/shared/common-alerts.jsp" />    
                            
                        </div>
                    </div>
                </div>

            </section>
            <!-- section end -->
        </div>
        <!-- page-wrapper end -->
        <c:import url="/WEB-INF/views/shared/common-scripts.jsp" />

    </body>
</html>
