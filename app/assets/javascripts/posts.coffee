$ ->
  $(".delete-comment").click (e) ->
    e.preventDefault()
    postId = $(@).data("postId")
    commentId = $(@).data("commentId")
    destroyUrl = "/posts/#{postId}/comments/#{commentId}"

    $.ajax
      type: "DELETE"
      url: destroyUrl
      success: (data) ->
        $(".comments[data-comment-id='#{commentId}']").remove()
        commentsNumber = $(".comments").length
        if commentsNumber is 0
          $(".comments-list").html("").append("<div class='no-comments'>No comments yet...</div>")
      error: (data) ->
        $("comment-message").html("You're not authorized to do it").addClass("alert")

  $("#send-form").click (e) ->
    e.preventDefault()
    disableButton()
    sendForm = $("#send-form")
    contentField = $("#content-field")
    noCommentsDiv = $("#.no-comments")
    messageForm = $(".message-form")
    enableButton = ->
      sendForm.removeAttr("disabled").removeClass("disabled")
    disableButton = ->
      sendForm.attr("disabled", "disabled").addClass("disabled")
    clearForm = ->
      contentField.val("")
    commentMessageIsBlank = ->
      contentField.val()
    ajaxSuccess = (data) ->
      createdAt = data.created_at.substr(0, 10) + " " + data.created_at.substr(11, 5)
      fullName = data.user.full_name
      comment = data.content
      DivCommentsInfo = "#{comment}<div class='comment-info'> by #{fullName} on #{createdAt}</div>"
      DivListCommentsToDom = "<div class='list-comments'>#{DivCommentsInfo}</div>"
      messageForm.html("Successfully created a comment").addClass("notice")
      enableButton()
      clearForm()
      if noCommentsDiv.length
        noCommentsDiv.remove()
        $(".comments").prepend("<b>Comments: </b><div class='posts-comments'>#{DivListCommentsToDom}</div>")
      else
        $(".posts-comments").prepend(DivListCommentsToDom)
    ajaxError = ->
      $(".message-form").addClass("alert").html("Some error appeared. Please try later")
      enableButton()
    sendRequestAndRenderRespond = ->
      postId = $("#post-field").val()
      dataParams = {
        comment:
          content: contentField.val()
          user_id: $("#user-field").val()
          post_id: postId
      }
      $.ajax
        type: "POST"
        url: "/posts/#{postId}/comments"
        data: dataParams
        success: (data) ->
          ajaxSuccess(data)
        error: (error) ->
          ajaxError()
    renderFailureMessage = ->
      messageForm.addClass("alert").html("Text field couldn't be blank!")
      enableButton()

    if commentMessageIsBlank()
      sendRequestAndRenderRespond()
    else
      renderFailureMessage()

  $(".message-form").click ->
    $(@).html("").removeClass("notice")
