defmodule DoistApps.UserFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DoistApps.User` context.
  """

  @doc """
  Generate a app.
  """
  def app_fixture(attrs \\ %{}) do
    {:ok, app} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        redirect_uri: "some redirect_uri",
        user_id: "some user_id"
      })
      |> DoistApps.User.create_app()

    app
  end
end
