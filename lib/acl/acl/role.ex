defmodule Acl.ACL.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "acl_roles" do
    field :parent, :string
    field :role, :string
    field :is_member, :boolean
    field :organization_id, :integer

    has_many :rules, Acl.ACL.Rule

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:role, :parent, :organization_id, :is_member])
    |> validate_required([:role, :is_member])
    |> unique_constraint(:role, name: :acl_roles_role_organization_id_index)
  end
end
