import React from "react";
import Sidebar from "./components/Sidebar";
import "./globals.css";
interface AdminLayoutProps {
  children: React.ReactNode;
}

const AdminLayout: React.FC<AdminLayoutProps> = ({ children }) => {
  return (
    <div className="flex flex-col w-full min-h-screen">
      <div className="w-full flex flex-row flex-1">
        <div className="flex flex-col shadow-sm w-1/6">
          <Sidebar />
        </div>
        <div className="flex flex-col flex-1 p-8 max-h-screens  w-full bg-background">
          {children}
        </div>
      </div>
    </div>
  );
};

export default AdminLayout;
