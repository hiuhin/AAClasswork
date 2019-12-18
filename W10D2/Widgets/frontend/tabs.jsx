import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.title = "";
        this.content = "";
        this.index = 0;
    }

    render() {
        console.log(this.props.info);
        return (
          <ul>
              {
                  this.props.info.map(el => {
                      return (
                        <div>
                            <h1>{el.title}</h1> 
                            <article>{el.content}</article>
                        </div>
                      )
                  })
              }
          </ul>
        );

    }
}

export default Tabs; 