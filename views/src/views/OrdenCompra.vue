<template>
  <div id="ordencompra" class="container">
    <h2 class="container">Orden de Compra</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">N° Compra</th>
          <th scope="col">Código Material</th>
          <th scope="col">Material</th>
          <th scope="col">Cantidad a comprar</th>
          <th scope="col">Estado</th>
          <th scope="col">Fecha</th>
        </tr>
      </thead>
      <tbody> 
        <tr v-for="item in lists" v-bind:key="item.episode_id">
          <th scope="row">{{ item.episode_id }}</th>
          <td>{{ item.episode_id }}</td>
          <td>{{ item.director }}</td>
          <td><input placeholder="3"></td>
          <td>
            <select>
              <option>{{ item.director }}</option>
              <option>{{ item.director }}</option>
              <option>{{ item.director }}</option>
            </select></td>
          <td>{{ item.director }}</td>
          <td><div id="checkboxes">
            <input type="checkbox" value=""/>
            </div></td>
        </tr>
      </tbody>
    </table>
    <br>
    <div class = "botonera">
      <button type="button" class="btn btn-success" style="text-align:left" id="realizar">
        Realizar Compra
      </button>
      <button type="button" class="btn btn-danger" id="cancelar">
        Cancelar Compra
      </button>
    </div>
    <br>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Peliculas",
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
    justify-content: space-between;
    width: 100%;
  }

</style>

