"use client";
import React from "react";

interface StatCardProps {
  title: string;
  value: number;
  todayChange: number;
}

const StatCard: React.FC<StatCardProps> = ({ title, value, todayChange }) => {
  return (
    <div className="bg-white p-4 rounded-md shadow-md flex justify-between ">
      <div>
        <h3 className="text-gray-600 mb-4">{title}</h3>
        <div className="flex gap-2">
          <p className="bg-colorVert text-green-800 rounded-md p-1">
            +{todayChange}
          </p>
          <p className="text-[14px] text-center">aujourd'hui</p>
        </div>
      </div>
      <div>
        <p className="text-3xl font-bold">{value}</p>
      </div>
    </div>
  );
};

export default StatCard;
