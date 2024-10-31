"use client";
import React from "react";
import { Pie } from "react-chartjs-2";

const data = {
  labels: ["TrinIMA", "TechIMA", "XTechLAB", "IMAStudio", "Écoles"],
  datasets: [
    {
      data: [10, 20, 30, 25, 15],
      backgroundColor: ["#4BC0C0", "#FF6384", "#FFCE56", "#36A2EB", "#9966FF"],
    },
  ],
};

const PieChart: React.FC = () => {
  return (
    <div className="bg-white p-4 rounded-md shadow-md">
      <h3 className="text-gray-600">Intérêts</h3>
      <Pie data={data} />
    </div>
  );
};

export default PieChart;
