$('#myModal').on('show.bs.modal', function() {
    $('#myModal .modal-body').html('<i class="fa fa-spinner fa-pulse"></i>');
    $.ajax({
	url: '/login',
	success: function(d) {
	    console.log(d);
	    $('#myModal .modal-body').html(d);
	},
	error: function(e) {
	    console.log(e);
	}
    });
});

/*
$('#myModal').on('shown.bs.modal', function() {
    $('#myModal .modal-body').text('ggggggggggggggggggggg');
});
*/
