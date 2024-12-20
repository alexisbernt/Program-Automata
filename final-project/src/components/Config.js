function Config({showBoxes, setShowBoxes}) {
    // console.log(showBoxes, setShowBoxes); 
    return <div>
        <label>
            Boxes: <input type="checkbox"
            checked={showBoxes}
            onChange={
                () => setShowBoxes(!showBoxes)
            } /> 
        </label>
    </div>
}

export default Config;