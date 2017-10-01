
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
        <title>Song Community Factory | Projetos </title>
        <c:import url="/WEB-INF/views/shared/common-header.jsp" /> 
        <!-- Custom css --> 
        <link href="<c:url value="/resources/css/comparison.css"/>" rel="stylesheet">
        
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
                            <h2 class="page-title">Conversão de Espaço de Trabalho</h2>
                            <div class="separator-2"></div>
                            <!-- page-title end -->
                        </div>
                        <!-- main end -->

                    </div>
                </div>

                <!--POG-->
                <c:import url="/WEB-INF/views/shared/common-scripts.jsp" />
                
                <div class="container">
                    <div class="row">
                        <div class="main col-md-12">

                            <c:if test="${f:length(deletions) gt 0}">
                                <div class="alert alert-danger" role="alert">
                                    <h4>Recursos Excluídos</h4>
                                    <c:forEach items="${deletions}" var="statusResult">
                                        
                                        <div class="row">
                                            <div class="main col-md-12">                                        
                                                <input id="aprove-file-${statusResult.wanted.id}" type="file" >                                                
                                            </div>
                                        </div>
                                        
                                        <script>    
                                        $("#aprove-file-${statusResult.wanted.id}").fileinput({
                                            'theme': 'explorer',
                                            language: 'pt-BR',
                                            overwriteInitial: true,
                                            initialPreviewAsData: true,
                                            showUpload: false,
                                            showRemove: false,
                                            showCancel: false,
                                            showBrowse: false,
                                            showClose: false,
                                            showDrag: false,
                                            fileActionSettings: {            
                                                showDrag: false,        
                                                removeClass: "hidden",
                                                removeIcon: ""                    
                                            },
                                            initialPreview: ["<c:url value="${statusResult.wanted.appPath}"/>"],
                                            initialPreviewConfig: [
                                                {type: "${statusResult.wanted.type}", filetype: "", caption: "${statusResult.wanted.name}", width: "120px", key: 1}
                                            ]
                                        });                                            
                                        </script>
                                        
                                    </c:forEach>
                                </div>    
                            </c:if>

                            <c:if test="${f:length(contents) gt 0}">
                                <div class="alert alert-warning" role="alert">
                                    <h4>Recursos Modificados</h4>
                                    <c:forEach items="${contents}" var="statusResult">
                                        
                                        <div class="row">
                                            <div class="main col-md-6">                                        
                                                <input id="aprove-file-${statusResult.found.id}" type="file" >                                                
                                            </div>
                                        
                                        <script>    
                                        $("#aprove-file-${statusResult.found.id}").fileinput({
                                            'theme': 'explorer',
                                            language: 'pt-BR',
                                            overwriteInitial: true,
                                            initialPreviewAsData: true,
                                            showUpload: false,
                                            showRemove: false,
                                            showCancel: false,
                                            showBrowse: false,
                                            showClose: false,
                                            showDrag: false,
                                            fileActionSettings: {            
                                                showDrag: false,        
                                                removeClass: "hidden",
                                                removeIcon: ""                    
                                            },
                                            initialPreview: ["<c:url value="${statusResult.found.appPath}"/>"],
                                            initialPreviewConfig: [
                                                {type: "${statusResult.found.type}", filetype: "", caption: "${statusResult.found.name}", width: "120px", key: 1}
                                            ]
                                        });                                            
                                        </script>
                                        
                                            <div class="main col-md-6">                                        
                                                <input id="aprove-file-${statusResult.wanted.id}" type="file" >                                                
                                            </div>
                                        </div>
                                        
                                        <script>    
                                        $("#aprove-file-${statusResult.wanted.id}").fileinput({
                                            'theme': 'explorer',
                                            language: 'pt-BR',
                                            overwriteInitial: true,
                                            initialPreviewAsData: true,
                                            showUpload: false,
                                            showRemove: false,
                                            showCancel: false,
                                            showBrowse: false,
                                            showClose: false,
                                            showDrag: false,
                                            fileActionSettings: {            
                                                showDrag: false,        
                                                removeClass: "hidden",
                                                removeIcon: ""                    
                                            },
                                            initialPreview: ["<c:url value="${statusResult.wanted.appPath}"/>"],
                                            initialPreviewConfig: [
                                                {type: "${statusResult.wanted.type}", filetype: "", caption: "${statusResult.wanted.name}", width: "120px", key: 1}
                                            ]
                                        });                                            
                                        </script>
                                        
                                    </c:forEach>
                                </div>
                            </c:if>

                            <c:if test="${f:length(names) gt 0}">
                                <div class="alert alert-info" role="alert">
                                    <h4>Recursos Renomeados</h4>
                                    <c:forEach items="${names}" var="statusResult">
                                          <div class="row">
                                            <div class="main col-md-6">                                        
                                                <input id="aprove-file-${statusResult.found.id}" type="file" >                                                
                                            </div>
                                       
                                        
                                        <script>    
                                        $("#aprove-file-${statusResult.found.id}").fileinput({
                                            'theme': 'explorer',
                                            language: 'pt-BR',
                                            overwriteInitial: true,
                                            initialPreviewAsData: true,
                                            showUpload: false,
                                            showRemove: false,
                                            showCancel: false,
                                            showBrowse: false,
                                            showClose: false,
                                            showDrag: false,
                                            fileActionSettings: {            
                                                showDrag: false,        
                                                removeClass: "hidden",
                                                removeIcon: ""                    
                                            },
                                            initialPreview: ["<c:url value="${statusResult.found.appPath}"/>"],
                                            initialPreviewConfig: [
                                                {type: "${statusResult.found.type}", filetype: "", caption: "${statusResult.found.name}", width: "120px", key: 1}
                                            ]
                                        });                                            
                                        </script>
                                        
                                            <div class="main col-md-6">                                        
                                                <input id="aprove-file-${statusResult.wanted.id}" type="file" >                                                
                                            </div>
                                        </div>
                                        
                                        <script>    
                                        $("#aprove-file-${statusResult.wanted.id}").fileinput({
                                            'theme': 'explorer',
                                            language: 'pt-BR',
                                            overwriteInitial: true,
                                            initialPreviewAsData: true,
                                            showUpload: false,
                                            showRemove: false,
                                            showCancel: false,
                                            showBrowse: false,
                                            showClose: false,
                                            showDrag: false,
                                            fileActionSettings: {            
                                                showDrag: false,        
                                                removeClass: "hidden",
                                                removeIcon: ""                    
                                            },
                                            initialPreview: ["<c:url value="${statusResult.wanted.appPath}"/>"],
                                            initialPreviewConfig: [
                                                {type: "${statusResult.wanted.type}", filetype: "", caption: "${statusResult.wanted.name}", width: "120px", key: 1}
                                            ]
                                        });                                            
                                        </script>                             
                                    </c:forEach>
                                </div>
                            </c:if>

                            <c:if test="${f:length(uniques) gt 0}">                                
                                <div class="alert alert-success" role="alert">
                                    <h4>Recursos Adicionados</h4>
                                    <c:forEach items="${uniques}" var="statusResult">
                                        
                                        <div class="row">
                                            <div class="main col-md-12">                                        
                                                <input id="aprove-file-${statusResult.wanted.id}" type="file" >                                                
                                            </div>
                                        </div>
                                        
                                        <script>    
                                        $("#aprove-file-${statusResult.wanted.id}").fileinput({
                                            'theme': 'explorer',
                                            language: 'pt-BR',
                                            overwriteInitial: true,
                                            initialPreviewAsData: true,
                                            showUpload: false,
                                            showRemove: false,
                                            showCancel: false,
                                            showBrowse: false,
                                            showClose: false,
                                            showDrag: false,
                                            fileActionSettings: {            
                                                showDrag: false,        
                                                removeClass: "hidden",
                                                removeIcon: ""                    
                                            },
                                            initialPreview: ["<c:url value="${statusResult.wanted.appPath}"/>"],
                                            initialPreviewConfig: [
                                                {type: "${statusResult.wanted.type}", filetype: "", caption: "${statusResult.wanted.name}", width: "120px", key: 1}
                                            ]
                                        });                                            
                                        </script>
                                        
                                        
                                    </c:forEach>
                                </div>
                            </c:if>

                            <c:if test="${f:length(equals) gt 0}">
                                <div class="alert bg-primary" role="alert">
                                    <h4>Recursos Não Alterados</h4>
                                    <c:forEach items="${equals}" var="statusResult">
                                        
                                        <div class="row">
                                            <div class="main col-md-12">                                        
                                                <input id="aprove-file-${statusResult.wanted.id}" type="file" >                                                
                                            </div>
                                        </div>
                                        
                                        <script>    
                                        $("#aprove-file-${statusResult.wanted.id}").fileinput({
                                            'theme': 'explorer',
                                            language: 'pt-BR',
                                            overwriteInitial: true,
                                            initialPreviewAsData: true,
                                            showUpload: false,
                                            showRemove: false,
                                            showCancel: false,
                                            showBrowse: false,
                                            showClose: false,
                                            showDrag: false,
                                            fileActionSettings: {            
                                                showDrag: false,        
                                                removeClass: "hidden",
                                                removeIcon: ""                    
                                            },
                                            initialPreview: ["<c:url value="${statusResult.wanted.appPath}"/>"],
                                            initialPreviewConfig: [
                                                {type: "${statusResult.wanted.type}", filetype: "", caption: "${statusResult.wanted.name}", width: "120px", key: 1}
                                            ]
                                        });                                            
                                        </script>
                                        
                                    </c:forEach>
                                </div>    
                            </c:if>
                            
                            <c:if test="${show_submit}">
                                <div class="container">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="approval-description">Descrição/Mensagem</label>
                                            <textarea id="approval-description" maxlength="190" required="" class="form-control" rows="3">Pedido de conversão do espaço de trabalho: ${workspace.name}</textarea>
                                        </div>	
                                    </div>
                                </div>
                                
                                <div class="container">
                                    <div class="col-md-5"></div>
                                    <div class="col-md-5">
                                        <button type="submit" id="submit-workspace" id-workspace="${workspace.id}" class="btn btn-animated btn-success post-submit-hidden">
                                            Submeter Espaço de Trabalho <i class="fa fa-check"></i>
                                        </button>
                                    </div>
                                </div>
                            </c:if>
                            
                            <c:if test="${show_vote}">
                                
                                <div class="row">
                                    <div class="main col-md-12">
                                        <div class="call-to-action default-bg p-20">
                                            <h3 class="title text-center">Votar</h3>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <c:forEach items="${approval.votes}" var="vote">

                                    <div class="row">
                                        <div class="main col-md-12">
                                            <div class="call-to-action default-bg p-20">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-3">
                                                    <span style="font-size: large;">
                                                    ${vote.user.username}
                                                    </span>
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
                                                <br />
                                            </div>
                                        </div>                                        
                                    </div>
                                   <br />
                                </c:forEach>
                                
                                <div class="container">
                                    <div class="col-md-5"></div>
                                    <div class="col-md-5">
                                        <button type="submit" id="submit-vote" id-approval="${approval.id}" id-workspace="${workspace.id}" class="btn btn-animated btn-success post-submit-hidden">
                                            Submeter Voto <i class="fa fa-check"></i>
                                        </button>
                                    </div>
                                </div>
                                
                            </c:if>
                                
                        </div>
                    </div>
                </div>

            </section>
            <!-- section end -->
        </div>
                
        <script>
            
        $(function () {
            
            $("#submit-workspace").click(function (e) {
                e.preventDefault();
                e.stopImmediatePropagation();
                try {
                    var _id = $(this).attr("id-workspace");                
                    var _description = getValOrThrow("#approval-description", "Descrição/Mensagem");
                    var params = {id: _id, description: _description};
                    postRefreshParams("<c:url value="/api/approve/workspace/submit"/>", params);
                } 
                catch (e) {
                    alert(e);                    
                }
                return false;
            });//save

            $("#submit-vote").click(function (e) {
                e.preventDefault();
                e.stopImmediatePropagation();
                
                var vote = new Object();
                vote.user= new Object();
                vote.user.id = ${user.id}
                vote.approval= new Object();
                vote.approval.id = $(this).attr("id-approval");
                
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

                postRefreshJson("<c:url value="/api/approve/workspace/vote"/>", vote);
                return false;
            });//save

        });
                    
        function postRefreshParams($action, $params)
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
                    window.location = "<c:url value="/project/update/${workspace.project.id}"/>";
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


