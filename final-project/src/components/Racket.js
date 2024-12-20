import { useEffect, useState} from "react";
import { getStep } from "../service";
import StepButton from "./StepButton";

export function Racket({item }) {
    const [loading, setLoading] = useState(true);
    const [step, setStep] = useState();
    const [steps, setSteps] = useState([]);

    async function getData(step) {
        try {
            const json = await getStep(step);
            console.log(json);
            setStep(json);
            setSteps([...steps, step]); // merging arrays 
            setLoading(false);
        } catch (error) {
            console.error(error.message);
        }
    }

    useEffect(() => {
        getData('A1');
    }, [])

    if (!step){
        return <div> You failed.</div>
    }

    return <div className="cyoa-container">

        {/* <h4 style ={{color: 'light blue'}} */}

        <h4>{step.name}</h4>
        <p>{step.content}</p>

        <StepButton 
            step={step.a.step} 
            description={step.a.description}
            onClickEvent = {getData}
        />
        <StepButton 
            step={step.b.step} 
            description={step.b.description}
            onClickEvent = {getData}
        />

        <StepButton 
            step={step.c.step} 
            description={step.c.description}
            onClickEvent = {getData}
        />


        <div>
            {steps.map((step, index) => {
                return <span onClick={() => {
                    getData(step);
                }} className="step-tag" key={index}>{step}</span>
            })}
        </div>
    </div>
}

export default Racket;