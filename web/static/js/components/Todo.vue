<template>
  <article class="todo" :class="{ completed: todo.complete, editing: editing }">
    <div class="todo-control">
      <input class="toggle"
        type="checkbox"
        id="complete"
        :checked="todo.complete"
        @change="toggleTodo({ todo: todo })">
    </div>
    <div class="todo-body">
      <input
        id="title"
        @blur="doneEdit"
        :value="todo.title"
        type="text">
      <input
        id="body"
        @blur="doneEdit"
        :value="todo.body"
        type="text">
      <input
        id="cost"
        @blur="doneEdit"
        :value="todo.cost"
        type="number">
      <button class="destroy" @click="deleteTodo({ todo: todo })">Delete</button>
    </div>
  </article>
</template>

<script>
import { mapMutations, mapActions } from 'vuex';
export default {
  name: 'todo',
  props: ['todo'],
  directives: {
    focus (el, { value }, { context }) {
      if (value) {
        context.$nextTick(() => {
          el.focus()
        })
      }
    }
  },
  methods: {
    ...mapActions([
      'editTodo',
      'deleteTodo'
    ]),
    toggleTodo(e) {
      const { todo } = this;
      todo.complete = !todo.complete;

      console.log(todo.complete);

      this.$store.dispatch('toggleTodo', { todo });
    },
    doneEdit(e) {
      const value = e.target.value;
      const type = e.target.id;
      const { todo } = this;

      if (todo[type] != value) {
        todo[type] = value;
        this.editTodo({ todo });
      }
    }
  }
}
</script>
