import { useState } from 'react';
import './App.css';
import Board from './components/Board';
import Header from './Header';
import Config from './components/Config';
import PokemonList from './components/PokemonList';

function App() {
  const [showBoxes, setShowBoxes] = useState(false);
  return (
    <div className="App">
       <Header />
       <Config showBoxes={showBoxes} setShowBoxes={setShowBoxes}/>
       {showBoxes && <Board />}
       <PokemonList/> 
    </div>
  );
}

export default App;
