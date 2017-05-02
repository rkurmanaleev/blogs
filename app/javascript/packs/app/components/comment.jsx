import React, { Component } from "react"
import Time from "../utils/time"

class Comment extends React.Component {
  constructor(props) {
    super(props);

    this.handleDelete = this.handleDelete.bind(this);
  }
  deleteLink(user) {
    let current_user = this.props.current_user;
    if(user === current_user) {
      return(
        <div className="comment-info text-right">
          <a href="#" className="delete-comment" onClick={this.handleDelete}>
            Delete it?
          </a>
        </div>
      )
    }
  }
  userLink(id, userfullname) {
    return(
      <a href={"/users/"+id}> {userfullname} </a>
    )
  }
  handleDelete(e){
    e.preventDefault();
    $.ajax({
      method: "DELETE",
      url: "/posts/"+this.props.post+"/comments/"+this.props.comment.id,
      dataType: "JSON",
      success: function(data) {
        this.props.handleDeleteRecord(this.props.comment);
      }.bind(this)
    })
  }
  render() {
    let comment = this.props.comment.attributes;
    return(
      <div className="list-comments">
        <div className="row comment-user-date">
          <div className="col-sx-1 col-sm-1 col-md-1 col-lg-1">
            <img src={comment.user.avatar_image_id} className="avatar" width="96x96" alt="Users avatar" />
          </div>
          <div className="col-sx-8 col-sm-8 col-md-8 col-lg-8">
            <div className="comment-full-name">
              { this.userLink(comment.user.id, comment.user.full_name) }
            </div>
            <div className="comment-date">
              < Time date={comment.created_at} />
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-sx-12 col-sm-12 col-md-12 col-lg-12">
            <div className="comment-content">
              { comment.content.toString() }
            </div>
            { this.deleteLink(comment.user.id) }
          </div>
        </div>
      </div>
    )
  }
}

export default Comment;
