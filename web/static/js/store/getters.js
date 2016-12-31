export const todos = state => state.todos;
export const allChecked = state => state.todos.every(t => t.complete);
export const remaining = state => state.todos.filter(t => !t.complete).length;
export const total = state => state.todos.filter(t => !t.complete).map(t => t.cost).reduce((a,b) => a + b, 0);
