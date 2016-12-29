<!--<style src="todomvc-app-css/index.css"></style>-->

<template>
  <section class="todoapp">
    <!-- header -->
    <header class="header">
      <h1>todos</h1>
      <div class="new-todo">
        <input v-model="title" autofocus autocomplete="off" placeholder="title">
        <textarea v-model="body" placeholder="body"></textarea>
        <input v-model="cost" placeholder="cost"/>
        <button @click="addTodo">Add</button>
      </div>
    </header>
    <!-- main section -->
    <section class="main" v-show="todos.length">
      <label for="toggleAll">
        <input name="toggleAll" id="toggleAll" class="toggle-all"
          type="checkbox"
          :checked="allChecked"
          @change="toggleAll({ done: !allChecked })">
        Toggle all
      </label>
      <todo v-for="todo in filteredTodos" :todo="todo"></todo>
    </section>
    <!-- footer -->
    <footer class="footer" v-show="todos.length">
      <span class="todo-count">
        <strong>{{ remaining }}</strong>
        {{ remaining | pluralize('item') }} left
      </span>
      <ul class="filters">
        <li v-for="(val, key) in filters">
          <a :href="'#/' + key"
            :class="{ selected: visibility === key }"
            @click="visibility = key">{{ key | capitalize }}</a>
        </li>
      </ul>
      <button class="clear-completed"
        v-show="todos.length > remaining"
        @click="clearCompleted">
        Clear completed
      </button>
    </footer>
  </section>
</template>

<script>
import { mapMutations, mapActions, mapGetters } from 'vuex';
import Todo from './Todo.vue';

const filters = {
  all: todos => todos,
  active: todos => todos.filter(todo => !todo.complete),
  completed: todos => todos.filter(todo => todo.complete)
}

export default {
  components: { Todo },
  data () {
    return {
      title: '',
      body: '',
      cost: '',
      visibility: 'all',
      filters: filters
    }
  },
  computed: {
    ...mapGetters([
      'todos',
      'allChecked',
      'remaining'
    ]),
    filteredTodos () {
      return filters[this.visibility](this.todos);
    },
  },
  methods: {
    clearForm() {
      this.title = '';
      this.body = '';
      this.cost = '';
    },
    addTodo () {
      if (this.title.trim()) {
        this.$store.dispatch('addTodo', {
          title: this.title,
          body: this.body,
          cost: parseFloat(this.cost)
        });
      }

      this.clearForm();
    },
    ...mapMutations([
      'toggleAll',
      'clearCompleted'
    ])
  },
  filters: {
    pluralize: (n, w) => n === 1 ? w : (w + 's'),
    capitalize: s => s.charAt(0).toUpperCase() + s.slice(1)
  },
  created() {
    this.$store.dispatch('getAllTodos');
  }
}
</script>
