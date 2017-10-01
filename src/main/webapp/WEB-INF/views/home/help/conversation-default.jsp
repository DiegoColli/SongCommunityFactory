<%-- 
    Document   : step-1
    Created on : Aug 9, 2017, 7:36:10 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="conversation-default" tabindex="-1" role="dialog" aria-labelledby="conversation-default-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="conversation-default-label">Notificação de Aprovação de Publicação no SongCommunityFactory</h4>
            </div>
            <div class="modal-body">
                <p>
                    Publicações de recursos dizem respeito a um pedido feito por um usuário referente
                    a recursos pertencentes um espaço de trabalho principal dentro de um projeto coletivo do qual você faz parte.
                </p>
                <p>
                    Uma publicação aprovada disponibiliza para download suas músicas ou videos no site SongCommunityFactory.
                </p>
                <p>
                    Uma publicação é aprovada mediante o voto positivo de todos os indivíduos do projeto. 
                    Ou em até três dias após o pedido de aprovação do mesmo, se nenhum dos integrantes do projeto votar contra.                    
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