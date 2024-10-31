defmodule Pscop.PresencesFixtures do

  def presence_fixture(attrs \\ %{}) do
    {:ok, presence} =
      attrs
      |> Enum.into(%{
        date: ~T[14:00:00],
        duree: 120.5,
        motif: "some motif"
      })
      |> Pscop.Presences.create_presence()

    presence
  end
end
