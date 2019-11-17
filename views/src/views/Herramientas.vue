<template>
  <div class="container" id="tabla_datos">
    <h2 class="container">Herramientas</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Código</th>
          <th scope="col">Herramienta</th>
          <th scope="col">Cantidad Disponible</th>
        </tr>
      </thead>
      <tbody>
          <tr v-for="item in lists" v-bind:key="item.episode_id">
          <th scope="row">{{ item.episode_id }}</th>
          <td>{{ item.title }}</td>
          <td>{{ item.episode_id }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Herramientas",
  mounted() {
    this.getFilms();
  },
  data() {
    return {
      lists: []
    };
  },
  methods: {
    getFilms() {
      axios
        .get("https://swapi.co/api/films/")
        .then(res => {
          console.log(res);
          this.lists = res.data.results;
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>