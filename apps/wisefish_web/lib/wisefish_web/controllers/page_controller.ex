defmodule WisefishWeb.PageController do
  use WisefishWeb, :controller
  alias Wisefish.Accounts.{Authentication, User}
  alias Wisefish.Repo

  def index(conn, _params) do
    serve_application(conn)
  end

  def login_link(conn, %{"token" => token}) do
    with {:ok, claims} <- Authentication.decode_and_verify(token, %{"typ" => "login_link"}),
         user = %User{} <- Repo.get(User, claims["sub"]) |> Repo.preload(:credentials),
         {:ok, auth_token, _claims} <- Authentication.encode_and_sign(user, %{}) do
      conn |> redirect(to: "/logged_in?token=#{auth_token}")
    else
      _ -> serve_application(conn)
    end
  end

  defp serve_application(conn) do
    path = Application.app_dir(:wisefish_web, "priv/static/index.html")

    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> Plug.Conn.send_file(200, path)
  end
end
