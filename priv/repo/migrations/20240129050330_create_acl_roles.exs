defmodule Acl.Repo.Migrations.CreateAclRoles do
  use Ecto.Migration

  def change do
    create table(:acl_roles) do
      add :role, :string, null: false
      add :parent, :string, default: nil
      add :is_member, :boolean
      add :organization_id, :integer

      timestamps(type: :utc_datetime)
    end

    create unique_index(:acl_roles, [:role, :organization_id], name: :acl_roles_role_organization_id_index)
  end
end
