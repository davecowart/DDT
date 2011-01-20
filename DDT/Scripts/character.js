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
});