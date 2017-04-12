import React, { Component } from "react"
import AlertMessage from "../utils/alertmessage"

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
    $.ajax({
      type: "POST",
      url: "/posts/"+this.props.post+"/comments/",
      data: {
        comment: {
          content: this.state.content,
          post_id: this.props.post,
          user_id: this.props.user
        }
      },
      dataType: "JSON",
      success: function(data) {
        this.props.handleNewRecord(data);
        this.setState(this.getInitialState());
        $("#content-field").val("");
      }.bind(this),
      error: function(data) {
        console.log(data)
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
            <textarea className="form-control" type="text" placeholder="Type comment here..."
              rows="1.5" id="content-field" name="content" onChange={this.handleChange} />
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
