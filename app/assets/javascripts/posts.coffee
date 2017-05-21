$ ->
  $form_input = $("#comment_content")
  $form_button = $("#comment_save")
  disable_button = ->
    $("#comment_save").attr("disabled", "disabled")

  $(document).on "ajax:complete", "[data-behavior=\"fragments\"]", (e, xhr) ->
    $("#comment_content").val("")
    disable_button()

  $form_input.keyup ->
    if $form_input.val() is ""
      disable_button()
    else
      $form_button.removeAttr("disabled")
