defmodule DoistApps.Repo do
  use Ecto.Repo,
    otp_app: :doist_apps,
    adapter: Ecto.Adapters.MyXQL
end
