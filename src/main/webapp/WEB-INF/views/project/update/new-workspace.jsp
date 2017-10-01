<%-- 
    Document   : new-workspace
    Created on : Sep 7, 2017, 4:56:20 PM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
    <div class="main col-md-10 col-md-offset-1 ">
        <div class="form-group">
            <label for="workspace-0-name">Nome do Espaço de Trabalho</label>
            <input type="text" class="form-control workspace-0" id="workspace-0-name" required="" maxlength="45" placeholder="Nome do Espaço de Trabalho" >
        </div>
        <div class="form-group">
            <label for="workspace-0-description">Descrição/Objetivo</label>
            <textarea class="form-control workspace-0" id="workspace-0-description" required="" maxlength="390" rows="3"></textarea>
        </div>	
        <div class="form-group">
            Versão do espaço de trabalho principal que será utilizado como base
            <select id="workspace-base" class="form-control" >
                <c:forEach items="${model.workspaces}" var="workspace" varStatus="loop">
                    <c:if test="${workspace.principal}">
                        <option version="${workspace.version}" value="${workspace.id}" >${workspace.name} - ${workspace.version}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
    </div>
</div>
<div class="row">
    <div class="main col-md-5 "></div>
    <div class="main col-md-6 ">
        <button type="button" id="btn-new-workspace" class="btn btn-animated btn-success post-submit-hidden" >
            Criar Novo Espaço de Trabalho <i class="fa fa-check"></i>
        </button>
    </div>
</div>                        