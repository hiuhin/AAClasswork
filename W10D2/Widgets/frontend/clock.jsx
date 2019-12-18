import React from "react";

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            date: new Date()
        };
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({ date: new Date() });
        // console.log(this.state.date);
    }

    componentDidMount() {
        setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this);
    }
        
    
    render() {
        const date = this.state.date;
        return (
        <div>
            <h1>Clock</h1>
            <div className="outerClock">
                
                <div className="innerClock">
                    <div>Time:</div>
                    <div>{date.getHours()}:{date.getMinutes()}:{date.getSeconds()} PDT </div>
                    <br/>
                    <div>Date:</div>
                    <div>{date.getMonth()+1} / {date.getDate()} / {date.getFullYear()} </div>
                </div>
            </div>
        </div>    
        )
    }

}

export default Clock;