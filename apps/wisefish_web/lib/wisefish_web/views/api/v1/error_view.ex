defmodule WisefishWeb.Api.V1.ErrorView do
  use WisefishWeb, :view

  def render("error.json", %{message: message}) do
    %{message: message}
  end
end
