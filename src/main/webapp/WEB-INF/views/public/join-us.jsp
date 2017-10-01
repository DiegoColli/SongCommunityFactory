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
                            <h2 class="text-center">Junte-se a Nós<i class="fa icon-users pl-5"></i></h2>
                            <div class="separator"></div>
                            <form class="form-horizontal" role="form" id="form-join-us" action="<c:url value="/api/user/joinUs"/>" method="POST">

                                <div class="form-group">
                                    <label for="username" class="col-sm-4 control-label">Nome</label>
                                    <div class="col-sm-8 input-group">
                                        <input type="text" required="" maxlength="45"  class="form-control" id="username" placeholder="Nome" oninvalid="getVal(this, 'Nome')"  >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="email" class="col-sm-4 control-label">E-mail</label>
                                    <div class="col-sm-8 input-group">
                                        <input type="email" required="" maxlength="190" class="form-control" id="email" placeholder="E-Mail" oninvalid="getVal(this, 'E-mail')" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="password" class="col-sm-4 control-label">Senha</label>
                                    <div class="col-sm-8 input-group">
                                        <input type="password" required="" maxlength="20" minlength="6" class="form-control" id="password" placeholder="Senha" oninvalid="getVal(this, 'Senha')"  >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="confirm-password" class="col-sm-4 control-label">Confirme a Senha</label>
                                    <div class="col-sm-8 input-group">
                                        <input type="password" required="" maxlength="20" minlength="6" class="form-control" id="confirm-password" placeholder="Confirme a Senha" oninvalid="getVal(this, 'Confirme a Senha')"   >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label">                                        
                                    </label>
                                    <div class="col-sm-8 input-group">
                                        <i>(pressione Ctrl para selecionar mais de uma opção)</i>
                                    </div>                                    
                                </div>
                                
                                <div class="form-group">
                                    <label for="project-styles" class="col-sm-4 control-label">
                                        Preferência Musical 
                                    </label>
                                    <div class="col-sm-8 input-group">
                                        <select multiple="" id="project-styles" class="form-control" >
                                            <c:forEach items="${styles}" var="item">
                                                <option value="${item.id}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-10 col-sm-2">
                                        <button id="submit-btn" type="submit" class="btn btn-sm btn-animated btn-default post-submit-hidden" >Confirmar <i class="fa fa-check"></i></button>
                                    </div>                                    
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

                $("#form-join-us").submit(function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();

                    if(!isEmail($("#email").val()))
                    {
                        alert("Endereço de e-mail informado não é válido!");
                        return false;
                    }
                    
                    if($("#password").val() != $("#confirm-password").val())
                    {
                        alert("Senhas não conferem! ");
                        return false;
                    }
                    
                    try {
                        var jsonModel = getObjects();                    
                        postData($(this).attr("action"), jsonModel);    
                    } 
                    catch (e) {
                        alert(e);
                    }

                    return false;
                });//save

            });

            /*
             Post $jsonModel at $action
             */
            function postData($action, $jsonModel)
            {
                $.ajax({
                    url: $action,
                    method: 'POST',
                    beforeSend: function (xhr) {
                        $(".post-submit-hidden").hide();
                        $("body").css("cursor", "progress");
                    },
                    contentType: 'application/json',
                    data: JSON.stringify($jsonModel),
                    success: function (r) {
                        console.log("success: " + r);
                        alert("Usuário Criado com Sucesso!");
                        window.location = <c:url value="/"/>;
                    },
                    error: function (e) {
                        console.log("Erro: " + e);
                        alert("Erro: " + e.responseJSON.errorMessage);
                        $(".post-submit-hidden").show();
                        $("body").css("cursor", "default");
                    }
                });
            }


            /*
             Returns a full filled UpdateObject from the insert form
             */
            function getObjects()
            {
                //user
                var _user = new Object();
                
                _user.username  = getValOrThrow("#username","Nome");
                _user.email     = getValOrThrow("#email","E-mail");
                _user.password  = getValOrThrow("#password","Senha");
                _user.confirmPassword = getValOrThrow("#confirm-password","Confirme a Senha");
                
                //styles
                var styles = [];
                var stylesSelector = "#project-styles option:selected";
                $(stylesSelector).each(function (i, selected) {
                    var style = new Object();
                    style.id = $(selected).val();
                    styles[i] = style;
                });
                if (!styles.length)
                {
                    var style = new Object();
                    style.id = 4; //not know yet
                    styles.push(style);
                }
                _user.styles = styles;

                return _user;
            }


        </script>

    </body>
</html>
