import * as types from './mutation-types'

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

  editTodo(state, { todo, title, body, cost }) {
    todo.title = title;
    todo.body = body;
    todo.cost = cost;
  },

  toggleTodo(state, { todo }) {
    todo.complete = !todo.complete;
  },

  toggleAll(state, { complete }) {
    state.todos.forEach(todo => todo.complete = complete);
  },

  clearCompleted(state) {
    state.todos = state.todos.filter(todo => !todo.complete);
  }
}
