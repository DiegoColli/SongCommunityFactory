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
            <a data-toggle="collapse" data-parent="#accordion-containner"  href="#collapse-workspace-other" class="collapsed" aria-expanded="false">
                <i class="fa fa-code-fork pr-10"></i>
                Meus Espaços de Trabalho
            </a>
        </h4>
    </div>
    <div id="collapse-workspace-other" class="panel-collapse collapse" aria-expanded="false" >
        <div class="panel-body">

            <div class="row" >
                <div class="col-md-12" >
                    <div class="panel-group collapse-contextual" id="accordion-workspace-other">

                        <c:forEach items="${workOthers}" var="workspace" varStatus="loop">

                            <div class="panel panel-success">
                                <div class="panel-heading ">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" class="collapsed" data-parent="#accordion-workspace-other" href="#collapse-workspace-${workspace.id}" aria-expanded="false">
                                            Espaço de Trabalho: ${workspace.name}
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse-workspace-${workspace.id}" class="panel-collapse collapse" aria-expanded="false" >
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="main col-md-10 col-md-offset-1 ">
                                                <div class="form-group">
                                                    <input type="hidden" id="workspace-${workspace.id}-base-id" value="${workspace.base.id}" />
                                                    <input type="hidden" id="workspace-${workspace.id}-version" value="${workspace.version}" />                                                    
                                                    <label for="workspace-${workspace.id}-name">Nome do Espaço de Trabalho</label>
                                                    <input required="" maxlength="45" type="text" class="form-control workspace-${workspace.id}" id="workspace-${workspace.id}-name" value="${workspace.name}" ${readonly}>
                                                </div>
                                                <div class="form-group">
                                                    <label for="workspace-${workspace.id}-description">Descrição/Objetivo</label>
                                                    <textarea required="" maxlength="390" class="form-control workspace-${workspace.id}" id="workspace-${workspace.id}-description" rows="3">${workspace.description}</textarea>															
                                                </div>	

                                                <div class="form-group">
                                                    <label class="control-label">Recursos do Trabalho</label>
                                                    <c:forEach items="${workspace.resources}" var="resource" varStatus="loop2">                                                                                                                                                                        
                                                        <div >
                                                            <input deleted="false" updated="false" class="workspace-file-other" id="workspace-${workspace.id}-file-${resource.id}" id-resource="${resource.id}" type="file" >
                                                        </div>                                                            
                                                    </c:forEach>                                                    
                                                    <p class="help-block">Arquivos nescessários para produção da música.</p>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label">Adicionar Recursos ao Trabalho</label>
                                                    <c:set var="rows" value="11"/>
                                                    <c:set var="index" value="2"/>
                                                    <div>
                                                        <input class="workspace-file-new" id="workspace-${workspace.id}-1-file" id-workspace="${workspace.id}" next-div="workspace-${workspace.id}-${index}-div" type="file" >
                                                    </div>
                                                    <!--input file blocks-->
                                                    <c:forEach var="i" begin="1" end="${rows}">
                                                        <div class="hidden" id="workspace-${workspace.id}-${index}-div" >
                                                            <input class="workspace-file-new" id-workspace="${workspace.id}" next-div="workspace-${workspace.id}-${index+1}-div" type="file" >
                                                        </div>
                                                        <c:set var="index" value="${index+1}"/>
                                                    </c:forEach>
                                                    <p class="help-block">Arquivos nescessários para produção da música.</p>
                                                </div>
                                            </div>
                                        </div>

                                        <c:if test="${!workspace.blocked}">
                                            <div class="row">
                                                <div class="main col-md-10 col-md-offset-1">                                                
                                                    <button type="button" id-workspace="${workspace.id}" class="btn btn-animated btn-remove-workspace-data btn-danger post-submit-hidden" >
                                                        Excluir  <i class="fa fa-remove "></i>
                                                    </button>     
                                                    <button type="button" id-workspace="${workspace.id}" class="btn btn-animated btn-submit-workspace-modal btn-success post-submit-hidden" >
                                                        Submeter para Aprovação <i class="fa fa-check"></i>
                                                    </button>
                                                    <button type="button" id-workspace="${workspace.id}" class="btn btn-animated btn-save-workspace-data btn-default post-submit-hidden" >
                                                        Salvar Alterações  <i class="fa fa-check"></i>
                                                    </button>    
                                                </div>
                                            </div>
                                        </c:if>                                                    
                                        <c:if test="${workspace.blocked}">
                                            <div class="row">
                                                <div class="main col-md-10 col-md-offset-1">                                                    
                                                    <div class="alert alert-danger" role="alert">
                                                        Este  espaço de trabalho esta bloqueado para edição!  
                                                    </div>                                                    
                                                </div>
                                            </div>
                                        </c:if>            
                                                    
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