import { useState } from "react";

function Square() {
    const [counter, setCounter] = useState(0);

    return <div className="square" onClick={function() {
        console.log(0);
        setCounter(counter+1)
    }}>
        Square {counter}
    </div>
}

export default Square;