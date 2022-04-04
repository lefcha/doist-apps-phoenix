defmodule DoistApps.UserTest do
  use DoistApps.DataCase

  alias DoistApps.User

  describe "apps" do
    alias DoistApps.User.App

    import DoistApps.UserFixtures

    @invalid_attrs %{description: nil, name: nil, redirect_uri: nil, user_id: nil}

    test "list_apps/0 returns all apps" do
      app = app_fixture()
      assert User.list_apps() == [app]
    end

    test "get_app!/1 returns the app with given id" do
      app = app_fixture()
      assert User.get_app!(app.id) == app
    end

    test "create_app/1 with valid data creates a app" do
      valid_attrs = %{description: "some description", name: "some name", redirect_uri: "some redirect_uri", user_id: "some user_id"}

      assert {:ok, %App{} = app} = User.create_app(valid_attrs)
      assert app.description == "some description"
      assert app.name == "some name"
      assert app.redirect_uri == "some redirect_uri"
      assert app.user_id == "some user_id"
    end

    test "create_app/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_app(@invalid_attrs)
    end

    test "update_app/2 with valid data updates the app" do
      app = app_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", redirect_uri: "some updated redirect_uri", user_id: "some updated user_id"}

      assert {:ok, %App{} = app} = User.update_app(app, update_attrs)
      assert app.description == "some updated description"
      assert app.name == "some updated name"
      assert app.redirect_uri == "some updated redirect_uri"
      assert app.user_id == "some updated user_id"
    end

    test "update_app/2 with invalid data returns error changeset" do
      app = app_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_app(app, @invalid_attrs)
      assert app == User.get_app!(app.id)
    end

    test "delete_app/1 deletes the app" do
      app = app_fixture()
      assert {:ok, %App{}} = User.delete_app(app)
      assert_raise Ecto.NoResultsError, fn -> User.get_app!(app.id) end
    end

    test "change_app/1 returns a app changeset" do
      app = app_fixture()
      assert %Ecto.Changeset{} = User.change_app(app)
    end
  end
end
