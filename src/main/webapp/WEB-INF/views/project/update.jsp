<%-- 
    Document   : existing-form
    Created on : Jul 22, 2017, 6:31:55 AM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="panel-group collapse-contextual" id="accordion-containner">
    <!--hack to keep the same as new jsp-->
    <form></form>
    
    <!--approvals-->
    <div class="container">
        <div class="container row">
            <c:import url="/WEB-INF/views/project/update/approvals.jsp" />
        </div>
    </div>
    
    <!--messages main-->
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion-containner"  href="#collapse-notifications" class="collapsed" aria-expanded="false">
                    <i class="fa fa-info-circle pr-10"></i>
                    Notificações / Conversas
                </a>
            </h4>
        </div>
        <div id="collapse-notifications" class="panel-collapse collapse" aria-expanded="false" >
            <div class="panel-body">                
                <c:import url="/WEB-INF/views/project/update/conversations.jsp" />              
            </div>
        </div>
    </div>
    <!--existed-messages-->

    <!--project main-->
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion-containner" class="collapsed" href="#collapse-project" aria-expanded="false" >
                    <i class="fa fa-folder-open pr-10"></i>
                    Dados do Projeto - ${model.name}
                </a>
            </h4>
        </div>
        <div id="collapse-project" class="panel-collapse collapse" aria-expanded="false">
            <div class="panel-body">
                <c:import url="/WEB-INF/views/project/update/proj-data.jsp" /> 
            </div>
        </div>
    </div>
    <!--end-project-main-->

    <!--start-workspaces-->

    <!--new-workspaces-->
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion-containner"  href="#collapse-new-workspace" class="collapsed" aria-expanded="false">
                    <i class="fa fa-code-fork pr-10"></i>
                    Criar novo Espaço de Trabalho                    
                </a>
            </h4>
        </div>
        <div id="collapse-new-workspace" class="panel-collapse collapse " aria-expanded="false" >
            <div class="panel-body">
                <c:import url="/WEB-INF/views/project/update/new-workspace.jsp" /> 
            </div>
        </div>
    </div>

    <!--existed-principal-workspaces-->
    <c:import url="/WEB-INF/views/project/update/existed-work-principal.jsp" />

    <!--existed-others-workspaces-->
    <c:import url="/WEB-INF/views/project/update/existed-work.jsp" /> 

    <!--end-workspaces-->

    <!--start-contributors-->
    <div class="panel panel-info ">
        <div class="panel-heading ">
            <h4 class="panel-title ">
                <a data-toggle="collapse" data-parent="#accordion-containner"  href="#collapse-contact" class="collapsed" aria-expanded="false">
                    <i class="fa fa-group pr-10"></i>
                    Solicitar Ajuda
                </a>
            </h4>
        </div>
        <div id="collapse-contact" class="panel-collapse collapse" aria-expanded="false">
            <div class="panel-body">

                <div class="row">
                    <div class="main col-md-10 col-md-offset-1 ">
                        <br />
                        <ul class="nav nav-tabs style-1" role="tablist">
                            <c:if test="${model.owner.id == user.id}">
                                <li class="active"><a href="#htab1" role="tab" data-toggle="tab"><i class="pl-10 pr-10 fa fa-life-saver"></i>Pedir Ajuda</a></li>
                                <li><a href="#htab2" role="tab" data-toggle="tab"><i class="fa fa-envelope pr-10 pl-10 "></i>Outros</a></li>
                                <li><a href="#htab3" role="tab" data-toggle="tab"><i class="pl-10 pr-10 fa icon-users"></i>Amigos SCF</a></li>
                            </c:if>
                            <c:if test="${model.owner.id != user.id}">                                
                                <li class="active"><a href="#htab2" role="tab" data-toggle="tab"><i class="fa fa-envelope pr-10 pl-10 "></i>Outros</a></li>                                
                            </c:if>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <c:if test="${model.owner.id == user.id}">
                                <c:import url="/WEB-INF/views/project/update/help.jsp" />
                                <c:import url="/WEB-INF/views/project/update/others.jsp" />
                                <c:import url="/WEB-INF/views/project/update/friends.jsp" />
                            </c:if>
                            <c:if test="${model.owner.id != user.id}">
                                <c:import url="/WEB-INF/views/project/update/others.jsp" />
                            </c:if>
                        </div>
                    </div>
                </div>	

                <div class="row">
                    <div class="main col-md-5 ">
                    </div>
                    <div class="main col-md-6 ">
                        <button type="submit" id="btn-submit-help" class="btn btn-animated btn-default post-submit-hidden" >Salvar <i class="fa fa-check"></i></button>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--end-contributors-->
        
    <c:import url="/WEB-INF/views/project/update/modals.jsp" /> 
    
</div>