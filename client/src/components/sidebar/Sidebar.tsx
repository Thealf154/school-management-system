import { IconContext } from "react-icons";
import { NavLink } from "react-router-dom";
import {
  IoBookOutline,
  IoHomeOutline,
  IoPersonOutline,
  IoRocket,
  IoSchoolOutline,
} from "react-icons/io5";
import "@/css/sidebar.css";

const Sidebar = () => {
  return (
    <>
      <IconContext.Provider
        value={{ className: "sidebar-icons", size: "2.0em" }}
      >
        <nav className="navbar">
          <ul className="navbar-nav">
            <li className="nav-logo">
              <a href="/#" className="nav-link">
                <IoRocket id="logo" className="" />
                <span className="option-title logo-text">Alfredo</span>
              </a>
            </li>
            <li className="nav-item">
              <NavLink
                to="inicio"
                className={({ isActive }) =>
                  isActive ? "nav-link link-active" : "nav-link link-inactive"
                }
              >
                <IoHomeOutline />
                <span className="option-title">Inicio</span>
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink
                to="materias"
                className={({ isActive }) =>
                  isActive ? "nav-link link-active" : "nav-link link-inactive"
                }
              >
                <IoBookOutline />
                <span className="option-title">Materias</span>
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink
                to="docentes"
                className={({ isActive }) =>
                  isActive ? "nav-link link-active" : "nav-link link-inactive"
                }
              >
                <IoPersonOutline />
                <span className="option-title">Docentes</span>
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink
                to="alumnos"
                className={({ isActive }) =>
                  isActive ? "nav-link link-active" : "nav-link link-inactive"
                }
              >
                <IoSchoolOutline />
                <span className="option-title">Alumnos</span>
              </NavLink>
            </li>
          </ul>
        </nav>
      </IconContext.Provider>
    </>
  );
};

export default Sidebar;
