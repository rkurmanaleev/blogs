$(document).ready ->
  bindFormChange = ->
    $form_input = $("#comment_content")
    $form_button = $("#comment_save")

    $form_input.on "input change", ->
      if $form_input.val() is ""
        $form_button.attr("disabled", "disabled")
      else
        $form_button.removeAttr("disabled")

  $(document).on "fragment:update", (e, $newContent) ->
    bindFormChange()

  bindFormChange()
