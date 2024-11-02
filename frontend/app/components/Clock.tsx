"use client";
import React, { useEffect, useState } from "react";

const Clock: React.FC = () => {
  const [time, setTime] = useState<string | null>(null);

  useEffect(() => {
    const intervalId = setInterval(
      () =>
        setTime(
          new Date().toLocaleTimeString([], {
            hour: "2-digit",
            minute: "2-digit",
            second: "2-digit",
          })
        ),
      1000
    );

    return () => clearInterval(intervalId);
  }, []);

  useEffect(() => {
    setTime(
      new Date().toLocaleTimeString([], {
        hour: "2-digit",
        minute: "2-digit",
        second: "2-digit",
      })
    );
  }, []);

  return (
    <div className="bg-white p-4 rounded-md shadow-md text-center">
      <h3 className="text-2xl font-bold">{time}</h3>
      {time && (
        <p>
          {new Date().toLocaleDateString("fr-FR", {
            weekday: "long",
            day: "numeric",
            month: "long",
            year: "numeric",
          })}
        </p>
      )}
    </div>
  );
};

export default Clock;
