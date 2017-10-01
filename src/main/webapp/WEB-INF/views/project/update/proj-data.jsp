<%-- 
    Document   : others
    Created on : Aug 2, 2017, 10:51:41 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
    <div class="main col-md-10 col-md-offset-1 ">
        <div class="form-group">
            <input type="hidden" id="id" value="${model.id}" />
            <input type="hidden" id="owner-id" value="${model.owner.id}" />
            <label for="project-name">Nome do Projeto</label>
            <input type="text" maxlength="45" required=""  id="project-name" class="form-control" value="${model.name}">
        </div>
        <div class="form-group">
            <label for="project-band-name">Nome do Grupo ou Banda (Se houver)</label>
            <input type="text" maxlength="45" class="form-control" id="project-band-name" value="${model.bandName}" >
        </div>                
        <div class="form-group col-md-6">
            <label for="project-types">Desejo Criar</label>
            <select multiple="" id="project-types" class="form-control">
                <c:forEach items="${types}" var="item">
                    <c:set var="selected" value=""/>
                    <spring:eval var="containsValue" expression="model.types.contains(item)" />
                    <c:if test="${containsValue}">
                        <c:set var="selected" value="selected"/>
                    </c:if>
                    <option ${selected}  value="${item.id}">${item.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group col-md-6">
            <label for="project-styles">Estilo</label>
            <select multiple="" id="project-styles" class="form-control" >
                <c:forEach items="${styles}" var="item">
                    <c:set var="selected" value=""/>
                    <spring:eval var="containsValue" expression="model.styles.contains(item)" />
                    <c:if test="${containsValue}">
                        <c:set var="selected" value="selected"/>
                    </c:if>
                    <option ${selected} value="${item.id}">${item.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="project-description">Descrição/Objetivo</label>
            <textarea id="project-description" maxlength="390" class="form-control" required="" rows="3">${model.description}</textarea>															
        </div>	
    </div>
</div>                        
<div class="row">
    <div class="main col-md-5 "></div>
    <div class="main col-md-6 ">
        <button type="button" id="btn-project-data" class="btn btn-animated btn-success post-submit-hidden" >
            Salvar Alterações <i class="fa fa-check"></i>
        </button>
    </div>
</div>                        