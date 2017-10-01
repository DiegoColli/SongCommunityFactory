<%-- 
    Document   : others
    Created on : Aug 2, 2017, 10:51:41 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="tab-pane fade" id="htab2">
    <h3 class="text-center">Enviar um e-mail de convite para seus amigos pedindo para que eles também façam parte do SongCommunityFactory</h3>
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <label for="project-types">
                    Adicione os e-mails na lista abaixo <i>(Novos campos vão surgindo a medida em que os e-mails vão sendo informados)</i>
                </label>

                <input type="email" class="user-emails form-control"  maxlength="150" placeholder="Informe o e-mail número 1" oninvalid="getVal(this, 'E-mail número 1')" >
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  2" oninvalid="getVal(this, 'E-mail número 2')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  3" oninvalid="getVal(this, 'E-mail número 3')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  4" oninvalid="getVal(this, 'E-mail número 4')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  5" oninvalid="getVal(this, 'E-mail número 5')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  6" oninvalid="getVal(this, 'E-mail número 6')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  7" oninvalid="getVal(this, 'E-mail número 7')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  8" oninvalid="getVal(this, 'E-mail número 8')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  9" oninvalid="getVal(this, 'E-mail número 9')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  10" oninvalid="getVal(this, 'E-mail número 10')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  11" oninvalid="getVal(this, 'E-mail número 11')">
                <input type="email" class="user-emails hidden form-control"  maxlength="150" placeholder="Informe o e-mail número  12" oninvalid="getVal(this, 'E-mail número 12')">                
            </div>

            <div class="form-group">
                <label for="user-others-message">O Texto abaixo será enviado no e-mail</label>
                <textarea id="user-others-message" maxlength="190" class="form-control" oninvalid="getVal(this, 'Texto de Convite para seus Amigos')" rows="3"></textarea>
            </div>	
        </div>        
    </div>
</div>
