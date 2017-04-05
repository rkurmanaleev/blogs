@Comments = React.createClass
  getInitialState: ->
    comments: @props.data
  getDefaultProps: ->
    comments: []
  addComment: (comment) ->
    comments = React.addons.update(@state.comments, { $push: [comment] })
    @setState comments: comments
  deleteComment: (comment) ->
    comments = @state.comments.slice()
    index = comments.indexOf comment
    comments.splice index, 1
    @replaceState comments: comments
  sortByDesc: (collection, id) ->
    collection.sort (a, b) ->
      [av, bv] = [a[id], b[id]]
      if av >= bv then -1 else if av <= bv then 1 else 0
  render: ->
    console.log(@state)
    console.log(@props)
    comments = @sortByDesc(@state.comments, "id")
    React.DOM.div
      className: "comments"
      React.createElement CreateComment, post_id: @props.post_id, user_id: @props.current_user, handleNewRecord: @addComment
      if comments.length == 0
        React.DOM.h4
          className: "comments-header"
          "No Comments yet..."
      else
        React.DOM.div
          className: "posts-comments"
          React.DOM.h4
            className: "comments-header"
            "Comments "
            React.DOM.span
              className: "badge"
              comments.length
          React.DOM.div
            className: "comments-section"
            for comment in comments
              if(comment.id > 0)
                React.createElement Comment, key: comment.id, comment: comment, current_user: @props.current_user, handleDeleteRecord: @deleteComment
