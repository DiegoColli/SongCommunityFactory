<%-- 
    Document   : script
    Created on : Sep 2, 2017, 5:32:08 PM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    $(function () {

//---------------------------------------CONVERSATIONS--------------------------

        $(".finish-conversation").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var _id = $(this).attr("id-conversation");
            var params = {id: _id};
            postRefreshParams("<c:url value="/api/conversation/finish"/>", params);
            return false;
        });//save

        $(".reopen-conversation").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var _id = $(this).attr("id-conversation");
            var params = {id: _id};
            postRefreshParams("<c:url value="/api/conversation/reopen"/>", params);
            return false;
        });//save

        $(".continue-conversation").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();            
            try {                
                var _id = $(this).attr("id-conversation");
                var _message = getValOrThrow("#message-conversation-" + _id, "Mensagem");
                var params = {id: _id, message: _message};                
                postRefreshParams("<c:url value="/api/conversation/continue"/>", params);   
            } 
            catch (e) {
                alert(e);
            }
            return false;
        });//save

        $("#btn-new-notification").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();

            try {    
                var userLogged = new Object();
                userLogged.id = ${user.id};
                userLogged.username = "${user.username}";

                var notification = new Object();
                notification.open = 1;
                notification.level = 0;
                notification.title = getValOrThrow("#notification-title", "Título da Notificação");
                notification.createdBy = userLogged;
                notification.project = new Object();
                notification.project.id = $("#id").val();
                notification.messages = [];
                notification.users = [];
                notification.users.push(userLogged);

                var message = new Object();
                message.phrase = getValOrThrow("#notification-phrase", "Mensagem");
                message.from = userLogged;
                message.userMessageStatus = [];

                var friendsSelector = "#project-contracts option:selected";
                $(friendsSelector).each(function (i, selected) {
                    var user = new Object();
                    user.id = $(selected).val();
                    user.username = $(selected).text();

                    var userMessageStatus = new Object();
                    userMessageStatus.user = user;
                    userMessageStatus.status = 0;

                    message.userMessageStatus.push(userMessageStatus);
                    notification.users.push(user);
                });

                if(message.userMessageStatus.length == 0)
                    throw "Selecione ao menos um destinatário!";
                    
                notification.messages.push(message);

                postRefreshJson("<c:url value="/api/notification/new"/>", notification);
            } 
            catch (e) {
                alert(e);
            }
            
            return false;
        });//save        

//----------------------------------PROJECT-DATA--------------------------------        

        $("#btn-project-data").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();

            try {
                var owner = new Object();
                owner.id = $("#owner-id").val();

                var project = new Object();
                project.id = $("#id").val();
                project.name = getValOrThrow("#project-name", "Nome do Projeto");
                project.bandName = getValOrThrow("#project-band-name", "Nome do Grupo");
                project.description = getValOrThrow("#project-description","Descrição/Objetivo");
                project.owner = owner;

                //styles
                var styles = [];
                var stylesSelector = "#project-styles option:selected";
                $(stylesSelector).each(function (i, selected) {
                    var style = new Object();
                    style.id = $(selected).val();
                    styles.push(style);
                });
                if (!styles.length)
                {
                    var style = new Object();
                    style.id = 4; //not know yet
                    styles.push(style);
                }
                project.styles = styles;

                //types
                var types = [];
                var typesSelector = "#project-types option:selected";
                $(typesSelector).each(function (i, selected) {
                    var type = new Object();
                    type.id = $(selected).val();
                    types.push(type);
                });
                if (!types.length)
                {
                    var type = new Object();
                    type.id = 4;//not know yet
                    types.push(type);
                }
                project.types = types;

                postRefreshJson("<c:url value="/api/project/update"/>", project);
            } 
            catch (e) {
                alert(e);
            }
            
            return false;
        });//save

//----------------------------------NEW WORKSPACE-------------------------------

        $("#btn-new-workspace").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();

            try {
                var userLogged = new Object();
                userLogged.id = ${user.id};
                userLogged.username = "${user.username}";

                var workspace = new Object();
                workspace.principal = false;
                workspace.name = getValOrThrow("#workspace-0-name","Nome do Espaço de Trabalho");
                workspace.description = getValOrThrow("#workspace-0-description", "Descrição/Objetivo");
                workspace.owner = userLogged;
                workspace.project = new Object();
                workspace.project.id = $("#id").val();
                workspace.base = new Object();
                workspace.base.id = $("#workspace-base").val();
                var option = $("#workspace-base option:selected").get(0);            
                workspace.version =  parseFloat($(option).attr("version")) + parseFloat(0.1) ;
                workspace.version = round(workspace.version, 2);
                postRefreshJson("<c:url value="/api/workspace/new"/>", workspace);    
            } 
            catch (e) {
                alert(e);
            }

            return false;
        });//save

//----------------------------------EXISTED WORKSPACES OTHERS-------------------

        $(".btn-save-workspace-data").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();            
            try {
                var id = $(this).attr("id-workspace");
                var workWrapper = getWorkspaceWrapper(id);
                postRefreshJson("<c:url value="/api/workspace/update"/>", workWrapper);    
            } 
            catch (e) {
                alert(e);
            }
            return false;
        });//save
        
        $(".btn-submit-workspace-modal").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var id = $(this).attr("id-workspace");            
            $("#modal-work-id").val(id);
            $("#submit-workspace-modal").modal('show');            
            return false;
        });//save
        
        $("#btn-submit-workspace-data").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var id = $("#modal-work-id").val();
            window.location = "<c:url value="/comparison/approve/workspace/"/>"+id;
            return false;
        });//save
        
        $(".btn-remove-workspace-data").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();            
            if(window.confirm("Essa operação não pode ser desfeita\n"+
                    "Tem certeza que deseja excluír este espaço de Trabalho?"))
            {
                var _id = $(this).attr("id-workspace");
                var params = {id: _id};
                postRefreshParams("<c:url value="/api/workspace/delete"/>", params);
            }            
            return false;
        });//save

//----------------------------------EXISTED WORKSPACES PRINCIPAL----------------

        $(".btn-save-workspace-principal-data").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();            
            try {
                var id = $(this).attr("id-workspace");
                var workspace = new Object();
                workspace.principal = false;
                workspace.id = id;
                workspace.principal = true;
                workspace.name = getValOrThrow("#workspace-"+id+"-name", "Nome do Espaço de Trabalho");
                workspace.version = $("#workspace-"+id+"-version").val();
                workspace.description = getValOrThrow("#workspace-"+id+"-description","Descrição/Objetivo");
                workspace.owner = new Object();
                workspace.owner.id = $("#workspace-"+id+"-owner-id").val();
                workspace.project = new Object();
                workspace.project.id = $("#id").val();
                if($("#workspace-"+id+"-base-id").val()>0)
                {                
                    workspace.base = new Object();
                    workspace.base.id = $("#workspace-"+id+"-base-id").val();
                }

                postRefreshJson("<c:url value="/api/workspace/update/principal"/>", workspace);    
            } 
            catch (e) {
                alert(e);
            }
            return false;
        });//save
        
        $(".btn-submit-release-modal").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var id = $(this).attr("id-workspace");
            $("#modal-publishing-id").val(id);
            $("#submit-publishing-modal").modal('show');            
            return false;
        });//save        
        
        $("#btn-submit-release-items").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var id = $("#modal-publishing-id").val();
            window.location = "<c:url value="/publish/approve/"/>"+id;            
            return false;
        });//save
        
//----------------------------------help----------------------------------------

        $(".user-emails").change(function () {
            if (trim($(this).val()) != "")
            {
                if ($(this).next(".user-emails").length)
                {
                    $(this).next(".user-emails").removeClass("hidden");
                } else
                    alert("Você atingiu o valor máximo de e-mails permitido");
            }
        });

        $("#btn-submit-help").click(function (e){
            e.preventDefault();
            e.stopImmediatePropagation();            
            //help request
            try {
                var $jsonModel = getHelpResquest();
                postJson("<c:url value="/api/help/publishing"/>", $jsonModel);
            }
            catch (e) {console.log(e);}
            //others
            try {
                var $jsonModel = getHelpOthers();
                postJson("<c:url value="/api/help/others"/>", $jsonModel);
            } 
            catch (e) {console.log(e);}
            //friendship
            try {
                var $jsonModel = getHelpFriends();
                postJson("<c:url value="/api/help/friends"/>", $jsonModel);
            } 
            catch (e) {console.log(e);}
            return false;
        });
        
//----------------------------------summernote----------------------------------

        $('#request-help').summernote({
            height: 250,
            placeholder: 'Escreva aqui um pedido de ajuda bem bonito para que possamos '+ 
                    'publicar na página inicial do SongCommunityFactory',
            toolbar: [
                ['style', ['style', 'bold', 'italic', 'underline', 'clear']],
                ['fonts', ['fontname', 'fontsize', 'paragraph']],
                ['color', ['color']],
                ['height', ['height']],
                ['insert', ['video', 'picture', 'link']],
                ['misc', ['fullscreen']]
            ]
        });

    });

//end on start

//----------------------------------EXISTED WORKSPACES OTHERS-------------------

    function getWorkspaceWrapper(id)
    {
        var workspaceWrapper = new Object();

        var userLogged = new Object();
        userLogged.id = ${user.id};
        userLogged.username = "${user.username}";

        var workspace = new Object();
        workspace.principal = false;
        workspace.id = id;
        workspace.name = getValOrThrow("#workspace-"+id+"-name","Nome do Espaço de Trabalho");
        workspace.version = $("#workspace-"+id+"-version").val();
        workspace.description = getValOrThrow("#workspace-"+id+"-description","Descrição/Objetivo");
        workspace.owner = userLogged;
        workspace.project = new Object();
        workspace.project.id = $("#id").val();
        workspace.base = new Object();
        workspace.base.id = $("#workspace-"+id+"-base-id").val();

        workspaceWrapper.workspace = workspace;
        workspaceWrapper.newResources = getNewResources();
        workspaceWrapper.udpateResources = getOtherResources();
        workspaceWrapper.deletedResources = getOtherResourcesDeleted();

        return workspaceWrapper;
    }

    function getNewResources()
    {
        var resources = [];
        $(".workspace-file-new").each(function () {
            if ($(this).val())
            {
                var resource = new Object();
                resource.name = $(this)[0].files[0].name;
                resources.push(resource);
            }
        });            
        return resources;
    }

    function getOtherResources()
    {
        var resources = [];
        $(".workspace-file-other").each(function () {
            if ($(this).val() && $(this).attr("updated") == "true")
            {
                var resource = new Object();
                resource.id = $(this).attr("id-resource");
                resource.name = $(this)[0].files[0].name;
                resources.push(resource);
            }
        });
        return resources;
    }

    function getOtherResourcesDeleted()
    {
        var resources = [];
        $(".workspace-file-other").each(function () {
            if (!$(this).val() && $(this).attr("deleted") == "true")
            {
                var resource = new Object();
                resource.id = $(this).attr("id-resource");
                resources.push(resource);
            }
        });
        return resources;
    }
        
//----------------------------------help----------------------------------------


    function getHelpResquest()
    {
        var helpStr = $('#request-help').summernote('code');            
        if(helpStr.length>700)
        {
            alert("O campo Pedido de Ajuda SongCommunityFactory ultrapassou o valor máximo de 700 caracteres permitidos!");
            throw "O campo Pedido de Ajuda SongCommunityFactory ultrapassou o valor máximo de 700 caracteres permitidos!";
        }            
        var fooHelp = replaceAll(replaceAll(replaceAll(replaceAll(helpStr, ' ', ''), '<p>', ''), '</p>', ''), "<br>", '');            
        if (fooHelp != "")
        {   
            var _help;
            _help = new Object();
            _help.message = helpStr;
            _help.project = new Object();
            _help.project.id = $("#id").val();
            return _help;
        }
        else
        {
            throw "Aba pedir ajuda vazia";
        }
    }

    function getHelpOthers()
    {
        var to = [];
        $(".user-emails").each(function () {
            if (trim($(this).val()) != "")
            {
                if(!isEmail($(this).val()))
                {
                    alert("Endereço de e-mail informado não é válido!");
                    throw "Endereço de e-mail informado não é válido!";
                }

                to.push($(this).val());
            }
        });
        to = Array.from(new Set(to));//clean repeated emails

        if(to.length > 0)
        {
            var emails = [];
            $.each(to, function (index, value) {
                var email = new Object();
                email.to = value;
                email.userMessage = $("#user-others-message").val();
                if(email.userMessage.length > 190)
                {
                    alert("O campo Texto de Convite para seus Amigos ultrapassou o valor máximo de 190 caracteres permitidos!");
                    throw "O campo Texto de Convite para seus Amigos ultrapassou o valor máximo de 190 caracteres permitidos!";
                }
                email.project = new Object();
                email.project.id = $("#id").val();
                emails.push(email);
            });

            return emails;
        }
        else
        {
            throw "Aba Outros vazia";
        }            
    }

    function getHelpFriends()
    {
        var notifications = [];
        var friendsSelector = "#user-friends-active option:selected";
        $(friendsSelector).each(function (i, selected) 
        {
            var user = new Object();
            user.id = $(selected).val();
            user.email = $(selected).attr("user-friends-email");
            user.username = $(selected).text();

            var userMessageStatus = new Object();
            userMessageStatus.user = user;
            userMessageStatus.status = 0;

            var message = new Object();
            message.phrase = $("#user-friends-message").val();

            if(message.phrase.length == 0)
            {
                alert("Preencha o campo Pedido de ajuda aos seus amigos SongCommunityFactory!");
                throw "Preencha o campo Pedido de ajuda aos seus amigos SongCommunityFactory!";
            }
            if(message.phrase.length > 190)
            {
                alert("O campo Pedido de ajuda aos seus amigos SongCommunityFactory ultrapassou o valor máximo de 190 caracteres permitidos!");
                throw "O campo Pedido de ajuda aos seus amigos SongCommunityFactory ultrapassou o valor máximo de 190 caracteres permitidos!";
            }

            message.userMessageStatus =[];

            var notification = new Object();
            notification.invite = 1;
            notification.open = 1;
            notification.level = 0;            
            notification.messages = [];
            notification.users = [];
            notification.project = new Object();
            notification.project.id = $("#id").val();
            notification.project.name = $("#project-name").val();

            message.userMessageStatus.push(userMessageStatus);
            notification.users.push(user);
            notification.messages.push(message);
            notifications.push(notification);    
        });    

        if(notifications.length > 0)
        {
            return notifications;
        }
        else
        {
            throw "Aba Amigos SCF vazia";
        }
    }


//--------------------------------POST Refresh------------------------------------

    function postRefreshParams($action, $params)
    {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            url: $action,
            method: 'POST',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
                $(".post-submit-hidden").hide();
                $("body").css("cursor", "progress");
            },
            data: $params,
            success: function (r) {
                console.log("success: " + r);
                alert(r.successMessage);
                window.location = window.location.toString();
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Erro: " + e.responseJSON.errorMessage);
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            }
        });
    }

    function postRefreshJson($action, $jsonModel)
    {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            url: $action,
            method: 'POST',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
                $(".post-submit-hidden").hide();
                $("body").css("cursor", "progress");
            },
            contentType: 'application/json',
            data: JSON.stringify($jsonModel),
            success: function (r) {
                console.log("success: " + r);
                alert(r.successMessage);
                window.location = window.location.toString();
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Erro: " + e.responseJSON.errorMessage);
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            }
        });
    }


    function postJson($action, $jsonModel)
    {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajax({
            url: $action,
            method: 'POST',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
                $(".post-submit-hidden").hide();
                $("body").css("cursor", "progress");
            },
            contentType: 'application/json',
            data: JSON.stringify($jsonModel),
            success: function (r) {
                console.log("success: " + r);
                alert(r.successMessage);
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Erro: " + e.responseJSON.errorMessage);                
            },
            complete: function (d){
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            }
        });
    }

</script>

<!----------------------------files-------------------------------------------->
<c:import url="/WEB-INF/views/project/update/script-fileinput.jsp" />
