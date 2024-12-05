// local browser to view react app : http://localhost:8008/story/step?step=A1

// service is reaching out to the local host 

// creates interaction w server 
// back end in racket 
// front end in react 
const baseURL = 'http://localhost:8008';

export const getStep = async (step) => { // async will go out of the main thread of a process 
    const results = await fetch(baseURL + '/story/step?step=' + step);
    return results.json(); 
}

    // convert to json