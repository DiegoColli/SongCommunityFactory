
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html>
    <!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <c:import url="/WEB-INF/views/shared/csrf.jsp" />
        <title>Song Community Factory | Publicação </title>
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
                <c:import url="/WEB-INF/views/shared/common-menu.jsp" />
            </div>
            <!-- header-container end -->

            <div class="breadcrumb-container">
                <div class="container">
                    <ol class="breadcrumb">
                        <li>Logado como: ${user.username} </li>
                        <li><i class="fa fa-home pr-10"></i><a href="#">Publicações</a></li>
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
                            <h2 class="page-title">Publicações</h2>
                            <div class="separator-2"></div>
                            <!-- page-title end -->
                        </div>
                        <!-- main end -->

                    </div>
                </div>
                                
                <c:set var="css_style" value="" />
                <c:if test="${approval.publishing.cover != null}">
                    <c:set var="background" value="${approval.publishing.cover.appPath}" />
                    <c:set var="css_style" >
                    background-image: url('<c:url value="${background}"/>'); background-position: center;background-size: 450px; background-repeat: no-repeat;
                    </c:set>                    
                </c:if>
                <c:if test="${approval.publishing.cover == null}">
                    <c:set var="css_style" >
                    background-color: #ec971f;
                    </c:set>                    
                </c:if>
                <div class="container">
                    <div class="row text-center">
                        <div class="col-md-5" style="${css_style}">                            
                            <div class="text-left">
                                <span class="back-white-opac">
                                    <span class="font-black-not-opac" >${approval.publishing.style.name}</span>
                                </span>
                            </div>

                            <h3>
                                <span class="back-white-opac">
                                    <span class="font-black-not-opac" >${approval.publishing.title}</span>
                                </span>
                            </h3>

                            <p>
                                <span class="back-white-opac">
                                    <span class="font-black-not-opac" >${approval.publishing.description}</span>                                                    
                                </span>
                            </p>
                            
                            <c:forEach items="${approval.publishing.items}" var="item">
                                <div class="row">
                                    <div>                                    
                                        <span class="back-white-opac">
                                            <span class="font-black-not-opac" >${item.title}</span>
                                        </span>
                                        <br />                                        
                                        <c:if test="${(item.projectResource.type == 'audio')}" >
                                            <audio src="<c:url value="${item.projectResource.appPath}"/>" controls >
                                                <p>Seu nevegador não suporta o elemento audio.</p>
                                            </audio>
                                        </c:if>
                                        <c:if test="${(item.projectResource.type == 'video')}" >
                                            <video src="<c:url value="${item.projectResource.appPath}"/>" height="250" controls> 
                                                <p>Seu navegador não suporta o elemento <code>video</code>.</p>
                                            </video>
                                        </c:if>      
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <div class="col-md-1">

                        </div>
                        <div class="col-md-5">
                            <h3 class="title text-center">Dê uma olhada! <br />É mais ou menos assim que sua publicação ficará disponível</h3>
                        </div>
                            
                    </div>
                </div>
                            
                <br />
                <br />
                <div class="container">
                    <div class="row">
                        <div class="main col-md-12">
                            <div class="call-to-action default-bg p-20">
                                <h3 class="title text-center">Votar</h3>
                                <c:forEach items="${approval.votes}" var="vote">
                                    <div class="row">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-3" style="font-size: large;">
                                            ${vote.user.username}
                                        </div>
                                        <div class="col-md-4">

                                            <c:set var="disabled" value="disabled"/>
                                            <c:set var="myVote" value=""/>
                                            <c:if test="${vote.user.id==user.id}">
                                                <c:set var="disabled" value=""/>
                                                <c:set var="myVote" value="myVote"/>
                                            </c:if>

                                            <label>                                                           
                                                <c:set var="checked" value=""/>
                                                <c:if test="${vote.status==1}">                                                         
                                                    <c:set var="checked" value="checked='checked'"/>
                                                </c:if>
                                                Sim
                                                <input class="${myVote}" id-vote="${vote.id}" type="radio" ${disabled} name="${vote.user.username}" value="1" ${checked} />
                                            </label>
                                            <label> 
                                                <c:set var="checked" value=""/>
                                                <c:if test="${vote.status==2}">                                                         
                                                    <c:set var="checked" value="checked='checked'"/>
                                                </c:if>
                                                Não
                                                <input class="${myVote}" id-vote="${vote.id}" type="radio" ${disabled} name="${vote.user.username}" value="2" ${checked} />
                                            </label>
                                        </div>
                                    </div>

                                </c:forEach>

                                <div class="row">
                                    <div class="col-md-5"></div>
                                    <div class="col-md-5">
                                        <button type="submit" id="submit-vote" class="btn btn-animated btn-success post-submit-hidden">
                                            Submeter Voto <i class="fa fa-check"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>
            <!-- section end -->
        </div>
                
                        
        <!--scripts-->
        <c:import url="/WEB-INF/views/shared/common-scripts.jsp" />
        
        <script>
            
        $(function () 
        {
        
            $("#submit-vote").click(function (e) {
                e.preventDefault();
                e.stopImmediatePropagation();
                
                var vote = new Object();
                vote.user= new Object();
                vote.user.id = ${user.id}
                vote.approval= new Object();
                vote.approval.id = ${approval.id};
                
                $(".myVote").each(function(){
                     if($(this).is(':checked')) 
                     {
                        vote.id = $(this).attr("id-vote");
                        vote.status = $(this).val();
                     }
                });
                
                if (vote.id == null)
                {
                    alert("Você precisa escolher um valor antes de continuar!");
                    return false;
                }

                postRefreshJson("<c:url value="/api/approve/publishing/vote"/>", vote);
                return false;
            });//save

        });
          

        function postRefreshJson($action, $jsonModel)
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
                    window.location = "<c:url value="/project/update/${approval.project.id}"/>";
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


