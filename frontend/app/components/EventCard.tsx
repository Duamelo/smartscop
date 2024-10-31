"use client";
import React from "react";

interface EventCardProps {
  title: string;
  manager: string;
}

const EventCard: React.FC<EventCardProps> = ({ title, manager }) => {
  return (
    <div className="flex justify-between bg-gray-100 p-3 rounded-md mb-2 shadow-sm">
      <div className="flex items-center space-x-2">
        <span className="text-green-500">●</span>
        <p>{title}</p>
      </div>
      <p>Chargé : {manager}</p>
    </div>
  );
};

export default EventCard;
