import { useState } from "react";
import Square from "../Square";

function Board() {

    return (
        <div className="board">
            <Square content={<img src="https://as1.ftcdn.net/v2/jpg/01/72/84/60/1000_F_172846055_oGxsPEO75idJi17DZ6LmmfSgSRvPCvRq.jpg" alt="Muffin Character" />} />
            <Square />
            <Square content={<img src="https://i.etsystatic.com/17058517/r/il/ab9b76/1888595011/il_570xN.1888595011_1kep.jpg" alt="Puffin Character" />}/>
            <Square />
        </div>
    );
}

export default Board;