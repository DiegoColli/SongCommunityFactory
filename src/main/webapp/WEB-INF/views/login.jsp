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
        <title>Song Community Factory | Acessar </title>
        <c:import url="/WEB-INF/views/shared/common-header.jsp" />
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

                <!-- header-top -->
                <c:import url="/WEB-INF/views/shared/common-social.jsp" />
                <!-- header-top end -->

                <!-- header start -->
                <!-- classes:  -->
                <!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
                <!-- "dark": dark version of header e.g. class="header dark clearfix" -->
                <!-- "full-width": mandatory class for the full-width menu layout -->
                <!-- "centered": mandatory class for the centered logo layout -->
                <!-- ================ --> 
                <c:import url="/WEB-INF/views/shared/common-public-menu.jsp" />
            </div>
            <!-- header-container end -->

            <div id="page-start"></div>


            <!-- section start -->
            <!-- ================ -->
            <section class="light-gray-bg pv-30 clearfix">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="text-center">Acessar<i class="fa icon-forward  pl-5"></i></h2>
                            <div class="separator"></div>

                            <c:import url="/WEB-INF/views/shared/common-alerts.jsp" />

                            <form class="form-horizontal" role="form" method="POST" id="form_login" >
                                <div class="form-group">
                                    <label for="email" class="col-sm-4 control-label">Nome</label>
                                    <div class="col-sm-8 input-group">
                                        <input type="text" class="form-control" name="username" id="username" placeholder="Nome">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-4 control-label">Senha</label>
                                    <div class="col-sm-8 input-group">                                        
                                        <input type="password" class="form-control" name="password" id="password" placeholder="Senha">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-9 col-sm-3">
                                        <a href="#" id="btn_submit" class="btn btn-sm  btn-primary post-submit-hidden">Confirmar <i class="fa fa-check"></i></a>
                                        <a href="<c:url value="/public/forgotPassword"/>"  class="btn btn-sm  btn-danger">Esqueci a Senha <i class="fa fa-refresh"></i></a>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-9 col-sm-3">

                                        <label>
                                            <input type="checkbox" id="remember-me" name="remember-me" />
                                            <label for="remember-me">Manter-se Conectado ?</label>
                                        </label>

                                    </div>
                                </div>

                                <input name="_csrf" type="hidden" value="${_csrf.token}" />

                            </form>

                            <!--fa-check-->
                            <!--fa-exclamation-circle-->
                            <!--fa-eye-->
                            <!--fa-refresh-->

                        </div>
                    </div>
                </div>
            </section>
            <!-- section end -->

        </div>
        <!-- page-wrapper end -->
        <c:import url="/WEB-INF/views/shared/common-scripts.jsp" />
        <script type="text/javascript" src="<c:url value="/resources/js/login.js"/>"></script>
    </body>
</html>
