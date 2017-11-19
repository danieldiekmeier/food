defmodule Food.AdminTest do
  use Food.DataCase

  alias Food.Admin

  describe "users" do
    alias Food.Admin.User

    @valid_attrs %{email: "some email", password: "some password", name: "some name"}
    @update_attrs %{email: "some updated email", password: "some updated password", name: "some updated name"}
    @invalid_attrs %{email: nil, password: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Admin.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Admin.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Admin.create_user(@valid_attrs)
      assert user.email == "some email"
      assert match?({:ok, _user}, Comeonin.Argon2.check_pass(user, "some password"))
      # assert user.password_hash == "some password_hash"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Admin.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert match?({:ok, _user}, Comeonin.Argon2.check_pass(user, "some updated password"))
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_user(user, @invalid_attrs)
      assert user == Admin.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Admin.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Admin.change_user(user)
    end
  end

  describe "recipe" do
    alias Food.Recipe

    @valid_attrs %{
      name: "Waffeln",
      slug: "waffeln",
      best: "Die besten Waffeln",
      ingredients: [
        %{ name: "Eier", amount: 2, unit: nil }
      ]
    }

    test "create_recipe/1 with valid data creates a recipe" do
      assert {:ok, %Recipe{} = recipe} = Admin.create_recipe(@valid_attrs)
      recipe = Food.Repo.preload(recipe, :ingredients)

      assert Enum.count(recipe.ingredients) == 1

      ingredient = Enum.at(recipe.ingredients, 0)

      assert ingredient.name == "Eier"
      assert ingredient.amount == 2
    end
  end
end
