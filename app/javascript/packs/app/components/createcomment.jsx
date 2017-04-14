import React, { Component } from "react"

var CreateComment = React.createClass({
  getInitialState: function() {
    return(
      content: ""
    )
  },
  handleChange(e) {
    this.setState({content: e.target.value})
  },
  handleSubmit(e) {
    e.preventDefault();
    let props = this.props;
    let state = this.state;
    $.ajax({
      type: "POST",
      url: "/posts/"+props.post+"/comments/",
      data: {
        comment: {
          content: state.content,
          post_id: props.post,
          user_id: props.user
        }
      },
      dataType: "JSON",
      success: function(data) {
        props.handleNewRecord(data);
        this.setState(this.getInitialState());
        $("#content-field").val("");
        $("#form-message").html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>Successfully created the comment</div>');
        $("#form-message").fadeOut(3000, function(){
          $(this).html("").removeClass("alert alert-success alert-warning").show();
        });
      }.bind(this),
      error: function(data) {
        return(< AlertMessage type = "warning" message = { "Error appeared:" + data } />);
      }.bind(this)
    });
  },
  valid() {
    if (this.state.content.length > 0){
      return(true)
    }
  },
  render() {
    return(
      <div className="posts-form">
        <b> Leave a comment: </b>
        <div id="form-message"></div>
        <form className="form" onSubmit={this.handleSubmit}>
          <div className="form-group">
            <textarea id="content-field" className="form-control" type="text"
              placeholder="Type comment here..." rows="1.5" name="content" onChange={this.handleChange} />
            <input type="hidden" id="user-field" value={this.user} />
            <input type="hidden" id="post-field" value={this.post} />
          </div>
          <button className="btn btn-default btn-big" id="send-form" type="submit" disabled={!this.valid()} href="#">
            Save Comment
          </button>
        </form>
      </div>
    )
  }
});

CreateComment.defaultProps = {
  content: "",
  post: "",
  user: ""
}

export default CreateComment;
