<%-- 
    Document   : data-user
    Created on : Aug 15, 2017, 1:37:39 PM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="main col-md-12" >

    <div class="panel-group collapse-style-2" id="accordion-containner-0">
        <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-containner-0" href="#collapse-new-0" aria-expanded="true">
                        <i class="fa  fa-user pr-10"></i>
                        Meus Dados
                        <i data-toggle="modal" data-target="#help-data-user" class="fa fa-question-circle pl-10"></i>
                    </a>
                </h4>
            </div>

            <div id="collapse-new-0" class="panel-collapse collapse in" aria-expanded="true" >
                <div class="panel-body">
                    <div class="row">
                        <div class="main col-md-10 col-md-offset-1 ">
                            <form role="form" id="form-update">
                                <input type="hidden" id="id" value="${model.id}" />

                                <div class="form-group">
                                    <label for="username" class="control-label">Nome</label>
                                    <input type="text" class="form-control" id="username" value="${model.username}" required="" maxlength="45" oninvalid="getVal(this, 'Nome')">
                                </div>

                                <div class="form-group">
                                    <label for="email" class=" control-label">E-mail</label>
                                    <input type="email" class="form-control" id="email" value="${model.email}" required="" maxlength="190"  oninvalid="getVal(this, 'E-mail')">
                                </div>

                                <div class="form-group">
                                    <label for="update-password" class="control-label">Alterar Senha: </label>
                                    <input type="checkbox" id="update-password">
                                </div>
                                
                                <div class="form-group">
                                    <label for="password" class="control-label">Senha</label>
                                    <input type="password" maxlength="20" class="form-control" id="password" placeholder="Senha" disabled="" oninvalid="getVal(this, 'Senha')" >
                                </div>

                                <div class="form-group">
                                    <label for="confirm-password" class="control-label">Confirme a Senha</label>
                                    <input type="password" maxlength="20" class="form-control" disabled="" id="confirm-password" placeholder="Confirme a Senha" oninvalid="getVal(this, 'Confirme a Senha')" >
                                </div>

                                <div class="form-group">
                                    <label for="project-styles" class="control-label">
                                        Preferência Musical <i>(pressione Ctrl para selecionar mais de uma opção)</i>
                                    </label>

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
                                    <div class="col-sm-offset-10 col-sm-2">
                                        <button id="submit-btn" type="submit" class="btn btn-sm btn-animated btn-default post-submit-hidden" >Confirmar <i class="fa fa-check"></i></button>
                                    </div>                                    
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
