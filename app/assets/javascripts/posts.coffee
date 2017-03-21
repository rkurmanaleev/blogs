$ ->
  $(".delete-comment").click (e) ->
    e.preventDefault()
    postId = $(@).attr("data_post")
    commentId = $(@).attr("data_comment")
    destroyUrl = "/posts/"+postId+"/comments/"+commentId

    $.ajax
      type: "DELETE"
      url: destroyUrl
      success: (data, xhr) ->
        if xhr is "success"
          $(".comments[data='#{commentId}']").remove()
          commentsNumber = $(".comments").length
          if commentsNumber is 0
            $(".comments-list").html("").append("<div class='no-comments'>No comments yet...</div>")
        else
          $("comment-message").html("Please try again later").addClass("alert")
      error: (data) ->
        $("comment-message").html("You're not authorized to do it").addClass("alert")
