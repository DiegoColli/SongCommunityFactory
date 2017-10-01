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
        <title>Song Community Factory | Publicação </title>
        <c:import url="/WEB-INF/views/shared/common-header.jsp" />        
        <link href="<c:url value="/resources/css/publicacao.css"/>" rel="stylesheet">
    </head>

    <!-- body classes:  -->
    <!-- "boxed": boxed layout mode e.g. <body class="boxed"> -->
    <!-- "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> -->
    <!-- "transparent-header": makes the header transparent and pulls the banner to top -->
    <!-- "gradient-background-header": applies gradient background to header -->
    <!-- "page-loader-1 ... page-loader-6": add a page loader to the page (more info @components-page-loaders.html) -->
    <body class="no-trans front-page transparent-header">

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
                            <h2 class="page-title">Publicação</h2>
                            <div class="separator"></div>
                            <c:import url="/WEB-INF/views/shared/common-alerts.jsp" />            
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="main col-md-12" >   

                            <form class="form-horizontal" role="form" method="POST" id="form_approval_publish" action="<c:url value="/api/approve/publishing/submit"/>" >

                                <div class="form-group">
                                    <label for="title" class="col-sm-4 control-label">Título da Publicação</label>
                                    <div class="col-sm-8 input-group">
                                        <input type="text" maxlength="45" required="" class="form-control" name="title" id="title" placeholder="Título" oninvalid="getVal(this, 'Título da Publicação')" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="description" class="col-sm-4 control-label">Descrição da Publicação</label>
                                    <div class="col-sm-8 input-group">                                        
                                        <textarea id="description" maxlength="390" required="" name="description" maxlength="390" class="form-control" rows="3" oninvalid="getVal(this, 'Descrição da Publicação')" ></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="style" class="col-sm-4 control-label">
                                        Estilo 
                                    </label>
                                    <div class="col-sm-8 input-group">
                                        <select required="" id="style" name="style" class="form-control" >
                                            <c:set var="selected" value="" />
                                            <c:forEach items="${styles}" var="item">
                                                <c:if test="${item.id == 4}">
                                                    ${item.name = 'Outros'}
                                                    <c:set var="selected" value="selected" />
                                                </c:if>                                                
                                                <option value="${item.id}" ${selected} >${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cover" class="col-sm-4 control-label">Capa do Albúm a ser publicado</label>
                                    <div class="col-sm-8 input-group">                                                                                
                                        <input class="file-project" id="cover" type="file" accept="image/*" >
                                    </div>
                                </div>
                                                                
                                <div class="form-group">
                                    <label for="phrase" class="col-sm-4 control-label">Texto de Notificação para<br /> seus companheiros de projeto</label>
                                    <div class="col-sm-8 input-group">                                        
                                        <textarea id="phrase" name="phrase" maxlength="195" required="" class="form-control" rows="3" oninvalid="getVal(this, 'Texto de Notificação')" ></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <h4 class="col-sm-10 col-sm-offset-1">
                                        Atenção apenas são aceitas publicações de arquivos nos seguintes formatos audio ou vídeo
                                    </h4>
                                </div>

                                <c:forEach items="${workspace.resources}" var="resource">
                                    <c:if test="${(resource.type == 'video') || (resource.type == 'audio')}">

                                        <br>
                                        <section class="section default-bg clearfix">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="call-to-action text-center">
                                                            <div class="row">
                                                                <div class="col-sm-12">

                                                                    <div class="form-group">
                                                                        <label for="title-${resource.id}" class="col-sm-4 control-label">
                                                                            Título de publicação do arquivo:
                                                                        </label>
                                                                        <div class="col-sm-6 input-group">                                        
                                                                            <input type="text" required="" maxlength="45" class="form-control resource-title" oninvalid="getVal(this, 'Título de publicação')" 
                                                                                   name="title[${resource.id}]" id="title-${resource.id}" value="${f:replace(resource.name, resource.ext, '')}" >
                                                                        </div>
                                                                    </div>                                        

                                                                    <div class="form-group">
                                                                        <label for="check-${resource.name}" class="col-sm-3 control-label">
                                                                            publicar
                                                                        </label>
                                                                        <div class="col-sm-1" >
                                                                            <input type="checkbox" class="resource-check" value="${resource.id}" id="check-${resource.id}" />
                                                                        </div>
                                                                        <div class="col-sm-6 input-group">                                                                                        
                                                                            <c:if test="${(resource.type == 'audio')}" >
                                                                                <audio src="<c:url value="${resource.appPath}"/>" controls >
                                                                                    <p>Seu nevegador não suporta o elemento audio.</p>
                                                                                </audio>
                                                                            </c:if>

                                                                            <c:if test="${(resource.type == 'video')}" >
                                                                                <video src="<c:url value="${resource.appPath}"/>" height="250" controls> 
                                                                                    <p>Seu navegador não suporta o elemento <code>video</code>.</p>
                                                                                </video>
                                                                            </c:if>                                                
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </section>

                                    </c:if>

                                </c:forEach>

                                <br />

                                <div class="container">
                                    <div class="row">
                                        <div class="main col-md-5 "></div>
                                        <div class="main col-md-6 ">
                                            <button type="submit" class="btn btn-animated btn-success submit-project post-submit-hidden" >
                                                Criar Pedido <i class="fa fa-check"></i>
                                            </button>
                                        </div>
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

        <script>

            $(function () {

                //principal form
                $("#form_approval_publish").submit(function (e) {
                    e.preventDefault();
                    e.stopImmediatePropagation();                    
                    try {
                        var approval = new Object();
                        approval.project = new Object();
                        approval.publishing = new Object();
                        approval.publishing.style = new Object();
                        
                        approval.project.id = ${workspace.project.id};
                        approval.description = getValOrThrow("#phrase","Texto de Notificação");                                                
                        approval.publishing.title = getValOrThrow("#title", "Título da Publicação");
                        approval.publishing.description = getValOrThrow("#description", "Descrição da Publicação");                        
                        approval.publishing.style.id = $("#style").val();
                        if ($("#cover").val())
                        {
                            approval.publishing.cover = new Object();
                            approval.publishing.cover.name = $("#cover")[0].files[0].name;                        
                        }
                        approval.publishing.items = [];                    
                        $(".resource-check:checked").each(function(){
                            var item = new Object();
                            var id =  $(this).val();
                            item.title = getValOrThrow("#title-"+id, "Título de publicação");
                            item.projectResource = new Object();
                            item.projectResource.id = id;
                            approval.publishing.items.push(item);

                        });
                        if(approval.publishing.items.length < 1)
                        {
                            alert("Selecione os Itens para Publicação!");
                            return false;
                        }
                        postData($(this).attr("action"), approval);
                    } 
                    catch (e) {
                        alert(e);
                    }
                    return false;
                });//save            
            });

            //files style
            $(".file-project").fileinput({
                'theme': 'explorer',
                language: 'pt-BR',
                overwriteInitial: true,
                initialPreviewAsData: true,
                showUpload: false,
                initialPreview: [],
                initialPreviewConfig: [],
                maxFilePreviewSize: 125600,
                maxFileSize: 125500
            });            
            
            //write files
            $('.file-project').on('fileloaded', function (event, file, previewId, index, reader) 
            {   
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");

                var formData = new FormData();
                formData.append("file", file);

                var ref = this;

                $.ajax({
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    type: "POST",
                    method: 'POST',
                    enctype: 'multipart/form-data',
                    url: "<c:url value="/api/publish/resource/upload/cover"/>",
                    data: formData,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,

                    success: function (r) {
                        console.log("success: " + r);
                    },
                    error: function (e) {
                        console.log("Erro: " + e);
                        alert("Não conseguimos salvar o arquivo, por favor tente novamente");
                        $(ref).fileinput('clear');
                    }
                });
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
                        window.location = "<c:url value="/home/start"/>";
                    },
                    error: function (e) {
                        console.log("Erro: " + e);
                        alert("Erro: " + e.message);
                        $(".post-submit-hidden").show();
                        $("body").css("cursor", "default");
                    }
                });
            }

        </script>

    </body>
</html>
