<%-- 
    Document   : javascript
    Created on : Sep 2, 2017, 5:30:05 PM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">

    $(function () {

//---------------------------HELP----------------------------------------------        

        $(".btn-help-out").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();            
            try {
                var helpResp = new Object();
                helpResp.help = getHelp(this);
                helpResp.message = getValOrThrow("#help-message-" + helpResp.help.id, "Porque você se interresou");
                postRefreshJson("<c:url value="/api/help/helpOut"/>", helpResp);    
            } 
            catch (e) {
                alert(e);
            }
            return false;
        });//save

        $(".btn-cancel-help").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var jsonModel = getHelp(this);
            postRefreshJson("<c:url value="/api/help/delete"/>", jsonModel);
            return false;
        });//save

        $(".btn-change-help").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var jsonModel = getHelp(this);
            
            var fooHelp = replaceAll(replaceAll(replaceAll(replaceAll(jsonModel.message, ' ', ''), '<p>', ''), '</p>', ''), "<br>", '');            
            if (fooHelp == "")
            {
                alert("Preencha o campo de Pedido de Ajuda!");
                return false;
            }   
            if(jsonModel.message.length > 700)
            {
                alert("O campo Pedido de Ajuda SongCommunityFactory ultrapassou o valor máximo de 700 caracteres permitidos!");
                return false;
            }
            
            postRefreshJson("<c:url value="/api/help/update"/>", jsonModel);
            return false;
        });//save

        $(".btn-accept-help").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var _id = $(this).attr("id-response");
            var params = {id: _id};
            postRefreshParams("<c:url value="/api/help/accept"/>", params);
            return false;
        });//save

        $(".btn-refuse-help").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var _id = $(this).attr("id-response");
            var params = {id: _id};
            postRefreshParams("<c:url value="/api/help/refuse"/>", params);
            return false;
        });//save
        
        $(".btn-msg-help").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var _id = $(this).attr("id-response");
            $("#div-message-response-"+_id).show();
            $(this).next(".btn-send-msg-help").show();
            return false;
        });//show

//---------------------Notification-messages------------------------------------

        $(".btn-send-msg-help").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();            
            try {
                var _id = $(this).attr("id-response");
                var _message = getValOrThrow("#message-response-" + _id,"Mensagem");
                var params = {id: _id, message: _message};   
                postNotificationParams("<c:url value="/api/notification/new/from/help/response/id"/>", params);            
            } 
            catch (e) {
                alert(e);
            }            
            return false;
        });//save

        $(".finish-conversation").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var _id = $(this).attr("id-conversation");
            var params = {id: _id};
            postConversationParams("<c:url value="/api/conversation/finish"/>", params);
            return false;
        });//save


        $(".continue-conversation").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            try {
                var _id = $(this).attr("id-conversation");
                var _message = getValOrThrow("#message-conversation-" + _id, "Mensagem");
                var params = {id: _id, message: _message};
                postConversationParams("<c:url value="/api/conversation/continue"/>", params);
            } 
            catch (e) {
                alert(e);
            }            
            return false;
        });//save
        
        
        $(".accept-invite-notification").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();            
            var _id = $(this).attr("id-notification");
            var params = {id: _id};            
            postRefreshParams("<c:url value="/api/notification/new/contract/from/id"/>", params);
            return false;
        });//save
        
        



//--------------------------------RESPONSES-------------------------------------

        $(".close-response").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var _id = $(this).attr("id-response");
            var params = {id: _id};
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            $.ajax({
                url: "<c:url value="/api/help/read"/>",
                method: 'POST',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                data: params,
                success: function (r) {
                    console.log("success: " + r);
                },
                error: function (e) {
                    console.log("Erro: " + e);
                }
            });

            $(this).parent().hide("slow");

        });//save

//------------------------------SYSTEM-MESSAGES---------------------------------

        $(".close-sys-message").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            var _id = $(this).attr("id-message");
            var params = {id: _id};
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            $.ajax({
                url: "<c:url value="/api/system/message/read"/>",
                method: 'POST',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                data: params,
                success: function (r) {
                    console.log("success: " + r);
                },
                error: function (e) {
                    console.log("Erro: " + e);
                }
            });

            $(this).parent().hide("slow");

        });//save


//-------------------------------project days filter----------------------------

        $("#others-filter").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            e.stopPropagation();
            return false;
        });//save

        $("#btn-others-filter").click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            e.stopPropagation();
            var _val = $("#others-filter").val();
            if (_val > 0)
            {
                window.location = "<c:url value="/home/start"/>"+"?interval="+_val;
            } 
            else
            {
                alert("Informe o intervalo de dias, clicando no campo ao lado!");
            }

            return false;
        });//save


//-------------------------------summernote-------------------------------------
        $('.summernote').summernote({
            height: 250,
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


//---------------------MESSAGES-------------------------------------------------

    function postConversationParams($action, $params)
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
                $(".post-submit-hidden").show();
                $("button[id-conversation='" + r.params.id + "']").hide();
                var foo = $("#message-conversation-" + r.params.id).val() + " - Enviado!";
                $("#message-conversation-" + r.params.id).val(foo);
                $("body").css("cursor", "default");
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Erro: " + e.responseJSON.errorMessage);
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            }
        });
    }
    
    function postNotificationParams($action, $params)
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
                $(".post-submit-hidden").show();
                var foo = $("#message-response-" + r.params.id).val() + " - Enviado!";                
                $("#message-response-" + r.params.id).val(foo);
                $("#message-response-" + r.params.id).prop('disabled', true);
                alert(r.successMessage);                                 
                $("#btn-message-response-" + r.params.id).prop('disabled', true);
                $("#btn-send-message-response-" + r.params.id).prop('disabled', true);
                $("#div-message-response-" + r.params.id).hide();                
                $("body").css("cursor", "default");
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Erro: " + e.responseJSON.errorMessage);
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            }
        });
    }
    

//---------------------HELPS----------------------------------------------------

    function getHelp($element) {
        var _help = new Object();
        _help.id = $($element).attr("id-help");
        if ($('#request-help-' + _help.id).length)
            _help.message = $('#request-help-' + _help.id).summernote('code');

        _help.project = new Object();
        _help.project.id = $($element).attr("id-project");
        return _help;
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
                window.location = "<c:url value="/home/start"/>";
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
                window.location = "<c:url value="/home/start"/>";
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Erro: " + e.responseJSON.errorMessage);
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            }
        });
    }

</script>

