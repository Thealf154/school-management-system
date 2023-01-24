import React from "react";
import { Outlet } from "react-router-dom";
import Sidebar from "@/components/sidebar/Sidebar";
import "@/css/dashboard.css";

const Dashboard = () => {
  return (
    <>
      <Sidebar />
      <div className="content">
        <Outlet />
      </div>
    </>
  );
};

export default Dashboard;
