import fetch from '../helpers/fetch';

export default {
  getAllTodos({ commit }) {
    fetch('/api/todos')
      .then(response => commit('receiveTodos', response.data));
  },

  addTodo({ commit }, todo) {
    todo.complete = false;
    fetch('/api/todos', { method: 'POST', body: JSON.stringify(todo) })
      .then(response => commit('addTodo', response));
  },

  deleteTodo({ commit }, todo) {
    fetch(`/api/todos/${todo.id}`, { methed: 'DELETE' })
      .then(response => commit('deleteTodo', response));
  },

  editTodo({ commit }, todo) {
    fetch(`/api/todos/${todo.id}`, { method: 'PUT' })
      .then(response => commit('editTodo', response));
  }
}
