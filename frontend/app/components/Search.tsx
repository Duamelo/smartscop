import React from "react";
import { GrSearch } from "react-icons/gr";
interface SearchProps {
  placeholder?: string;
  value: string;
  onChange: (value: string) => void;
}

const Search: React.FC<SearchProps> = ({ placeholder, value, onChange }) => {
  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    onChange(event.target.value);
  };

  return (
    <div className="relative">
      <GrSearch className="absolute left-3 top-3 text-black" />
      <input
        type="text"
        placeholder={placeholder}
        value={value}
        onChange={handleChange}
        className="border rounded-l-md p-2 pl-8 outline-none"
      />
    </div>
  );
};

export default Search;
