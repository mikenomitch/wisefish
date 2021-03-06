defmodule WisefishWeb.Api.V1.UserView do
  use WisefishWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, __MODULE__, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, __MODULE__, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, email: user.email, name: user.name}
  end

  def user_json(user) do
    %{id: user.id, email: user.email, name: user.name}
  end
end
