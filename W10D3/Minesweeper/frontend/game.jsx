import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.board = new Minesweeper.Board(10,10);
        this.state= {
            board: this.board
        }
        this.updateGame = this.updateGame.bind(this);
    }

    // updateGame(pos) {
    //     this.board.grid[pos[0]][pos[1]].explore();
    //     this.forceUpdate();
    // }

    updateGame(tile) {
        tile.explore();
        this.setState({
            board: this.state.board
        });
        // console.log("click");
    }

    render() {
        return (
            <div>
                <h1>React is Working</h1>
                <Board board={this.state.board} updateGame={this.updateGame} />
            </div>
        )
    }
}

export default Game;