defmodule Food.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Food.Admin.User


  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end

  def create_changeset(%User{} = user, attrs) do
    user
    |> changeset(attrs)
    |> cast(attrs, [:password])
    |> validate_required([:password])
    |> validate_password(:password)
    |> put_pass_hash()
  end

  def validate_password(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, password ->
      case valid_password?(password) do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || msg}]
      end
    end)
  end

  defp valid_password?(password) when byte_size(password) > 7 do
    {:ok, password}
  end
  defp valid_password?(_), do: {:error, "The password is too short"}

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes:
      %{password: password}} = changeset) do
    change(changeset, Comeonin.Argon2.add_hash(password, hash_key: :password_hash))
  end
  defp put_pass_hash(changeset), do: changeset
end
