export const todos = state => state.todos;
export const allChecked = state => state.todos.every(todo => todo.complete);
export const remaining = state => state.todos.filter(todo => !todo.complete).length;
