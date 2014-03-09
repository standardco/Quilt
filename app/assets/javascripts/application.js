// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('ready', function() {



      

	$(document).on('click', '.nav-offpage-left', function() {
        $('.body').toggleClass('push-left');
        return false;
    });

    var pushedLeft = $('.body').hasClass('push-left');
    if (!pushedLeft) {
        $(document).on('click', '.body', function() {
            $('.body').removeClass('push-left');
        });
    }

	
	// $(document).on('click', '.code', function() {
	// 	var id = $(this).data('id');
	// 	$('.code-details.'+id).fadeToggle();
	// 	return false;
	// });


    
});


    var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
        lineNumbers: true,
        styleActiveLine: true,
        matchBrackets: true,
        mode: "htmlmixed",
        theme: "monokai"
    });
    // var editor = CodeMirror.fromTextArea(document.getElementById("dependency"), {
    //     lineNumbers: true,
    //     styleActiveLine: true,
    //     matchBrackets: true,
    //     mode: "htmlmixed",
    //     theme: "monokai"
    // });

    var editor = CodeMirror.fromTextArea(document.getElementById("showcode"), {
        lineNumbers: true,
        styleActiveLine: true,
        matchBrackets: true,
        mode: "htmlmixed",
        theme: "monokai"
    });

function getCategories() {
    $('.sug-categories').on('click', '.add', function() {
        var category = $(this).parent();
        category.fadeOut();
        var addCat = category.data('cat');

        var html  = '<div class="category">';
            html +=     addCat;
            html += '</div>';

        $('.addedCat').html(html);
        $('#addedCat').val(addCat);
    });
}

// function textAreaAdjust(o) {
// 	console.log(o);
//     o.style.height = "1px";
//     o.style.height = (25+o.scrollHeight)+"px";
// }
