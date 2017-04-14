import React, { Component } from "react"
import ReactDOM from "react-dom"
import Comments from "./components/comments"

var Application = React.createClass({
  render() {
    return(
      <div>
        < Comments />
      </div>
    )
  }
});

ReactDOM.render(
  < Application />, document.getElementById('show-post-comment'),
)
