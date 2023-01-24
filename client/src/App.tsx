import { useState } from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Dashboard from "./components/dashboard/Dashboard";
import Grades from "./components/views/grades/Grades";
import Students from "./components/views/students/Students";
import Subjects from "./components/views/subjects/Subjects";
import Teachers from "./components/views/teachers/Teachers";

function App() {
  const [count, setCount] = useState(0);

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Dashboard />}>
          <Route path="materias" element={<Subjects />} />
          <Route path="docentes" element={<Teachers />} />
          <Route path="alumnos" element={<Students />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
