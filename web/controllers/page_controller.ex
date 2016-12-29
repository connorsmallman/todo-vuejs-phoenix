defmodule BabyTodo.PageController do
  use BabyTodo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
