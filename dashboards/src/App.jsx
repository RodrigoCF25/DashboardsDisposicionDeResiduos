import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom'
import { GeneralDashboard } from './pages/GeneralDashboard'
import { RecoleccionDashboard } from './pages/RecoleccionDashboard'
import { RellenoDashboard } from './pages/RellenoDashboard'


function App() {
  return (
    <Router>
      <Routes>
        <Route path="/general-dashboard" element={<GeneralDashboard/>} />
        <Route path="/recoleccion-dashboard" element={<RecoleccionDashboard/>} />
        <Route path="/relleno-dashboard" element={<RellenoDashboard/>} />
      </Routes>
    </Router>
  )
}

export default App
