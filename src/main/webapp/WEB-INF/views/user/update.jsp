<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <c:import url="/WEB-INF/views/shared/csrf.jsp" />
        <title>Song Community Factory | Alterar </title>
        <c:import url="/WEB-INF/views/shared/common-header.jsp" />
        <link href="<c:url value="/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/css/user-data.css"/>" rel="stylesheet">
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
                        <li><i class="fa fa-home pr-10"></i><a href="#">Meus Dados</a></li>
                    </ol>
                </div>
            </div>

            <!-- section start -->
            <!-- ================ -->
            <section class="main-container light-gray-bg pv-30 clearfix">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="page-title">Alterar Usuário </h2>
                            <div class="separator"></div>
                            <c:import url="/WEB-INF/views/shared/common-alerts.jsp" />            
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <c:import url="/WEB-INF/views/user/data-user.jsp" />
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <c:import url="/WEB-INF/views/user/friends.jsp" />
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <c:import url="/WEB-INF/views/user/profile.jsp" />
                    </div>
                </div>

                <c:import url="/WEB-INF/views/user/help/help-data-user.jsp" />
                <c:import url="/WEB-INF/views/user/help/help-friends.jsp" />
                
            </section>
            <!-- section end -->
        </div>

        <!-- page-wrapper end -->
        <c:import url="/WEB-INF/views/shared/common-scripts.jsp" />

        <script type="text/javascript" src="<c:url value="/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"/>"></script>

        <script type="text/javascript">

            $(function () {

                $("#form-update").submit(function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();                    
                    if(!isEmail($("#email").val()))
                    {
                        alert("Endereço de e-mail informado não é válido!");
                        return false;
                    }                    
                    
                    try {
                        var jsonModel = getObjects();
                        postData("<c:url value="/api/user/update/user"/>", jsonModel);
                    } catch (e) {
                        alert(e);
                    }
                    
                    return false;
                });//save

                $("#submit-btn-friendship").click(function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();
                    var jsonModel = getFriendships();
                    console.log(jsonModel);
                    postData("<c:url value="/api/user/friendship"/>", jsonModel);
                    return false;
                });//save

                $("#update-password").change(function(){
                    if($(this).is(':checked')){
                        $("#password").prop('disabled', false);
                        $("#password").prop("required", true);                        
                        $("#password").attr("minlength","6");
                        $("#confirm-password").prop('disabled', false);
                        $("#confirm-password").prop("required", true);                        
                        $("#confirm-password").attr("minlength","6");
                    } 
                    else {
                        $("#password").prop('disabled', true);
                        $("#password").prop("required", false);                        
                        $("#password").removeAttr("minlength");
                        $("#confirm-password").prop('disabled', true);
                        $("#confirm-password").prop("required", false);                        
                        $("#confirm-password").removeAttr("minlength");
                    }
                });

                $("#user-friends-inactive, #user-friends-active").sortable({
                    connectWith: ".connectedSortable"
                }).disableSelection();

            });

            /*
             Post $jsonModel at $action
             */
            function postData($action, $jsonModel)
            {
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");

                $.ajax({
                    url: $action,
                    method: 'POST',
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(header, token);
                        $(".post-submit-hidden").hide();
                        $("body").css("cursor", "progress");
                    },
                    contentType: 'application/json',
                    data: JSON.stringify($jsonModel),
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

            function getFriendships()
            {
                var friendships = [];

                $("#user-friends-inactive > li").each(function () {
                    var friendship = new Object();
                    friendship.id = $(this).val();
                    friendship.status = 0;
                    friendship.requester = new Object();
                    friendship.requester.id = $(this).attr("id-requester");
                    friendship.requested = new Object();
                    friendship.requested.id = $(this).attr("id-requested");
                    friendships.push(friendship);
                });
                $("#user-friends-active > li").each(function () {
                    var friendship = new Object();
                    friendship.id = $(this).val();
                    friendship.status = 1;
                    friendship.requester = new Object();
                    friendship.requester.id = $(this).attr("id-requester");
                    friendship.requested = new Object();
                    friendship.requested.id = $(this).attr("id-requested");
                    friendships.push(friendship);
                });

                return friendships;
            }


            /*
             Returns a full filled UpdateObject from the insert form
             */
            function getObjects()
            {
                //user
                var _user = new Object();

                _user.id = $("#id").val();
                _user.username  = getValOrThrow("#username", "Nome");
                _user.email     = getValOrThrow("#email", "E-mail");
                
                if($("#update-password").is(':checked'))
                {
                    _user.password          = getValOrThrow("#password", "Senha");
                    _user.confirmPassword   = getValOrThrow("#confirm-password", "Confirme a Senha");                    
                }
                
                //styles
                var styles = [];
                var stylesSelector = "#project-styles option:selected";
                $(stylesSelector).each(function (i, selected) {
                    var style = new Object();
                    style.id = $(selected).val();
                    styles.push(style);
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
