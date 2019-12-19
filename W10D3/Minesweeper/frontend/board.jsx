import React from 'react';
import Tile from './tile';

class Board extends React.Component {
    constructor(props) {
        super(props); 
    }

  

    render() {
        return( 
            <div className="board">
                {this.props.board.grid.map((row, idx) => {
                    return (
                        <div className="board-rows">
                            {row.map((el,i) => {
                                return (
                                       <Tile tile={el} key={[idx,i]} updateGame={this.props.updateGame}/>
                                )   
                            })}
                        </div>
                    ) 
                })}
        
            </div>
        )
    }
}

export default Board