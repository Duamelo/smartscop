"use client";
import React from "react";
import { Line } from "react-chartjs-2";
import "chart.js/auto";
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from "chart.js";

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
);

const data = {
  labels: ["Il y a 10 jours", "Il y a 8 jours", "Hier", "Ce jour"],
  datasets: [
    {
      label: "Usagers",
      data: [30, 20, 50, 40],
      borderColor: "blue",
      backgroundColor: "blue",
    },
    {
      label: "Visiteurs",
      data: [40, 30, 10, 50],
      borderColor: "yellow",
      backgroundColor: "yellow",
    },
  ],
};

const options = {
  responsive: true,
  plugins: {
    legend: {
      position: "top" as const,
    },
  },
};

const LineChart: React.FC = () => {
  return (
    <div className="bg-white p-4 rounded-md shadow-md">
      <h3 className="text-gray-600">Affluences par jour</h3>
      <Line data={data} options={options} />
    </div>
  );
};

export default LineChart;
