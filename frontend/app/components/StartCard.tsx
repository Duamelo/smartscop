"use client";
import React from "react";

interface StatCardProps {
  title: string;
  value: number;
  todayChange: number;
}

const StatCard: React.FC<StatCardProps> = ({ title, value, todayChange }) => {
  return (
    <div className="bg-white p-4 rounded-md shadow-md ">
      <h3 className="text-gray-600">{title}</h3>
      <p className="text-3xl font-bold">{value}</p>
      <p className="text-green-600">+{todayChange} aujourd'hui</p>
    </div>
  );
};

export default StatCard;
