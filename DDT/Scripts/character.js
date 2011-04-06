function getCharacterId() {
	return $("#characterId").val();
}

function createUploader() {
    var uploader = new qq.FileUploader({
        element: document.getElementById('drop'),
        action: '/Character/Upload/' + getCharacterId(),
        allowedExtensions: ['dnd4e'],
        debug: true
    });
}

$(document).ready(function () {
    $("#addPower").click(function () {
        $.ajax({
            url: this.href,
            cache: false,
            success: function (html) {
                $("#powerRows").append(html);
                $("#powerForm").ajaxForm({
                    target: '#powerFormContainer',
                    replaceTarget: true,
                    data: { characterId: getCharacterId() }
                });
            }
        });
        return false;
    });

    $("#addACBonus").click(function () {
        $.ajax({
            url: this.href,
            cache: false,
            success: function (html) {
                $("#acBonusRows").append(html);
                $("#acBonusForm").ajaxForm({
                    target: '#acBonusFormContainer',
                    replaceTarget: true,
                    data: { characterId: getCharacterId() }
                });
            }
        });
        return false;
    });

    $("#addFortBonus").click(function () {
        $.ajax({
            url: this.href,
            cache: false,
            success: function (html) {
                $("#fortBonusRows").append(html);
                $("#fortBonusForm").ajaxForm({
                    target: '#fortBonusFormContainer',
                    replaceTarget: true,
                    data: { characterId: getCharacterId() }
                });
            }
        });
        return false;
    });

    $("#addRefBonus").click(function () {
        $.ajax({
            url: this.href,
            cache: false,
            success: function (html) {
                $("#refBonusRows").append(html);
                $("#refBonusForm").ajaxForm({
                    target: '#refBonusFormContainer',
                    replaceTarget: true,
                    data: { characterId: getCharacterId() }
                });
            }
        });
        return false;
    });

    $("#addWillBonus").click(function () {
        $.ajax({
            url: this.href,
            cache: false,
            success: function (html) {
                $("#willBonusRows").append(html);
                $("#willBonusForm").ajaxForm({
                    target: '#willBonusFormContainer',
                    replaceTarget: true,
                    data: { characterId: getCharacterId() }
                });
            }
        });
        return false;
    });

    $("#addEffect").click(function () {
        $.ajax({
            url: this.href,
            cache: false,
            success: function (html) {
                $("#effectRows").append(html);
                $("#effectForm").ajaxForm({
                    target: '#effectFormContainer',
                    replaceTarget: true,
                    data: { characterId: getCharacterId() }
                });
            }
        });
        return false;
    });

    $(".removeLink").click(function () {
        var link = $(this);
        $.ajax({
            url: this.href,
            type: 'DELETE',
            data: { characterId: getCharacterId() },
            success: function (result) {
                link.parent().hide();
            }
        });
        return false;
    });

    $("#Character_HPCurrent").blur(function () {
        var box = $(this);
        $.ajax({
            url: '/Character/SetCurrentHP',
            type: 'POST',
            data: { characterId: getCharacterId(), hp: box.val() },
            success: function (result) {
                box.val(result.hp);
            }
        });
    });

    $("#Character_HPTemp").blur(function () {
        var box = $(this);
        $.ajax({
            url: '/Character/SetTempHP',
            type: 'POST',
            data: { characterId: getCharacterId(), hp: box.val() },
            success: function (result) {
                box.val(result.hp);
            }
        });
    });

    $("#Character_SurgesUsed").blur(function () {
        var box = $(this);
        $.ajax({
            url: '/Character/SetSurgesUsed',
            type: 'POST',
            data: { characterId: getCharacterId(), surges: box.val() },
            success: function (result) {
                box.val(result.surges);
            }
        });
    });

    $("#Character_ActionPoints").blur(function () {
        var box = $(this);
        $.ajax({
            url: '/Character/SetActionPoints',
            type: 'POST',
            data: { characterId: getCharacterId(), actionPoints: box.val() },
            success: function (result) {
                box.val(result.actionPoints);
            }
        });
    });

    $(".power").live('click', function () {
        var row = $(this);
        $.ajax({
            url: '/Character/TogglePowerAvailability',
            type: 'POST',
            data: { characterId: getCharacterId(), powerId: row.attr('id').substring(6) },
            success: function (result) {
                if (result.available) {
                    row.fadeTo(200, 1);
                } else {
                    row.fadeTo(200, 0.4);
                }
            }
        });
    });

    $(".unavailable").fadeTo(200, 0.4);

});