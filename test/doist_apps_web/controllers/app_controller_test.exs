defmodule DoistAppsWeb.AppControllerTest do
  use DoistAppsWeb.ConnCase

  import DoistApps.UserFixtures

  alias DoistApps.User.App

  @create_attrs %{
    description: "some description",
    name: "some name",
    redirect_uri: "some redirect_uri",
    user_id: "some user_id"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    redirect_uri: "some updated redirect_uri",
    user_id: "some updated user_id"
  }
  @invalid_attrs %{description: nil, name: nil, redirect_uri: nil, user_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all apps", %{conn: conn} do
      conn = get(conn, Routes.app_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create app" do
    test "renders app when data is valid", %{conn: conn} do
      conn = post(conn, Routes.app_path(conn, :create), app: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.app_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some description",
               "name" => "some name",
               "redirect_uri" => "some redirect_uri",
               "user_id" => "some user_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.app_path(conn, :create), app: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update app" do
    setup [:create_app]

    test "renders app when data is valid", %{conn: conn, app: %App{id: id} = app} do
      conn = put(conn, Routes.app_path(conn, :update, app), app: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.app_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "name" => "some updated name",
               "redirect_uri" => "some updated redirect_uri",
               "user_id" => "some updated user_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, app: app} do
      conn = put(conn, Routes.app_path(conn, :update, app), app: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete app" do
    setup [:create_app]

    test "deletes chosen app", %{conn: conn, app: app} do
      conn = delete(conn, Routes.app_path(conn, :delete, app))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.app_path(conn, :show, app))
      end
    end
  end

  defp create_app(_) do
    app = app_fixture()
    %{app: app}
  end
end
