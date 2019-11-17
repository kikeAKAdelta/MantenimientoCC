<template>
  <div class="container" id="tabla_datos">
    <h2 class="container">Inventario</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Código</th>
          <th scope="col">Nombre</th>
          <th scope="col">Descripcion</th>
          <th scope="col">Modelo</th>
          <th scope="col">Número de Serie</th>
          <th scope="col">Año</th>
          <th scope="col">Condición</th>
          <th scope="col">Ubicación</th>
          <th scope="col">Vida Útil</th>
          <th scope="col">Garantía</th>
        </tr>
      </thead>
      <tbody>
          <tr v-for="item in lists" v-bind:key="item.episode_id">
          <th scope="row">{{ item.episode_id }}</th>
          <td>{{ item.title }}</td>
          <td>{{ item.opening_crawl }}</td>
          <td>{{ item.director }}</td>
          <td>{{ item.episode_id }}</td>
          <td>{{ item.episode_id }}</td>
          <td>{{ item.director }}</td>
          <td>{{ item.episode_id }}</td>
          <td>{{ item.episode_id }}</td>
          <td>{{ item.episode_id }}</td>
        </tr>
      </tbody>
    </table>
    <br>
    <div class = "botonera">
        <button type="button" class="btn btn-info" style='width:150px; height:50px' id="nuevo">
            Nuevo
        </button>
    </div>
    <br>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Inventario",
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

<style type="text/css">
    .botonera {
        display: flex;
        justify-content: end;
        padding-right: 2%;
        padding-bottom: 2%;
        width: 100%;
    }
    .nuevo{
        width: 30%;
    }
</style>
