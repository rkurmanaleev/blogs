import React from 'react'

class Time extends React.Component {
  forceTwoDigits(val){
    if (val < 10) {
      return("0"+val)
    }else{
      return(val)
    }
  }
  format(date) {
    let data = new Date(date);
    let year = data.getFullYear();
    let month = this.forceTwoDigits(data.getMonth()+1);
    let day = this.forceTwoDigits(data.getDate());
    let hour = this.forceTwoDigits(data.getHours());
    let minute = this.forceTwoDigits(data.getMinutes());
    return(day + "." + month + "." + year + " " + hour + ":" + minute);
  }
  render() {
    return(
      <div>
        { this.format(this.props.date) }
      </div>
    )
  }
}

export default Time;
