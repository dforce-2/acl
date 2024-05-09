defmodule Acl.ACL.Rule do
  use Ecto.Schema
  import Ecto.Changeset

  schema "acl_rules" do
    field :condition, :integer, default: 1
    field :where_cond, :string, default: nil
    field :where_value, :string, default: nil
    field :where_field, :string, default: nil
    field :permission, :integer, default: 1
    field :action, :string, default: nil
    field :allowed, :boolean, default: false

    belongs_to :role, Acl.ACL.Role
    belongs_to :resource, Acl.ACL.Resource

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(rule, attrs, resource) do
    rule
    |> cast(attrs, [:action, :permission, :role_id, :condition])
    |> put_assoc(:resource, resource)
    |> validate_required([:resource, :role_id])
  end

  def u_changeset(rule, attrs) do
    rule
    |> cast(attrs, [:action, :permission, :role_id, :condition, :resource_id])
    |> validate_required([:resource_id, :role_id])
  end
end
