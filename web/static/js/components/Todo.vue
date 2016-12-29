<template>
  <article class="todo" :class="{ completed: todo.complete, editing: editing }">
    <header>
      <label for="complete">
        <input class="toggle"
          type="checkbox"
          id="complete"
          :checked="todo.complete"
          @change="toggleTodo({ todo: todo })">
          complete
      </label>
    </header>
    <div>
      <input
        id="title"
        @blur="doneEdit"
        :value="todo.title"
        type="text">
      <textarea
        id="body"
        @blur="doneEdit"
        :value="todo.body"
        type="text">
      </textarea>
      <input
        id="cost"
        @blur="doneEdit"
        :value="todo.cost"
        type="number">
    </div>
    <footer>
      <button class="destroy" @click="deleteTodo({ todo: todo })">delete</button>
    </footer>
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
    ...mapMutations([
      'toggleTodo',
    ]),
    doneEdit(e) {
      const value = e.target.value;
      const type = e.target.id;
      const { todo } = this;

      if (todo[type] !== value) {
        todo[type] = value;
        this.editTodo({ todo });
      }
    }
  }
}
</script>
