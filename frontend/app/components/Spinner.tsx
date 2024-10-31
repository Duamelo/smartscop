"use client";
import React from "react";
import { HashLoader } from "react-spinners";
const Spinner: React.FC = () => {
  return (
    <div className="spinner">
      <HashLoader color="#2258a6" speedMultiplier={1} />
    </div>
  );
};

export default Spinner;
