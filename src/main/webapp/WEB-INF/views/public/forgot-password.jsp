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
        <title>Song Community Factory | Junte-se a Nós </title>
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
                <!-- header end -->
            </div>
            <!-- header-container end -->

            <div id="page-start"></div>


            <!-- section start -->
            <!-- ================ -->
            <section class="light-gray-bg pv-30 clearfix">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="text-center">Informe seu E-mail cadastrado no SongCommunityFactory<i class="fa icon-mail pl-5"></i></h2>
                            <div class="separator"></div>
                            <form class="form-horizontal" role="form" id="form-forgot-email" action="<c:url value="/api/user/forgotPassword"/>" method="POST">
                                <div class="form-group col-sm-11">
                                    <label class="col-sm-12 control-label">
                                        Preecha o campo de e-mail, clique em Solicitar Nova Senha e dentro de instantes 
                                        você deverá receber um e-mail contendo sua nova senha!    
                                    </label>                                    
                                </div>
                                <div class="form-group col-sm-9 ">
                                    <label for="email" class="col-sm-2 control-label">E-mail</label>
                                    <div class="col-sm-9 input-group">
                                        <input type="email" class="form-control" id="email" placeholder="E-Mail">
                                    </div>                                    
                                </div>
                                <div class="form-group col-sm-3 ">
                                    <button id="submit-btn" type="submit" class="btn btn-sm btn-animated btn-default post-submit-hidden" >
                                    Solicitar Nova Senha<i class="fa fa-check"></i>
                                    </button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </section>
            <!-- section end -->
        </div>
        <!-- page-wrapper end -->
        <c:import url="/WEB-INF/views/shared/common-scripts.jsp" />

        <script type="text/javascript">

            $(function () {

                $("#form-forgot-email").submit(function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();

                    if(!isEmail($("#email").val()))
                    {
                        alert("Endereço de e-mail informado não é válido!");
                        return false;
                    }
                    
                    var _email = $("#email").val();
                    var params = {email: _email};
                    postParams($(this).attr("action"), params);

                    return false;
                });//save

            });

            function postParams($action, $params)
            {
                $.ajax({
                    url: $action,
                    method: 'POST',
                    beforeSend: function (xhr) {
                        $(".post-submit-hidden").hide();
                        $("body").css("cursor", "progress");
                    },
                    data: $params,
                    success: function (r) {
                        console.log("success: " + r);
                        alert(r.successMessage);
                        window.location = window.location.toString();
                    },
                    error: function (e) {
                        console.log("Erro: " + e);
                        alert("Erro: " + e.responseJSON.errorMessage);
                        $(".post-submit-hidden").show();
                        $("body").css("cursor", "default");
                    }
                });
            }

        </script>

    </body>
</html>
