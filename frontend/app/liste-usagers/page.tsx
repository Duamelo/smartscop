"use client";
import React, { useState } from "react";
import Table from "../components/Table";
import Search from "../components/Search";
import { GrTrash } from "react-icons/gr";
import Button from "../components/button";
import AdminLayout from "../layoutadmin";
import { MdEditDocument, MdPerson } from "react-icons/md";
import Image from "next/image";
import image1 from "../../public/icons/Add User Male.png";
interface User {
  id: number;
  lastName: string;
  firstName: string;
  gender: string;
  handicap: string;
  email: string;
  phone: string;
  reason: string;
}

const Usagers: React.FC = () => {
  const Columns = [
    { key: "id", header: "#" },
    { key: "lastName", header: "Nom" },
    { key: "firstName", header: "Prénoms" },
    { key: "gender", header: "Sexe" },
    { key: "email", header: "Email" },
    { key: "handicap", header: "Handicapé(e)" },
    { key: "phone", header: "Téléphone" },
    { key: "reason", header: "Motifs" },
  ];

  const Data: User[] = [
    {
      id: 1,
      lastName: "DOSSEH",
      firstName: "David",
      gender: "Homme",
      handicap: "Oui",
      email: "david.d@example.com",
      phone: "+22997989878",
      reason: "TinIMA",
    },
    {
      id: 2,
      lastName: "DOSSEH",
      firstName: "David",
      gender: "Homme",
      handicap: "Oui",
      email: "david.d@example.com",
      phone: "+22997989878",
      reason: "TinIMA",
    },
    {
      id: 3,
      lastName: "DOSSEH",
      firstName: "David",
      gender: "Homme",
      handicap: "Oui",
      email: "david.d@example.com",
      phone: "+22997989878",
      reason: "TinIMA",
    },
    {
      id: 4,
      lastName: "DOSSEH",
      firstName: "David",
      gender: "Homme",
      handicap: "Oui",
      email: "david.d@example.com",
      phone: "+22997989878",
      reason: "TinIMA",
    },
    {
      id: 5,
      lastName: "DOSSEH",
      firstName: "David",
      gender: "Homme",
      handicap: "Oui",
      email: "david.d@example.com",
      phone: "+22997989878",
      reason: "TinIMA",
    },
    {
      id: 6,
      lastName: "DOSSEH",
      firstName: "David",
      gender: "Homme",
      handicap: "Oui",
      email: "david.d@example.com",
      phone: "+22997989878",
      reason: "TinIMA",
    },
  ];

  const renderActions = () => {
    return (
      <div className="flex justify-around">
        <MdEditDocument />
        <GrTrash />
      </div>
    );
  };
  const [searchValue, setSearchValue] = useState("");

  const handleSearchChange = (value: string) => {
    setSearchValue(value);
  };
  return (
    <AdminLayout>
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-3xl font-bold">Liste globale</h1>
        <div className="flex  gap-4">
          <Search
            placeholder="Recherche"
            value={searchValue}
            onChange={handleSearchChange}
          />

          <Button
            label={"Ajouter"}
            variant="primary"
            icon={<Image src={image1.src} alt="" width={20} height={20} />}
            className=" rounded-lg gap-2 justify-center"
          />
        </div>
      </div>

      <Table columns={Columns} data={Data} actions={renderActions} />
    </AdminLayout>
  );
};

export default Usagers;
