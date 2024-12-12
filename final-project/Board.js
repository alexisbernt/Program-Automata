import { useState } from "react";
import Square from "../Square";

function Board() {

    return (
        <div className="board">
            <Square />
            <Square content={<img src="https://as1.ftcdn.net/v2/jpg/01/72/84/60/1000_F_172846055_oGxsPEO75idJi17DZ6LmmfSgSRvPCvRq.jpg" alt="Fire Character" />} />
            <Square />
        </div>
    );
}

export default Board;