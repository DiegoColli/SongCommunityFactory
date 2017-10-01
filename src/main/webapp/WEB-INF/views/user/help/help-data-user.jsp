<%-- 
    Document   : step-1
    Created on : Aug 9, 2017, 7:36:10 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="help-data-user" tabindex="-1" role="dialog" aria-labelledby="help-data-user-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="help-data-user-label">Meus Dados</h4>
            </div>
            <div class="modal-body">
                <p>Aqui você preenche e visualiza seus dados de usuário.</p>     
                <p>Obs.: Nós iremos utilizar o campo "preferência musical" para escolher quais anúcios de solicitação de ajuda você verá</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>