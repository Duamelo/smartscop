import React from "react";
import StatCard from "../components/StartCard";
import LineChart from "../components/LineChart";
import PieChart from "../components/PieChart";
import EventCard from "../components/EventCard";
import AdminLayout from "../layoutadmin";
import Clock from "../components/Clock";

const DashboardPage: React.FC = () => {
  return (
    <AdminLayout>
      <div className="w-full grid grid-cols-3 gap-6 ">
        <StatCard title="Usagers" value={300} todayChange={20} />
        <StatCard title="Visiteurs" value={30} todayChange={10} />
        <StatCard title="Total" value={330} todayChange={30} />

        <div className="col-span-2 ">
          <LineChart />
        </div>
        <div className="col-span-1">
          <PieChart />
        </div>

        <div className="col-span-2 bg-white p-4 rounded-md shadow-md ">
          <h3 className=" mb-4 text-bold">Événements en cours</h3>
          <EventCard title="Atelier : Hub" manager="Magsoud TAWALIOU" />
          <EventCard title="Atelier : Hub" manager="Magsoud TAWALIOU" />
        </div>

        <div className="col-span-1">
          <Clock />
        </div>
      </div>
    </AdminLayout>
  );
};

export default DashboardPage;
