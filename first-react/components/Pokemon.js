import { useState } from 'react'

function Pokemon({item}) {
    const [loading, setLoading] = useState(true);
    const [pokemon, setPokemon] = useState ();

    console.log('loaded');
    async function getData() {
        try {
            const response = await fetch(item.url);
            if (!response.ok) {
            throw new Error(`Response status: ${response.status}`);
            }
        
            const json = await response.json();
            console.log(json);
            setPokemon(json);
        //   setting loading for user experience 
            setLoading(false); 
        } catch (error) {
            console.error(error.message);
        }
    }

return <div>
    {item.name}
    {loading && <div>Loading...</div>}
    {pokemon && <img src ={pokemon.sprites.front_default} />}
    <button onClick={getData}>Load</button>
</div>

}

export default Pokemon;