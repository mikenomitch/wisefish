defmodule Wisefish.Email do
  import Bamboo.Email
  alias Wisefish.Mailer

  def send_login_link(email_address, token) do
    login_link = "localhost:4000/magic_login/#{token}"

    email_address
    |> base_email()
    |> subject("Wisefish: Login")
    |> html_body("<p><a href=\"#{login_link}\">Go to Wisefish</a></p>")
    |> text_body("login to wisefish")
    |> Mailer.deliver_later()
  end

  def send_password_reset(email_address, token) do
    pw_reset_link = "localhost:3000/password_reset/#{token}"

    email_address
    |> base_email()
    |> subject("Wisefish: Password Reset")
    |> html_body("<p><a href=\"#{pw_reset_link}\">Reset Wisefish Password</a></p>")
    |> text_body("password reset")
    |> Mailer.deliver_later()
  end

  def send_welcome_email(email_address) do
    email_address
    |> base_email()
    |> subject("Wisefish: Test Email")
    |> html_body("<p>Welcome to Wisefish</p>")
    |> text_body("welcome")
    |> Mailer.deliver_later()
  end

  defp base_email(email_address) do
    new_email()
    |> to(System.get_env("EMAIL_OVERRIDE") || email_address)
    |> from("notifications@relayd.io")
  end
end
