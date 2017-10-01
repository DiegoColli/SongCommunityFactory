<%-- 
    Document   : step-1
    Created on : Aug 9, 2017, 7:36:10 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="conversation-warning" tabindex="-1" role="dialog" aria-labelledby="conversation-warning-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="conversation-warning-label">Notificação de Aprovação de Espaço de Trabalho</h4>
            </div>
            <div class="modal-body">
                <p>
                    Aprovações de Espaço de Trabalho dizem respeito a um pedido feito por um usuário referente
                    a um espaço de trabalho pertencente a um projeto coletivo do qual você faz parte.
                </p>
                <p>
                    Um espaço de trabalho aprovado se torna um espaço de trabalho principal, assim qualquer usuário
                    pertencente ao projeto terá acesso ao mesmo.
                </p>
                <p>
                    Um espaço de trabalho é aprovado mediante o voto positivo da metade dos indivíduos do projeto. 
                    Ou em até três dias após o pedido de aprovação do mesmo, sem que os votos negativos tenham 
                    ultrapassado a metade dos individuos do projeto                    
                </p>      
                <p>
                    <strong>Para votar basta acessar o projeto e clicar no link da caixa de alerta sobre aprovações pendentes</strong>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>               
            </div>
        </div>
    </div>
</div>