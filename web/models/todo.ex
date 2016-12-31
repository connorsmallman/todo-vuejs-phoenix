defmodule BabyTodo.Todo do
  use BabyTodo.Web, :model

  schema "todos" do
    field :title, :string
    field :body, :string
    field :cost, :float
    field :complete, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :cost, :complete])
    |> validate_required([:title, :body])
  end
end
