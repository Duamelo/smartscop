import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        background: "#EDEDED",
        sideground: "#2258A6",
        colortext: "#626262",
        colorPrimary: "#1C1D22",
        colorSecondary: "#8EDBDE",
        colorRouge: " #ee3e41",
        colorVert: "#63ca59",
      },

      fontFamily: {
        dm_sans: ["DM Sans", "sans-serif"],
        poppins: ["Poppins", "sans-serif"],
        open_sans: ["Open Sans", "sans serif"],
        jakarta: ["Plus Jakarta Sans", "sans-serif"],
      },
  
      fontWeight: {
        regular: "400",
        medium: "480",
      },
    },
  },
  plugins: [],
};
export default config;
