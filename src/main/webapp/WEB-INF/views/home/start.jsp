<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <c:import url="/WEB-INF/views/shared/csrf.jsp" />
        <title>Song Community Factory | Início </title>
        <c:import url="/WEB-INF/views/shared/common-header.jsp" />        
        <link href="<c:url value="/resources/css/home.css"/>" rel="stylesheet">
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
                        <li><i class="fa fa-home pr-10"></i><a href="#">Início</a></li>
                        <!--<li class="active">Buttons</li>-->
                    </ol>
                </div>
            </div>

            <!-- section start -->
            <!-- ================ -->
            <section class="main-container light-gray-bg pv-30 clearfix">

                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="page-title">Bem Vindo</h2>
                            <div class="separator"></div>
                            <c:import url="/WEB-INF/views/shared/common-alerts.jsp" />            
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <c:import url="/WEB-INF/views/home/help-and-messages.jsp" />
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <c:import url="/WEB-INF/views/home/conversations.jsp" />
                    </div>
                </div>

                <c:if test="${f:length(myHelps) gt 0}">
                    <div class="container">
                        <div class="row">
                            <c:import url="/WEB-INF/views/home/my-helps.jsp" />
                        </div>
                    </div>
                </c:if>

                <div class="container">
                    <div class="row">
                        <c:import url="/WEB-INF/views/home/other-helps.jsp" />
                    </div>
                </div>

                <c:import url="/WEB-INF/views/home/help/conversation-info.jsp" />
                <c:import url="/WEB-INF/views/home/help/conversation-warning.jsp" />
                <c:import url="/WEB-INF/views/home/help/conversation-default.jsp" />
                <c:import url="/WEB-INF/views/home/help/help-my-open-proj.jsp" />
                <c:import url="/WEB-INF/views/home/help/help-others.jsp" />
                    
            </section>
            <!-- section end -->
        </div>
        <!-- page-wrapper end -->
        <c:import url="/WEB-INF/views/shared/common-scripts.jsp" />
        <c:import url="/WEB-INF/views/home/script.jsp" />

    </body>
</html>
