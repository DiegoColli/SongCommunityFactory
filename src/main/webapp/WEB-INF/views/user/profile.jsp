<%-- 
    Document   : profile
    Created on : Sep 4, 2017, 6:14:57 PM
    Author     : Diego
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${model != null}">
    
    <div class="main col-md-12" >

        <div class="panel-group collapse-style-2" id="accordion-containner-2">
            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion-containner-2" href="#collapse-new-2" aria-expanded="true">
                            <i class="fa fa-user pr-10"></i>
                            Perfil do Usuário ${model.username}                            
                        </a>
                    </h4>
                </div>

                <div id="collapse-new-2" class="panel-collapse collapse in" aria-expanded="true" >
                    <div class="panel-body">
                        <div class="row">
                            <div class="main col-md-10 col-md-offset-1 ">
                                <div class="form-group col-md-8">
                                    <label >Usuário SongCommunityFactory desde: ${model.createdBr} </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="main col-md-10 col-md-offset-1 ">
                                <div class="form-group col-md-8">
                                    <label >Quantidade de Projetos Criados: ${f:length(model.projects)} </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="main col-md-10 col-md-offset-1 ">
                                <div class="form-group col-md-8">
                                    <label >Quantidade de Projetos em que participa: ${f:length(model.contracts)} </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="main col-md-10 col-md-offset-1 ">
                                <div class="form-group col-md-8">
                                    <label >Quantidade de Amigos: ${f:length(model.friends)} </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

</c:if>
