import React from "react";

interface ButtonProps {
  label: string;
  variant?: "default" | "primary" | "danger";
  type?: "button" | "submit" | "reset";
  icon?: React.ReactNode;
  onClick?: () => void;
  className?: string;
}

const Button: React.FC<ButtonProps> = ({
  label,
  variant = "default",
  icon,
  onClick,
  type = "button",
  className,
}) => {
  const baseStyles = " flex px-2 py-2 text-[15px]";
  const variantStyles = {
    default: "border border-colorVert text-white hover:bg-opacity-20 ",
    primary: "bg-colorVert text-white hover:bg-opacity-80",
    danger: "bg-colorRouge hover:bg-red-600 focus:ring-red-500 text-white",
  };

  return (
    <button
      type={type}
      className={`${baseStyles} ${variantStyles[variant]} ${className}`}
      onClick={onClick}
    >
      {icon && <span className="text-lg">{icon}</span>}
      {label}
    </button>
  );
};

export default Button;
