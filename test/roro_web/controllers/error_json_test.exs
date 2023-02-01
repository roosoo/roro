defmodule RoroWeb.ErrorJSONTest do
  use RoroWeb.ConnCase, async: true

  test "renders 404" do
    assert RoroWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert RoroWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
