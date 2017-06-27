defmodule PodiesSlack.Repo.Migrations.CreatePodiesSlack.Account.User do
  use Ecto.Migration

  def change do
    create table(:account_users) do
      add :name, :string
      add :username, :string
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:account_users, [:username])
    create unique_index(:account_users, [:email])

  end
end
