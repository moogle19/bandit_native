defmodule Bandit.Native do
  use Rustler, otp_app: :bandit_native, crate: "bandit_native"
  def mask(_payload, _mask), do: :erlang.nif_error(:nif_not_loaded)
end
