defmodule BabyTodo.TodoView do
  use BabyTodo.Web, :view

  def render("index.json", %{todos: todos}) do
    %{data: render_many(todos, BabyTodo.TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      title: todo.title,
      body: todo.body,
      cost: todo.cost,
      complete: todo.complete
    }
  end
end
