import { useState } from 'react';
import './App.css';
import Board from './components/Board';
import Header from './Header';
import Config from './components/Config';
import PokemonList from './components/PokemonList';
import Racket from './components/Racket';
import Blink from './components/Blink';

function App() {
  const [showBoxes, setShowBoxes] = useState(false);
  return (
    <div className="App">
       <Header />
       <Config showBoxes={showBoxes} setShowBoxes={setShowBoxes}/>
       {showBoxes && <Board />}
       {/* /* // && is a way to commend out  */ }
       {false && <PokemonList/> } 
       {false && <Racket/>}
       <Blink/>
    </div>
  );
}

export default App;
