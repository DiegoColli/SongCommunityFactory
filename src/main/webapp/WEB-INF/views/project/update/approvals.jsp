<%-- 
    Document   : help-messages
    Created on : Sep 2, 2017, 7:14:00 AM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row col-md-12">
    
    <c:if test="${f:length(model.approvalWorkspaces) gt 0}">
        <c:forEach items="${model.approvalWorkspaces}" var="approval">
            <div class="alert alert-warning alert-dismissible">
                <button type="button" class="close" id-approval="${approval.id}" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <i class="fa fa-warning pr-10"></i>
                
                Solicitação de Aprovação de Espaço de Trabalho feita por: ${approval.workspace.owner.username}
                <a href="<c:url value="/comparison/approve/workspace/${approval.workspace.id}"/>" class="alert-link">
                    Visualizar/Votar
                </a>
                
            </div>
        </c:forEach>
    </c:if>
    
    <c:if test="${f:length(model.approvalPublishings) gt 0}">
        <c:forEach items="${model.approvalPublishings}" var="approval">
            <!--maibe alert-default but needs to be equal panel-default-->
            <div class="alert alert-default alert-dismissible">
                <button type="button" class="close" id-approval="${approval.id}" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <i class="fa fa-warning pr-10"></i>
                
                Solicitação de Aprovação de Publicação
                <a href="<c:url value="/publish/solicitation/publishing/${approval.id}"/>" class="alert-link">
                    Visualizar/Votar
                </a>
                
            </div>
        </c:forEach>
    </c:if>
    
</div>