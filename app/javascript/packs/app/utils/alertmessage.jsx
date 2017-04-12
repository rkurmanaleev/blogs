import React from "react"
import ReactDOM from "react-dom"

var AlertMessage = React.createClass({
  render() {
    if(this.props.type === "warning"){
      return(
        <div className="alert alert-warning">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
          { this.props.message }
        </div>
      )
    }else{
      return(
        <div className="alert alert-success">
          <a href="#" class="close" data-dismiss="alert" aria-label="close">x</a>
          { this.props.message }
        </div>
      )
    }
  }
});

AlertMessage.defaultProps = {
  type: "",
  message: "Some technical issues. Please try again later"
};

export default AlertMessage;
