import { useEffect, useState } from "react";
import Pokemon from './Pokemon';

function PokemonList() {
    const [loading, setLoading] = useState(true);
    const [pokemons, setPokemons] = useState ([]);
    
    const url = "https://pokeapi.co/api/v2/pokemon?limit=10&offset=0";

    // load Pokemon and store them in Array.;
    useEffect(() => {
        console.log('loaded'); 
        async function getData() {
            try {
              const response = await fetch(url);
              if (!response.ok) {
                throw new Error(`Response status: ${response.status}`);
              }
          
              const json = await response.json();
              console.log(json);
              setPokemons(json.results);
            //   setting loading for user experience 
              setLoading(false); 
            } catch (error) {
              console.error(error.message);
            }
          }
          getData()
    }, [])

    if (loading) {
        return <div> Loading... </div>
    }
    // map through the list
    return <div>{pokemons.map(function(p) {
        // return <div>{p.name}</div> --> instead line below 
        return <Pokemon item={p}/>
     })} </div>

}

export default PokemonList;