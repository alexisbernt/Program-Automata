import {useState} from "react";

// advantage is you don't have to do logic as much --> you just go to the next state 
const makeBlinker = (initialState, callback) => {
    const machine = {
        state: initialState,
        transitions: {
            OFF: {
                press() {
                    callback('ON');
                }
            },
            ON: {
                press() {
                    callback('BLINK');
                },
            },
            BLINK: {
                press() {
                    callback('OFF');
                },
            },
        },
        dispatch(actionName) {
            const action = this.transitions[this.state][actionName];
    
            if (action) {
                action.call(this);
            } else {
                console.log('invalid action');
            }

        }

    };
    return Object.create(machine);
}

export function Blink() {

    const [light, setLight] = useState('OFF');

    const blinker = makeBlinker(light, setLight);

    // instantiate the machine 
    // const flashlight = Object.create(machine)

    const doSomethingBlinky = () => {
        blinker.dispatch('press');
    }

    const colorful = {
        'OFF': '#000', //#000 is black in hex
        'ON': '#0F0', // #0F0 is green in hex 
        'BLINK': 'orange'
    }

    return (<div> 
        {/* // look in dictionary of light to get the light to show up on the web server */}
        <div style={{width:50, height:50, borderRadius: '50%', backgroundColor: colorful[light]}} ></div>
        <button onClick={doSomethingBlinky}style={{color: colorful[light]}}
        >Clicky McClick color: [{light}
        ]</button>
    </div>)
    
}
export default Blink;