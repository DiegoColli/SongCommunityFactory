<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html>
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
                        <li>Logado como: ${user.username} </li>
                        <li><i class="fa fa-home pr-10"></i><a href="#">Projetos</a></li>
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
                        <div class="main col-md-12">
                            <!-- page-title start -->
                            <!-- ================ -->
                            <h2 class="page-title">Projetos</h2>
                            <div class="separator-2"></div>
                            <c:import url="/WEB-INF/views/shared/common-alerts.jsp" />
                            <!-- page-title end -->
                        </div>
                        <!-- main end -->

                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="main col-md-12">
                            <c:import url="/WEB-INF/views/project/${pag}.jsp" />
                        </div>
                    </div>
                </div>

                <c:if test="${pag == 'new' || pag == 'update'}">
                    <c:import url="/WEB-INF/views/project/help/step-1.jsp" />
                    <c:import url="/WEB-INF/views/project/help/step-2.jsp" />
                    <c:import url="/WEB-INF/views/project/help/step-3.jsp" />
                </c:if>

            </section>
            <!-- section end -->
        </div>
        <!-- page-wrapper end -->
        <c:import url="/WEB-INF/views/shared/common-scripts.jsp" />
        <c:if test="${pag == 'new' || pag == 'update'}">
            <c:import url="/WEB-INF/views/project/${pag}/script.jsp" />
        </c:if>
    </body>
</html>
