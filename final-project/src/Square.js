import { useState } from "react";

function Square({ content }) {
    const [counter, setCounter] = useState(0);

    return (
        <div
            className="square"
            // onClick function increments the counter and logs it to console
            onClick={() => {
                console.log(counter);
                setCounter(counter + 1);
            }}
            style={{
                width: "100px",
                height: "100px",
                backgroundColor: " #FFD700",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
                cursor: "pointer",
            }}
            >
            {/* if conteresent then give content (the image in this case) */}
            {content ? content : `Points ${counter}`}  {/* else keep Square counter */}
        </div>
    );
}

export default Square;