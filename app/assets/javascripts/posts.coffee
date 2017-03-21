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
