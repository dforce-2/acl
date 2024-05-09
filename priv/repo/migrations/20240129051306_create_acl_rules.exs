defmodule Acl.Repo.Migrations.CreateAclRules do
  use Ecto.Migration

  def change do
    create table(:acl_rules) do
      add :role_id, references(:acl_roles, on_delete: :delete_all)
      add :resource_id, references(:acl_resources, on_delete: :delete_all)

      add :action, :string, default: nil
      add :allowed, :boolean, default: false
      add :permission, :int, default: 1
      add :condition, :int, default: 1
      add :where_field, :string, default: nil
      add :where_value, :string, default: nil
      add :where_cond, :string, default: nil

      timestamps(type: :utc_datetime)
    end

    create index(:acl_rules, [:role_id])
    create index(:acl_rules, [:resource_id])
    create index(:acl_rules, [:role_id, :resource_id])
  end
end
