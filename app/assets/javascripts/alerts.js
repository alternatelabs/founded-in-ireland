$(document).ready(function(){
	var alert_container = $('.alert');

	if (alert_container.length) {
		setTimeout(function() {
			alert_container.slideUp();
		}, 4000);
	}
});