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
                            <h2 class="text-center">                               
                                Publicações SongCommunityFactory
                                <i class="fa  fa-music pl-5"></i>
                            </h2>
                            <div class="separator"></div>

                            <div class="panel-group collapse-contextual" id="accordion-4">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion-4" href="#collapseOne-4" class="collapsed">
                                                <i class="fa fa-filter pr-10"></i>Filtros
                                            </a>
                                        </h4>
                                    </div>                                    
                                    <div id="collapseOne-4" class="panel-collapse collapse" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="row">
                                                <form action="<c:url value="/public/news/find"/>" >
                                                    <div class="col-sm-12">
                                                        <h3 class="title">Encontre o que você procura</h3>

                                                        <div class="form-group">
                                                            <label for="project-band-name">Nome ou parte nome do grupo ou banda:</label>
                                                            <input type="text" maxlength="50" class="form-control" name="bandName" id="project-band-name" value="${search.bandName}" placeholder="Nome do Grupo/Banda">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="project-name">Nome ou parte nome do Projeto:</label>
                                                            <input type="text" maxlength="50" class="form-control" name="projectName" id="project-name" value="${search.projectName}" placeholder="Nome do Projeto">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="music-name">Nome ou parte nome da música:</label>
                                                            <input type="text" maxlength="50" class="form-control" name="musicName" id="music-name" value="${search.musicName}" placeholder="Nome do Música">
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="project-styles">
                                                                Estilo <i>(pressione Ctrl para selecionar mais de uma opção)</i>
                                                            </label>
                                                            <select multiple="" id="project-styles" name="styles" class="form-control" >
                                                                <c:forEach items="${styles}" var="item">
                                                                    
                                                                    <c:set var="selected" value=""/>                                                                    
                                                                    <c:if test="${search.styles!=null}">
                                                                        <c:forEach items="${search.styles}" var="foo">
                                                                            <c:if test="${foo==item.id}">
                                                                                <c:set var="selected" value="selected"/>
                                                                            </c:if>
                                                                        </c:forEach>                                                                        
                                                                    </c:if>

                                                                    <option ${selected} value="${item.id}">${item.name}</option>                                                                    
                                                                </c:forEach>
                                                            </select>
                                                            <input type="hidden" name="_styles" value="1"/>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-6"></div>
                                                            <div class="col-sm-5">
                                                                <button class="btn btn-sm hidden-xs btn-success">Filtrar<i class="fa icon-forward pl-5"></i></button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="container">
                                <c:if test="${f:length(models) gt 0}">
                                    <c:forEach items="${models}" var="model" varStatus="loop">
                                     
                                        <c:set var="css_style" value="" />
                                        <c:if test="${model.cover != null}">
                                            <c:set var="background" value="${model.cover.appPath}" />
                                            <c:set var="css_style" >
                                            background-image: url('<c:url value="${background}"/>'); background-position: center;background-size: 450px; background-repeat: no-repeat;
                                            </c:set>                    
                                        </c:if>
                                        <c:if test="${model.cover == null}">
                                            <c:set var="css_style" >
                                            background-color: #ec971f;
                                            </c:set>                    
                                        </c:if>
                                                                                                
                                        <c:if test="${loop.count % 2 != 0}">
                                            <div class="text-center row col-md-12">
                                        </c:if>
                                                
                                            <div class="col-md-5" style="${css_style}">
                                                <div class="text-left">
                                                    <span class="back-white-opac">
                                                        <span class="font-black-not-opac" >${model.style.name}</span>
                                                    </span>
                                                </div>
                                                
                                                <h3>
                                                    <span class="back-white-opac">
                                                        <span class="font-black-not-opac" >${model.title}</span>
                                                    </span>
                                                </h3>
                                                
                                                <p>
                                                    <span class="back-white-opac">
                                                        <span class="font-black-not-opac" >${model.description}</span>                                                    
                                                    </span>
                                                </p>

                                                <c:forEach items="${model.items}" var="item">
                                                    <div class="row">
                                                        <div>
                                                            <span class="back-white-opac">
                                                                <span class="font-black-not-opac" >${item.title}</span>
                                                            </span>
                                                            <br />
                                                            <c:if test="${(item.publicResource.type == 'audio')}" >
                                                                <audio src="<c:url value="${item.publicResource.appPath}"/>" controls >
                                                                    <p>Seu nevegador não suporta o elemento audio.</p>
                                                                </audio>
                                                            </c:if>

                                                            <c:if test="${(item.publicResource.type == 'video')}" >
                                                                <video src="<c:url value="${item.publicResource.appPath}"/>" height="250" controls> 
                                                                    <p>Seu navegador não suporta o elemento <code>video</code>.</p>
                                                                </video>
                                                            </c:if>      
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                                                         
                                        <c:if test="${loop.count % 2 != 0}">
                                            <div class="col-md-2"></div> 
                                        </c:if>
                                        <c:if test="${loop.count % 2 == 0}">
                                            </div>
                                            <br />
                                        </c:if>
                                        
                                    </c:forEach>
                                </c:if>
                            </div>

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
