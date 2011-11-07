// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require_tree .


$(document).ready(function() {
  $("#user_name").usersAutocomplete();

  $('textarea.autogrow').autogrow();

  $('.post button.add-comment').click(function() {
    post = $(this).parents('.post');
    form = $('form.new_comment', post).show();
    $('.input.comment-message textarea', form).focus();
  });

  $('.uiTextInputWrapper textarea').focus(function() {
    wrapper = $(this).parents('.uiTextInputWrapper');
    $('.show-on-focus', wrapper).show();
  });

  $('.uiTextInputWrapper .controls ul.menu li').click(function() {
    wrapper = $(this).parents('.uiTextInputWrapper');
    input = $($(this).attr('data-toggle'), wrapper)

    if ($(input).css('display') == 'none') {
      $(input).show();
      $('textarea', input).focus();
      $(this).addClass('active');
    }
    else {
      $(input).hide();
      $(this).removeClass('active');
    }
  });


  $(".token-input").each(function() {
    $(this).tokenInput($(this).attr('data-source'), {
      theme: "fauxbook",
      animateDropdown: false,
      minChars: 2,
      hintText: false,
      placeholder: $(this).attr('placeholder'),
      preventDuplicates: true
    });
  });

  $('.hidden, .show-on-focus').hide();

    $(".post.status-post").setDeletableStatusPosts({delete_button_selector: '.destroy-post-wrapper'})
    $(".comment").setDeletableStatusPosts()
});



