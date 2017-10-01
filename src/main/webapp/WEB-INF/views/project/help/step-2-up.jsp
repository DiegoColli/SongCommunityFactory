<%-- 
    Document   : step-1
    Created on : Aug 9, 2017, 7:36:10 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="step-2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="myModalLabel2">Passo 2 - Espaço de Trabalho Principal</h4>
            </div>
            <div class="modal-body">
                <p>Esse será o seu espaço de trabalho principal, é onde tudo começa.</p>
                <p>
                    O Espaço de trabalho principal é um ponto consistente comum a todos os usuários dentro de projeto.
                    Espaços de trabalho secundarios normalmente serão criados por vários usuários por diversos motivos.
                    Espaços de trabalho secundarios  são como um espaço único dentro do projeto para se armazenar recursos temporários,
                    uma vez que se tenha chegado ao resultado esperado o úsuario deve submeter o seu espaço de trabalho para aprovação 
                    por outros úsarios. Uma vez aprovado o espaço de trabalho secundario sera fundido ao espaço de trabalho principal, mantendo
                    os recursos escolhidos.                    
                </p>
                <p>Não esqueça também de adicionar os recursos iniciais comuns que serão a base para o ponta pé inicial do projeto,
                você pode adicionar até 12 recursos nessa primeira fase do projeto</p>                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-sm btn-default">Save changes</button>
            </div>
        </div>
    </div>
</div>