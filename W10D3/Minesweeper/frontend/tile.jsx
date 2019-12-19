import React from 'react'

class Tile extends React.Component {
    constructor(props) {
        super(props);
        
    }



    render() {
        // return ('T')
        const tile = this.props.tile;
        // console.log(tile);
        let tile_class;
        let icon; 

        if (tile.explored) {
            if (tile.bombed) {
                icon = '💣'
            } else {
                let count = tile.adjacentBombCount();
                icon = count === 0? " " : count;
                // 
                tile_class = 'explored'
            }
        } else if (tile.flagged) {
            icon = '🚩'
        } else {
            tile_class = 'unexplored'
        }
        return (
            
            <div onClick={()=>this.props.updateGame(tile)} className="tile">
                {icon}
            </div>
        )
    }
}


export default Tile;