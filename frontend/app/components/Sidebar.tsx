"use client";
import { useState } from "react";
import {
  MdDashboard,
  MdSupervisedUserCircle,
  MdPeople,
  MdLogout,
} from "react-icons/md";
import { GrSchedules } from "react-icons/gr";
import { usePathname } from "next/navigation";
import Link from "next/link";

interface MenuItem {
  title: string;
  path: string;
  icon: JSX.Element;
}

interface MenuCategory {
  title: string;
  list: MenuItem[];
}

const menuItems: MenuCategory[] = [
  {
    title: "Pages",
    list: [
      { title: "Dashboard", path: "/dashboard", icon: <MdDashboard /> },

      {
        title: "Liste des Usagers",
        path: "/liste-usagers",
        icon: <MdSupervisedUserCircle />,
      },
      {
        title: "Nouveau Admin",
        path: "/nouveau-admin",
        icon: <MdPeople />,
      },
    ],
  },
];

const Sidebar: React.FC<{}> = () => {
  const [isLoading, setIsLoading] = useState(false);
  const pathname = usePathname();

  const handleLogout = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsLoading(true);
    try {
      // await logout();
    } catch (error) {
      console.error("Logout failed: ", error);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="h-full bg-sideground p-4 text-white flex flex-col justify-between">
      <div>
        <div className="text-2xl font-bold mb-10 text-center">Logo</div>
        <ul className="list-none space-y-6">
          {menuItems.map((cat) => (
            <li key={cat.title}>
              {cat.list.map((item) => (
                <Link href={item.path} key={item.title} passHref>
                  <p
                    className={`flex items-center px-3 py-2 rounded-lg transition-colors mb-2 ${
                      pathname === item.path
                        ? "bg-colorSecondary text-white"
                        : "hover:bg-blue-700"
                    }`}
                  >
                    <span className="mr-3">{item.icon}</span>
                    {item.title}
                  </p>
                </Link>
              ))}
            </li>
          ))}
        </ul>
      </div>
      <form onSubmit={handleLogout}>
        <button
          type="submit"
          className="flex items-center space-y-6 px-3 py-2  gap-2  bg-red-600 rounded-lg text-white hover:bg-colorRouge transition-colors"
        >
          <MdLogout size={20} />
          Déconnexion
        </button>
      </form>
    </div>
  );
};

export default Sidebar;
