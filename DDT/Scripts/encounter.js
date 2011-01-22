window.setInterval(checkEachCharacter, 10000);

function checkEachCharacter() {
	$('.characterStatusRow').each(function (index, element) {
		checkBloodied(element);
	});
}

function checkBloodied(element) {
	var rowSpan = $(element);
	$.ajax({
		url: '/Encounter/IsBloodied',
		type: 'GET',
		cache: false,
		data: { id: rowSpan.attr('id') },
		success: function (result) {
			if (result.isBloodied) {
				rowSpan.addClass('bloodied');
			} else {
				rowSpan.removeClass('bloodied');
			}
		}
	});
}