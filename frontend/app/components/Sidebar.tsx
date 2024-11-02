"use client";
import { useState } from "react";
import {
  MdDashboard,
  MdSupervisedUserCircle,
  MdPeople,
  MdLogout,
} from "react-icons/md";
import { usePathname } from "next/navigation";
import Link from "next/link";
import Image from "next/image";
import image1 from "../../public/icons/Add User Male.png";
import image2 from "../../public/icons/Logout.png";
import image3 from "../../public/icons/Users.png";
import image4 from "../../public/icons/Logo-blanc 1.png";
import image5 from "../../public/icons/Control Panel.png";
interface MenuItem {
  title: string;
  path: string;
  icon: string;
}

interface MenuCategory {
  title: string;
  list: MenuItem[];
}

const menuItems: MenuCategory[] = [
  {
    title: "Pages",
    list: [
      { title: "Dashboard", path: "/dashboard", icon: image5.src },

      {
        title: "Liste des Usagers",
        path: "/liste-usagers",
        icon: image3.src,
      },
      {
        title: "Nouveau Admin",
        path: "/nouveau-admin",
        icon: image1.src,
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
        <div className="text-2xl font-bold mb-10 flex justify-center items-center">
          <Image src={image4} alt="" width={100} height={100} />
        </div>
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
                    <span className="mr-3">
                      <Image src={item.icon} alt="" width={20} height={20} />
                    </span>
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
          className="flex items-center space-y-6 px-3 py-2  gap-2  bg-red-600 rounded-lg text-white hover:bg-colorRouge transition-colors w-[100%]"
        >
          <Image src={image2} alt="" width={20} height={20} />
          Déconnexion
        </button>
      </form>
    </div>
  );
};

export default Sidebar;
