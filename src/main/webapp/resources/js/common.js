
$(function () {
    $("#btn_simple_submit").click(function () {
        $("#simple_form").submit();
    });

    $(".btn-logout").click(function () {
        $("#form_logout").submit();
    });

    $(".fa-question-circle").click(function (event) {
        var target = $(this).attr("data-target");
        $(target).modal('show');
        event.stopPropagation();
    });
});


//remove all empty mother fuckers spaces
function trim(str) {
    return str.replace(/^\s+|\s+$/g, "");
}

//replace all
function replaceAll(target, search, replacement) {
    return target.replace(new RegExp(search, 'g'), replacement);
}


function isEmail($string)
{
    var re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    var is_email =re.test($string);
    if(!is_email)
        return false;
    
    return true;
}

function round(value, precision) {
    var multiplier = Math.pow(10, precision || 0);
    return Math.round(value * multiplier) / multiplier;
}


function getVal($this, $name)
{
    try {
        getValOrThrow($this, $name);
    }
    catch (e) {
        alert(e);
        return false;
    }
    return true;
}


function getValOrThrow($this, $name)
{
    var inputType = $($this).attr('type');
    switch (inputType) {
        case "radio":
            throw "not yet";
            break;
        case "checkbox":
            throw "not yet";
            break;
        default:
            return getValCommon($this, $name);
    }
}


function getValCommon($this, $name) {

    var val = trim($($this).val());

    if ($($this).is('[required]')) {
        if (val === "")
        {
            $($this).focus();
            throw "Preencha o campo " + $name + "!";            
        }
    }

    if ($($this).is('[maxlength]')) {
        if (val.length > $($this).attr("maxlength"))
        {
            $($this).focus();
            throw "O campo " + $name + " ultrapassou o valor máximo de " + $($this).attr("maxlength") + " caracteres permitidos!";
        }
    }

    if ($($this).is('[minlength]')) {
        if (val.length < $($this).attr("minlength"))
        {
            $($this).focus();
            throw "O campo " + $name + " não ultrapassou o valor mínimo de " + $($this).attr("minlength") + " caracteres permitidos!";
        }
    }
    
    return val;

}
