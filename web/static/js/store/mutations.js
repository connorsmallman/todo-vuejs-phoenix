export default {
  addTodo(state, todo) {
    state.todos.push(todo);
  },

  receiveTodos(state, todos) {
    state.todos = todos;
  },

  deleteTodo(state, { todo }) {
    state.todos.splice(state.todos.indexOf(todo), 1)
  },

  editTodo(state, { todo }) {
    state.todos[state.todos.indexOf(todo)] = todo;
  },

  toggleTodo(state, { todo }) {
    state.todos[state.todos.indexOf(todo)] = todo;
  },

  clearCompleted(state) {
    state.todos = state.todos.filter(todo => !todo.complete);
  }
}
