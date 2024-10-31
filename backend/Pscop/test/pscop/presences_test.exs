defmodule Pscop.Usager.PresencesTest do
  use Pscop.Usager.DataCase

  alias Pscop.Usager.Presences

  describe "presence" do
    alias Pscop.Usager.Presences.Presence

    import Pscop.Usager.PresencesFixtures

    @invalid_attrs %{date: nil, duree: nil, motif: nil}

    test "list_presence/0 returns all presence" do
      presence = presence_fixture()
      assert Presences.list_presence() == [presence]
    end

    test "get_presence!/1 returns the presence with given id" do
      presence = presence_fixture()
      assert Presences.get_presence!(presence.id) == presence
    end

    test "create_presence/1 with valid data creates a presence" do
      valid_attrs = %{date: ~T[14:00:00], duree: 120.5, motif: "some motif"}

      assert {:ok, %Presence{} = presence} = Presences.create_presence(valid_attrs)
      assert presence.date == ~T[14:00:00]
      assert presence.duree == 120.5
      assert presence.motif == "some motif"
    end

    test "create_presence/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Presences.create_presence(@invalid_attrs)
    end

    test "update_presence/2 with valid data updates the presence" do
      presence = presence_fixture()
      update_attrs = %{date: ~T[15:01:01], duree: 456.7, motif: "some updated motif"}

      assert {:ok, %Presence{} = presence} = Presences.update_presence(presence, update_attrs)
      assert presence.date == ~T[15:01:01]
      assert presence.duree == 456.7
      assert presence.motif == "some updated motif"
    end

    test "update_presence/2 with invalid data returns error changeset" do
      presence = presence_fixture()
      assert {:error, %Ecto.Changeset{}} = Presences.update_presence(presence, @invalid_attrs)
      assert presence == Presences.get_presence!(presence.id)
    end

    test "delete_presence/1 deletes the presence" do
      presence = presence_fixture()
      assert {:ok, %Presence{}} = Presences.delete_presence(presence)
      assert_raise Ecto.NoResultsError, fn -> Presences.get_presence!(presence.id) end
    end

    test "change_presence/1 returns a presence changeset" do
      presence = presence_fixture()
      assert %Ecto.Changeset{} = Presences.change_presence(presence)
    end
  end
end
