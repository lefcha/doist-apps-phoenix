defmodule DoistApps.User.App do
  use Ecto.Schema
  import Ecto.Changeset

  schema "apps" do
    field :description, :string
    field :name, :string
    field :redirect_uri, :string
    field :user_id, :string

    timestamps()
  end

  @doc false
  def changeset(app, attrs) do
    app
    |> cast(attrs, [:user_id, :name, :description, :redirect_uri])
    |> validate_required([:user_id, :name, :description, :redirect_uri])
  end
end
