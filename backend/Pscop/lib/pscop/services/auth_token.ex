defmodule Pscop.Services.AuthToken do
  use Joken.Config

  @secret_key "rppgj4PxvUgdYIt3XPtLAixmaZnkudHFC4zdZPtoVKrbZRZuCdD6i8GsaLFaRGjh"

  def generate_token(account, xsrf_token) do
    expiration_time = 86400

    claims = %{
      "account_id" => account.id,
      "role" => account.role_id,
      "xsrf-token" => xsrf_token,
      "exp" => Joken.current_time() + expiration_time
    }

    signer = Joken.Signer.create("HS256", @secret_key)

    token = Joken.generate_and_sign!(%{}, %{claims: claims}, signer)

    {:ok, token}
  end

  def verify_token(token) do
    signer = Joken.Signer.create("HS256", @secret_key)

    case Joken.verify(token, signer) do
      {:ok, claims} -> {:ok, claims}
      {:error, reason} -> {:error, reason}
    end
  end

  def get_xsrf_token do
    :crypto.strong_rand_bytes(16) |> Base.encode64()
  end

  def validate_xsrf_token(jwt_xsrf_token, request_xsrf_token) do
      jwt_xsrf_token == request_xsrf_token
  end
end
