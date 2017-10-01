<%-- 
    Document   : step-1
    Created on : Aug 9, 2017, 7:36:10 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="help-my-open-proj" tabindex="-1" role="dialog" aria-labelledby="help-my-open-proj-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="help-my-open-proj-label">Meus Pedidos de Ajuda Abertos</h4>
            </div>
            <div class="modal-body">
                <p>Aqui você visualiza seus pedidos de ajuda abertos.</p>
                <p>Você pode aceitar ou recusar uma proposta de ajuda ou iniciar uma conversa a respeito do projeto antes de tomar sua decisão</p>
                <p>Você pode alterar seu pedido de ajuda ou finaliza-lo quando achar que já obteve ajuda o suficiente.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>                
            </div>
        </div>
    </div>
</div>