defmodule WisefishWeb.Authentication.ApiAuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :wisefish,
    error_handler: WisefishWeb.Authentication.ErrorHandler,
    module: Wisefish.Accounts.Authentication

  # If there is a session token, restrict it to an access token and validate it
  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  # If there is an authorization header, restrict it to an access token and validate it
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  # Load the user if either of the verifications worked
  plug(Guardian.Plug.LoadResource, allow_blank: true)
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(WisefishWeb.Authentication.WithUser)
end
