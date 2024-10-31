defmodule Pscop.UsagerWeb.ErrorJSONTest do
  use Pscop.UsagerWeb.ConnCase, async: true

  test "renders 404" do
    assert Pscop.UsagerWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Pscop.UsagerWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
