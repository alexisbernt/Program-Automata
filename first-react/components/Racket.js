import { useEffect, useState } from "react";

export function Racket({ item }) {
    const [loading, setLoading] = useState(false);
    const [profile, setProfile] = useState();

    async function getData() {
        setLoading(true);
        try {
            const response = await fetch('http://localhost:8008/hello', {
                // mode: 'no-cors'
                // http://localhost:8008/hello
            });
            if (!response.ok) {
                throw new Error(`Response status: ${response.status}`);
            }
            const json = await response.json();
            setProfile(json);
            setLoading(false);
        } catch (error) {
            console.error(error.message);
        }
    }

    useEffect(() => {
        getData();
    }, [])

    return <div>
        {profile && profile.name}
    </div>
}

export default Racket;