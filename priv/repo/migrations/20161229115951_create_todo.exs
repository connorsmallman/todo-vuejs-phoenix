defmodule BabyTodo.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string
      add :body, :string
      add :cost, :float

      timestamps()
    end
  end
end
