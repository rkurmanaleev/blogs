$ ->
  if $("#user-avatar-delete").length
    avatar_image = $("#user-avatar-img")[0]
    old_avatar = avatar_image.src
    remove_link_div = $(".user-avatar-link")
    upload_field_src = $("input[name='user[avatar_image]']")
    upload_field = $("#user_avatar_image")
    delete_link_anchor = $("#user-avatar-delete")

    upload_field.on 'change', () ->
      remove_link_div.removeClass("hidden")

      if typeof (FileReader) != "undefined"
        reader = new FileReader()
        reader.onload = (e) ->
          avatar_image.src = e.target.result
        reader.readAsDataURL($(this)[0].files[0])
      else
        alert("This browser does not support FileReader.")

    delete_link_anchor.click (e) ->
      e.preventDefault()
      upload_field.val("")
      avatar_image.src = old_avatar
      upload_field_src.val = ""
      remove_link_div.addClass("hidden")
