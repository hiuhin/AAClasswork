import React from 'react';
import Clock from './clock';
import Tabs from './tabs'; 

const info = [
  {
    title: "one",
    content: "content1"
  },
  {
    title: "two",
    content: "content2"
  },
  {
    title: "three",
    content: "content3"
  }
];

const Root = () => {
    return (
        <div>
            <Clock/>
            <Tabs info={info}/>
        </div>
    )
}

export default Root;