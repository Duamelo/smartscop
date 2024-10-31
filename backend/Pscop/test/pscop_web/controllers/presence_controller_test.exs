defmodule Pscop.UsagerWeb.PresenceControllerTest do
  use Pscop.UsagerWeb.ConnCase

  import Pscop.Usager.PresencesFixtures

  alias Pscop.Usager.Presences.Presence

  @create_attrs %{
    date: ~T[14:00:00],
    duree: 120.5,
    motif: "some motif"
  }
  @update_attrs %{
    date: ~T[15:01:01],
    duree: 456.7,
    motif: "some updated motif"
  }
  @invalid_attrs %{date: nil, duree: nil, motif: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all presence", %{conn: conn} do
      conn = get(conn, ~p"/api/presence")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create presence" do
    test "renders presence when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/presence", presence: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/presence/#{id}")

      assert %{
               "id" => ^id,
               "date" => "14:00:00",
               "duree" => 120.5,
               "motif" => "some motif"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/presence", presence: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update presence" do
    setup [:create_presence]

    test "renders presence when data is valid", %{conn: conn, presence: %Presence{id: id} = presence} do
      conn = put(conn, ~p"/api/presence/#{presence}", presence: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/presence/#{id}")

      assert %{
               "id" => ^id,
               "date" => "15:01:01",
               "duree" => 456.7,
               "motif" => "some updated motif"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, presence: presence} do
      conn = put(conn, ~p"/api/presence/#{presence}", presence: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete presence" do
    setup [:create_presence]

    test "deletes chosen presence", %{conn: conn, presence: presence} do
      conn = delete(conn, ~p"/api/presence/#{presence}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/presence/#{presence}")
      end
    end
  end

  defp create_presence(_) do
    presence = presence_fixture()
    %{presence: presence}
  end
end
