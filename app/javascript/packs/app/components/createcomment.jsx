import React, { Component } from "react"

class CreateComment extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      content: "",
      post_id: this.props.post_id_id,
      user_id: this.props.user_id_id
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.effectsAfterCreatedComment = this.effectsAfterCreatedComment.bind(this);
  }
  handleChange(e) {
    this.setState({content: e.target.value})
  }
  effectsAfterCreatedComment() {
    $("#content-field").val("");
    $("#form-message").html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>Successfully created the comment</div>');
    $("#form-message").fadeOut(3000, function(){
      $(this).html("").removeClass("alert alert-success alert-warning").show();
    });
  }
  handleSubmit(e) {
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: "/posts/"+this.state.post_id+"/comments/",
      data: {
        comment: {
          content: this.state.content,
          post_id: this.props.post_id,
          user_id: this.props.user_id
        }
      },
      dataType: "JSON",
      success: function(data) {
        this.props.handleNewRecord(data);
        this.setState(this.state);
        this.effectsAfterCreatedComment();
      }.bind(this),
      error: function(data) {
        return(< AlertMessage type = "warning" message = { "Error appeared:" + data } />);
      }.bind(this)
    });
  }
  valid() {
    if (this.state.content.length > 0){
      return(true)
    }
  }
  render() {
    return(
      <div className="posts-form">
        <b> Leave a comment: </b>
        <div id="form-message"></div>
        <form className="form" onSubmit={this.handleSubmit}>
          <div className="form-group">
            <textarea id="content-field" className="form-control" type="text"
              placeholder="Type comment here..." rows="1.5" name="content" onChange={this.handleChange} />
            <input type="hidden" id="user-field" value={this.user_id} />
            <input type="hidden" id="post-field" value={this.post_id} />
          </div>
          <button className="btn btn-default btn-big" id="send-form" type="submit" disabled={!this.valid()} href="#">
            Save Comment
          </button>
        </form>
      </div>
    )
  }
}

CreateComment.defaultProps = {
  content: "",
  post: "",
  user: ""
}

export default CreateComment;
