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
    <div @dblclick="editing = true">
      <h1>{{todo.title}}</h1>
      <p>{{todo.body}}</p>
    </div>
    <div class="edit" v-show="editing">
      <input type="text" v-model="todo.title"/>
      <textarea type="text" v-model="todo.body"></textarea>
      <button class="save" @click="doneEdit">save</button>
      <button class="cancel" @click="cancelEdit">cancel</button>
    </div>
    <footer>
      <button class="destroy" @click="deleteTodo({ todo: todo })">delete</button>
    </footer>
  </article>
</template>

<script>
import { mapMutations, mapActions } from 'vuex';
export default {
  name: 'Todo',
  props: ['todo'],
  data () {
    return {
      editing: false
    }
  },
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
    doneEdit() {
      const { todo } = this

      if (!title) {
        this.deleteTodo({ todo });
      } else if (this.editing) {
        this.editTodo({ todo });
        this.editing = false
      }
    }
  }
}
</script>
