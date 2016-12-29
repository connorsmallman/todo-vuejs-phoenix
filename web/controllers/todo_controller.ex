defmodule BabyTodo.TodoController do
  use BabyTodo.Web, :controller

  alias BabyTodo.{Repo, Todo}

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render conn, "todos.json", todos: todos
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = Repo.get(Todo, id)
    changeset = Todo.changeset(todo, todo_params)

    case Repo.update(changeset) do
      {:ok, todo} ->
        render conn, "todo.json", todo: todo
      {:error, _changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BabyTodo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Repo.get(Todo, id)
    Repo.delete!(todo)

    send_resp(conn, :no_content, "")
  end

  def create(conn, params) do
    changeset = Todo.changeset(%Todo{}, params)

    case Repo.insert(changeset) do
      {:ok, todo} ->
        render conn, "todo.json", todo: todo
      {:error, changeset} ->
        conn
          |> put_status(:unprocessable_entity)
          |> render(BabyTodo.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
