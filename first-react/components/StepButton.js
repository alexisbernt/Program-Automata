export default function StepButton({step, description, onClickEvent}){
    if (!step) {
        return null;
    }
    return <button style = {{background:'navy', color:'white'}} 
    onClick={function() {
        onClickEvent(step);
    }}>
    {step} - {description}
    </button>
}