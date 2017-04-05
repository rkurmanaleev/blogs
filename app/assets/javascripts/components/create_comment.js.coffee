@CreateComment = React.createClass
  getInitialState: ->
    content: ""
    user_id: @props.user_id
    post_id: @props.post_id
  handleChange: (e) ->
    @setState "content": e.target.value
  handleSubmit: (e) ->
    e.preventDefault()
    $.post "/posts/#{@state.post_id}/comments/", { comment: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
    , 'JSON'
  valid: ->
    @state.content
  render: ->
    React.DOM.div
      className: "posts-form"
      React.DOM.b
        "Leave a comment:"
      React.DOM.div
        className: "message-form"
      React.DOM.form
        className: "form"
        onSubmit: @handleSubmit
        React.DOM.div
          className: "form-group"
          React.DOM.textarea
            className: "form-control"
            type: "text"
            placeholder: "Type comment here..."
            rows: 1.5
            id: "content-field"
            value: @state.content
            name: "content"
            onChange: @handleChange
          React.DOM.input
            type: "hidden"
            id: "user-field"
            value: @user_id
          React.DOM.input
            type: "hidden"
            id: "post-field"
            value: @post_id
        React.DOM.button
          className: "btn btn-default btn-big"
          id: "send-form"
          type: "submit"
          disabled: !@valid()
          href: "#"
          "Save Comment"
