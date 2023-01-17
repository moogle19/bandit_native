defmodule Bandit.Native do
  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :bandit_native,
    crate: "bandit_native",
    base_url: "https://github.com/moogle19/bandit_native/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_BANDIT_NATIVE_BUILD") in ["1", "true"],
    mode: if(Mix.env() == :prod, do: :release, else: :debug),
    version: version

  def mask(_payload, _mask), do: :erlang.nif_error(:nif_not_loaded)
end
