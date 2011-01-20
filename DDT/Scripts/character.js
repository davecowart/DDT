function getCharacterId() {
	return $("#characterId").val();
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

    $(".removeEffect").click(function () {
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
});