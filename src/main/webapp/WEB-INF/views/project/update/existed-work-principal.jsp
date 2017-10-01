<%-- 
    Document   : existed-workspaces
    Created on : Sep 7, 2017, 4:58:32 PM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="panel panel-info">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion-containner"  href="#collapse-workspace-principal" class="collapsed" aria-expanded="false">
                <i class="fa fa-code-fork pr-10"></i>
                Espaços de Trabalho Principais
            </a>
        </h4>
    </div>
    <div id="collapse-workspace-principal" class="panel-collapse collapse" aria-expanded="false" >
        <div class="panel-body">

            <div class="row" >
                <div class="col-md-12" >
                    <div class="panel-group collapse-contextual" id="accordion-workspace-principal">

                        <c:forEach items="${workPrincipals}" var="workspace" varStatus="loop">

                            <div class="panel panel-success">
                                <div class="panel-heading ">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" class="collapsed" data-parent="#accordion-workspace-principal" href="#collapse-workspace-${workspace.id}" aria-expanded="false">
                                            Espaço de Trabalho: ${workspace.name} ${workspace.version}
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-workspace-${workspace.id}" class="panel-collapse collapse" aria-expanded="false" >
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="main col-md-10 col-md-offset-1 ">
                                                <div class="form-group">
                                                    <c:set var="baseId" value=""/>
                                                    <c:if test="${workspace.base != null}">
                                                        <c:set var="baseId" value="${workspace.base.id}"/>
                                                    </c:if>
                                                    <input type="hidden" id="workspace-${workspace.id}-base-id" value="${baseId}" />
                                                    <input type="hidden" id="workspace-${workspace.id}-version" value="${workspace.version}" />
                                                    <input type="hidden" id="workspace-${workspace.id}-owner-id" value="${workspace.owner.id}" />
                                                    <label for="workspace-${workspace.id}-name">Nome do Espaço de Trabalho</label>
                                                    <input type="text" required="" maxlength="45" class="form-control workspace-${workspace.id}" id="workspace-${workspace.id}-name" value="${workspace.name}" ${readonly}>
                                                </div>
                                                <div class="form-group">
                                                    <label for="workspace-${workspace.id}-description">Descrição/Objetivo</label>
                                                    <textarea required="" maxlength="390" class="form-control workspace-${workspace.id}" id="workspace-${workspace.id}-description" rows="3">${workspace.description}</textarea>
                                                </div>	
                                                <div class="form-group">
                                                    <label class="control-label">Recursos do Trabalho</label>
                                                    <c:forEach items="${workspace.resources}" var="resource" varStatus="loop2">                                                                                                                                                                        
                                                        <div >
                                                            <input id="workspace-${workspace.id}-file-${resource.id}" id-resource="${resource.id}" type="file" >
                                                        </div>                                                            
                                                    </c:forEach>                                                    
                                                    <p class="help-block">Arquivos nescessários para produção da música.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="main col-md-3 "></div>
                                            <div class="main col-md-8 ">
                                                <button type="button" id-workspace="${workspace.id}" class="btn btn-animated btn-submit-release-modal btn-success post-submit-hidden" >
                                                    Publicar Itens <i class="fa fa-music"></i>
                                                </button>
                                                <button type="button" id-workspace="${workspace.id}" class="btn btn-animated btn-save-workspace-principal-data btn-default post-submit-hidden " >
                                                    Salvar Alterações <i class="fa fa-check"></i>
                                                </button>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>  

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>