defmodule Pscop.UsagerWeb.UsagerControllerTest do
  use Pscop.UsagerWeb.ConnCase

  import Pscop.Usager.UsagersFixtures

  alias Pscop.Usager.Usagers.Usager

  @create_attrs %{
    status: "some status",
    pin: "some pin",
    nom: "some nom",
    prenoms: "some prenoms",
    telephone: "some telephone",
    email: "some email",
    sexe: "some sexe",
    profession: "some profession",
    handicap: "some handicap"
  }
  @update_attrs %{
    status: "some updated status",
    pin: "some updated pin",
    nom: "some updated nom",
    prenoms: "some updated prenoms",
    telephone: "some updated telephone",
    email: "some updated email",
    sexe: "some updated sexe",
    profession: "some updated profession",
    handicap: "some updated handicap"
  }
  @invalid_attrs %{status: nil, pin: nil, nom: nil, prenoms: nil, telephone: nil, email: nil, sexe: nil, profession: nil, handicap: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all usager", %{conn: conn} do
      conn = get(conn, ~p"/api/usager")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create usager" do
    test "renders usager when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/usager", usager: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/usager/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some email",
               "handicap" => "some handicap",
               "nom" => "some nom",
               "pin" => "some pin",
               "prenoms" => "some prenoms",
               "profession" => "some profession",
               "sexe" => "some sexe",
               "status" => "some status",
               "telephone" => "some telephone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/usager", usager: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update usager" do
    setup [:create_usager]

    test "renders usager when data is valid", %{conn: conn, usager: %Usager{id: id} = usager} do
      conn = put(conn, ~p"/api/usager/#{usager}", usager: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/usager/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some updated email",
               "handicap" => "some updated handicap",
               "nom" => "some updated nom",
               "pin" => "some updated pin",
               "prenoms" => "some updated prenoms",
               "profession" => "some updated profession",
               "sexe" => "some updated sexe",
               "status" => "some updated status",
               "telephone" => "some updated telephone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, usager: usager} do
      conn = put(conn, ~p"/api/usager/#{usager}", usager: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete usager" do
    setup [:create_usager]

    test "deletes chosen usager", %{conn: conn, usager: usager} do
      conn = delete(conn, ~p"/api/usager/#{usager}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/usager/#{usager}")
      end
    end
  end

  defp create_usager(_) do
    usager = usager_fixture()
    %{usager: usager}
  end
end
