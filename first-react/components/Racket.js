import { useEffect, useState } from "react";
import { getStep } from "../service";

export function Racket({ item }) {
    const [loading, setLoading] = useState(false);
    const [profile, setProfile] = useState();

    async function getData() {
        setLoading(true);
        try {
            const json = await getStep('A1');
            console.log(json);
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