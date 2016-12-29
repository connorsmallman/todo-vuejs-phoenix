defmodule BabyTodo.TodoController do
  use BabyTodo.Web, :controller

  alias BabyTodo.{Repo, Todo}

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render conn, "index.json", todos: todos
  end

  def edit(conn, params) do
    
  end

  def create(conn, params) do
    changeset = Todo.changeset(%Todo{}, params)

    case Repo.insert(changeset) do
      {:ok, todo} ->
        render conn, "todo.json", todo: todo
      {:error, changeset} ->
        conn
    end
  end

  def delete(conn, params) do

  end
end
