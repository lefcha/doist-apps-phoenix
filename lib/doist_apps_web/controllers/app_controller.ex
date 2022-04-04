defmodule DoistAppsWeb.AppController do
  use DoistAppsWeb, :controller

  alias DoistApps.User
  alias DoistApps.User.App

  action_fallback DoistAppsWeb.FallbackController

  def index(conn, _params) do
    apps = User.list_apps()
    render(conn, "index.json", apps: apps)
  end

  def create(conn, %{"app" => app_params}) do
    with {:ok, %App{} = app} <- User.create_app(app_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.app_path(conn, :show, app))
      |> render("show.json", app: app)
    end
  end

  def show(conn, %{"id" => id}) do
    app = User.get_app!(id)
    render(conn, "show.json", app: app)
  end

  def update(conn, %{"id" => id, "app" => app_params}) do
    app = User.get_app!(id)

    with {:ok, %App{} = app} <- User.update_app(app, app_params) do
      render(conn, "show.json", app: app)
    end
  end

  def delete(conn, %{"id" => id}) do
    app = User.get_app!(id)

    with {:ok, %App{}} <- User.delete_app(app) do
      send_resp(conn, :no_content, "")
    end
  end
end
