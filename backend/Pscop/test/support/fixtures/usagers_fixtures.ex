defmodule Pscop.UsagersFixtures do

  def usager_fixture(attrs \\ %{}) do
    {:ok, usager} =
      attrs
      |> Enum.into(%{
        email: "some email",
        handicap: "some handicap",
        nom: "some nom",
        pin: "some pin",
        prenoms: "some prenoms",
        profession: "some profession",
        sexe: "some sexe",
        status: "some status",
        telephone: "some telephone"
      })
      |> Pscop.Usagers.create_usager()

    usager
  end
end
