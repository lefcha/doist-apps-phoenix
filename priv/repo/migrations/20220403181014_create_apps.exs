defmodule DoistApps.Repo.Migrations.CreateApps do
  use Ecto.Migration

  def change do
    create table(:apps) do
      add :user_id, :string
      add :name, :string
      add :description, :string
      add :redirect_uri, :string

      timestamps()
    end
  end
end
