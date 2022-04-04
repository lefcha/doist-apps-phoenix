defmodule DoistAppsWeb.AppView do
  use DoistAppsWeb, :view
  alias DoistAppsWeb.AppView

  def render("index.json", %{apps: apps}) do
    %{data: render_many(apps, AppView, "app.json")}
  end

  def render("show.json", %{app: app}) do
    %{data: render_one(app, AppView, "app.json")}
  end

  def render("app.json", %{app: app}) do
    %{
      id: app.id,
      user_id: app.user_id,
      name: app.name,
      description: app.description,
      redirect_uri: app.redirect_uri
    }
  end
end
