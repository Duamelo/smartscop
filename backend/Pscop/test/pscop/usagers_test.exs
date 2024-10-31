defmodule Pscop.Usager.UsagersTest do
  use Pscop.Usager.DataCase

  alias Pscop.Usager.Usagers

  describe "usager" do
    alias Pscop.Usager.Usagers.Usager

    import Pscop.Usager.UsagersFixtures

    @invalid_attrs %{status: nil, pin: nil, nom: nil, prenoms: nil, telephone: nil, email: nil, sexe: nil, profession: nil, handicap: nil}

    test "list_usager/0 returns all usager" do
      usager = usager_fixture()
      assert Usagers.list_usager() == [usager]
    end

    test "get_usager!/1 returns the usager with given id" do
      usager = usager_fixture()
      assert Usagers.get_usager!(usager.id) == usager
    end

    test "create_usager/1 with valid data creates a usager" do
      valid_attrs = %{status: "some status", pin: "some pin", nom: "some nom", prenoms: "some prenoms", telephone: "some telephone", email: "some email", sexe: "some sexe", profession: "some profession", handicap: "some handicap"}

      assert {:ok, %Usager{} = usager} = Usagers.create_usager(valid_attrs)
      assert usager.status == "some status"
      assert usager.pin == "some pin"
      assert usager.nom == "some nom"
      assert usager.prenoms == "some prenoms"
      assert usager.telephone == "some telephone"
      assert usager.email == "some email"
      assert usager.sexe == "some sexe"
      assert usager.profession == "some profession"
      assert usager.handicap == "some handicap"
    end

    test "create_usager/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usagers.create_usager(@invalid_attrs)
    end

    test "update_usager/2 with valid data updates the usager" do
      usager = usager_fixture()
      update_attrs = %{status: "some updated status", pin: "some updated pin", nom: "some updated nom", prenoms: "some updated prenoms", telephone: "some updated telephone", email: "some updated email", sexe: "some updated sexe", profession: "some updated profession", handicap: "some updated handicap"}

      assert {:ok, %Usager{} = usager} = Usagers.update_usager(usager, update_attrs)
      assert usager.status == "some updated status"
      assert usager.pin == "some updated pin"
      assert usager.nom == "some updated nom"
      assert usager.prenoms == "some updated prenoms"
      assert usager.telephone == "some updated telephone"
      assert usager.email == "some updated email"
      assert usager.sexe == "some updated sexe"
      assert usager.profession == "some updated profession"
      assert usager.handicap == "some updated handicap"
    end

    test "update_usager/2 with invalid data returns error changeset" do
      usager = usager_fixture()
      assert {:error, %Ecto.Changeset{}} = Usagers.update_usager(usager, @invalid_attrs)
      assert usager == Usagers.get_usager!(usager.id)
    end

    test "delete_usager/1 deletes the usager" do
      usager = usager_fixture()
      assert {:ok, %Usager{}} = Usagers.delete_usager(usager)
      assert_raise Ecto.NoResultsError, fn -> Usagers.get_usager!(usager.id) end
    end

    test "change_usager/1 returns a usager changeset" do
      usager = usager_fixture()
      assert %Ecto.Changeset{} = Usagers.change_usager(usager)
    end
  end
end
