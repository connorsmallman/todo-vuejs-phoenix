defmodule BabyTodo.Repo.Migrations.ModifyFieldsTodos do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      modify :cost, :float
    end
  end
end
