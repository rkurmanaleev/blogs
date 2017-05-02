import React, { Component } from 'react'
import Comment from "./comment"
import CreateComment from "./createcomment"

const current_user = $("#show-post-comment").data("id");
const current_post = window.location.pathname.substr(7);

class Comments extends React.Component {
  constructor(props) {
    super(props);

    this.addComment = this.addComment.bind(this);
    this.deleteComment = this.deleteComment.bind(this);
  }
  componentDidMount() {
    $.ajax({
      type: "GET",
      url: "/posts/" + current_post + "/comments/",
      dataType: "json",
      success: function(data) {
        this.setState({didGetComments: "true", comments: data.data})
      }.bind(this),
      error: function(data) {
        this.setState({didGetComments: "false", comments: []})
      }.bind(this)
    })
  }
  stateIsNull(){
    return ((this.state === null)||(this.state.comments.length < 1))
  }
  getCommentsNumber() {
    if (this.stateIsNull()){
      return("0")
    }else{
      return(this.state.comments.length.toString())
    }
  }
  addComment(newComment) {
    let comments_array = this.state.comments;
    comments_array.unshift(newComment.data);
    this.setState({comments: comments_array});
  }
  deleteComment(comment) {
    let comments_array = this.state.comments.slice();
    let index = comments_array.indexOf(comment);
    comments_array.splice(index, 1);
    this.setState({comments: comments_array});
  }
  render() {
    let all_comments = [];
    if (this.stateIsNull()) {
      all_comments = "No comments yet..."
    } else {
      for (let comment of this.state.comments) {
        all_comments.push(
          < Comment key = { comment.id } post = { current_post } comment = { comment }
          current_user = { current_user } handleDeleteRecord = { this.deleteComment } />
        )
      }
    };
    return(
      <div>
        <div>
          < CreateComment user_id = {current_user} post_id = {current_post} handleNewRecord={this.addComment}/>
        </div>
        <div className="comments">
          <div className="posts-comments">
            <h4 className="comments-header"> Comments 
            <span className="badge"> { this.getCommentsNumber() } </span>
          </h4>
          </div>
          <div className="comments-section" id="comments-section">
            { all_comments }
          </div>
        </div>
      </div>
    )
  }
}

Comments.defaultProps = {
  comments: [],
  post_id: "0"
}

export default Comments;
