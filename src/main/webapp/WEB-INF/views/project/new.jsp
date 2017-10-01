<%-- 
    Document   : new
    Created on : Jul 22, 2017, 6:22:30 AM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="panel-group collapse-contextual" id="accordion-containner">

    <form role="form" id="form-project" action="<c:url value="/api/project/create"/>" method="POST" enctype="multipart/form-data">

        <!--start-project-main-->
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-containner" href="#collapse-new-0" aria-expanded="true">
                        <i class="fa fa-folder-open pr-10"></i>
                        Passo 1 - Dados do Projeto
                        <i data-toggle="modal" data-target="#step-1" class="fa fa-question-circle pl-10"></i>
                    </a>
                </h4>
            </div>
            <div id="collapse-new-0" class="panel-collapse collapse in" aria-expanded="true" >
                <div class="panel-body">
                    <div class="row">
                        <div class="main col-md-10 col-md-offset-1 ">
                            <div class="form-group">
                                <input type="hidden" id="id" value="0" />
                                <label for="project-name">Nome do Projeto</label>
                                <input type="text" required="" maxlength="45" oninvalid="getVal(this, 'Nome do Projeto')" class="form-control" id="project-name" placeholder="Nome do Projeto">
                            </div>
                            <div class="form-group">
                                <label for="project-band-name">Nome do Grupo ou Banda (Se houver)</label>
                                <input type="text" maxlength="45" oninvalid="getVal(this, 'Nome do Grupo ou Banda')" class="form-control" id="project-band-name" placeholder="Nome do Grupo/Banda">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="project-types">
                                    Desejo Criar <i>(pressione Ctrl para selecionar mais de uma opção)</i>
                                </label>
                                <select multiple="" id="project-types" class="form-control">
                                    <c:forEach items="${types}" var="item">
                                        <option value="${item.id}">${item.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="project-styles">
                                    Estilo <i>(pressione Ctrl para selecionar mais de uma opção)</i>
                                </label>
                                <select multiple="" id="project-styles" class="form-control" >
                                    <c:forEach items="${styles}" var="item">
                                        <option value="${item.id}">${item.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="project-description">Descrição</label>
                                <textarea id="project-description" oninvalid="getVal(this, 'Descrição')" maxlength="390" required="" class="form-control" rows="3"></textarea>
                            </div>	
                        </div>
                    </div>
                </div><!--end-project body-->
            </div>
        </div>
        <!--end-project-main-->

        <!--start-workspaces-->
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-containner" href="#collapse-new-0-0" class="accordion-header-workspace" aria-expanded="true">
                        <i class="fa fa-code-fork pr-10"></i>
                        Passo 2 - Espaço de Trabalho Principal
                        <i data-target="#step-2" data-toggle="modal" class="fa fa-question-circle pl-10 "></i>

                    </a>
                </h4>
            </div>
            <div id="collapse-new-0-0" class="panel-collapse collapse in" aria-expanded="true" >
                <div class="panel-body">
                    <div class="row">
                        <div class="main col-md-10 col-md-offset-1 ">
                            <div class="form-group">
                                <input type="hidden" id="project-workspaces-count" value="1" />
                                <input type="hidden" id="workspace-0-id" value="0" />
                                <label for="workspace-0-name">Nome do Espaço de Trabalho Principal</label>
                                <input type="text" class="form-control workspace-0" id="workspace-0-name" maxlength="25" value="Pricipal" readonly="">
                            </div>
                            <div class="form-group">
                                <label for="workspace-0-description">Descrição/Objetivo</label>
                                <textarea class="form-control workspace-0" id="workspace-0-description" oninvalid="getVal(this, 'Descrição/Objetivo')" maxlength="390" required="" rows="3"></textarea>
                            </div>	
                            <div class="form-group">
                                <label class="control-label">Recursos do Trabalho</label>
                                <c:set var="rows" value="11"/>
                                <c:set var="index" value="2"/>
                                <div>
                                    <input class="file-project" id="file-0-1-file" next-div="file-0-${index}-div" type="file" >
                                </div>
                                <!--input file blocks-->
                                <c:forEach var="i" begin="1" end="${rows}">
                                    <div class="hidden" id="file-0-${index}-div" >
                                        <input class="file-project" id="file-0-${index}-file" next-div="file-0-${index+1}-div" type="file" >
                                    </div>
                                    <c:set var="index" value="${index+1}"/>
                                </c:forEach>
                                <p class="help-block">Arquivos nescessários para produção da música.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                                
        </div>
        <!--end-workspaces-->

        <!--start-contributors-->
        <div class="panel panel-info ">
            <div class="panel-heading ">
                <h4 class="panel-title ">
                    <a data-toggle="collapse" data-parent="#accordion-containner"  href="#collapse-new-0-0-0" class="accordion-header-users" aria-expanded="true">
                        <i class="fa fa-group pr-10"></i>
                        Passo 3 - Solicitar Ajuda 
                        <i data-target="#step-3" data-toggle="modal" class="fa fa-question-circle pl-10"></i>
                    </a>
                </h4>
            </div>
            <div id="collapse-new-0-0-0" class="panel-collapse collapse in" aria-expanded="true">
                <div class="panel-body">
                    <div class="row">
                        <div class="main col-md-10 col-md-offset-1 ">
                            <br />
                            <ul class="nav nav-tabs style-1" role="tablist">
                                <li class="active"><a href="#htab1" role="tab" data-toggle="tab"><i class="pl-10 pr-10 fa fa-life-saver"></i>Pedir Ajuda</a></li>
                                <li><a href="#htab2" role="tab" data-toggle="tab"><i class="fa fa-envelope pr-10 pl-10 "></i>Outros</a></li>
                                <li><a href="#htab3" role="tab" data-toggle="tab"><i class="pl-10 pr-10 fa icon-users"></i>Amigos SCF</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <c:import url="/WEB-INF/views/project/new/help.jsp" />
                                <c:import url="/WEB-INF/views/project/new/others.jsp" />
                                <c:import url="/WEB-INF/views/project/new/friends.jsp" />                                                    
                            </div>
                        </div>
                    </div>	
                    <br />
                    <br />                    
                </div>
            </div>
        </div>
        <!--end-contributors-->

        <br />

        <div class="container">
            <div class="row">
                <div class="main col-md-5 "></div>
                <div class="main col-md-6 ">
                    <button type="submit" class="btn btn-animated btn-success submit-project post-submit-hidden" >
                        Criar Projeto <i class="fa fa-check"></i>
                    </button>
                </div>
            </div>
        </div>

    </form>
</div>
