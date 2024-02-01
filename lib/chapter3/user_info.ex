defmodule UserInfo do
  @moduledoc """
  Extract user info
  """

  defp extract_login(%{"login" => login}) do
    {:ok, login}
  end

  defp extract_login(_) do
    {:error, "login missing"}
  end

  defp extract_email(%{"email" => email}) do
    {:ok, email}
  end

  defp extract_email(_) do
    {:error, "email missing"}
  end

  defp extract_password(%{"password" => password}) do
    {:ok, password}
  end

  defp extract_password(_) do
    {:error, "password missing"}
  end

  def extract_user(user) do
    with {:ok, login} <- extract_login(user),
          {:ok, email} <- extract_email(user),
          {:ok, password} <- extract_password(user) do
      {:ok, %{login: login, email: email, password: password}}
    end
  end

end
