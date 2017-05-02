import React, { Component } from "react"
import ReactDOM from "react-dom"
import Comments from "./components/comments"

class Application extends React.Component {
  render() {
    return(
      <div>
        < Comments />
      </div>
    )
  }
}

if($("#show-post-comment").length > 0) {
  ReactDOM.render(
  < Application />, document.getElementById('show-post-comment'),
  )
}
