defmodule PscopWeb.FallbackController do
  use PscopWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: PscopWeb.ChangesetJSON)
    |> render(:error, changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(html: PscopWeb.ErrorHTML, json: PscopWeb.ErrorJSON)
    |> render(:"404")
  end
end
