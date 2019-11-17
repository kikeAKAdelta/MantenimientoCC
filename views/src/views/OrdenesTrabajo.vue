<template>
  <div id="ordentrabajo" class="container">
    <h2 class="container">Órdenes de Trabajo</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID Orden Trabajo</th>
          <th scope="col">Equipo</th>
          <th scope="col">Tipo de Mantenimiento</th>
          <th scope="col">Tipo de Falla</th>
          <th scope="col">Fecha Asignada</th>
          <th scope="col">Estado</th>
          <th scope="col">Procedimiento</th>
        </tr>
      </thead>
      <tbody> 
        <tr v-for="item in lists" v-bind:key="item.episode_id">
          <th scope="row">{{ item.episode_id }}</th>
          <td>{{ item.episode_id }}</td>
          <td>{{ item.director }}</td>
          <td>{{ item.episode_id }}</td>
          <td>{{ item.director }}</td>
          <td>En Proceso</td>
          <td>  
            <select>
                <option>PROCEDIMIENTO 1</option>
                <option>PROCEDIMIENTO 2</option>
            </select>
            </td>
          <td><div id="checkboxes">
            <input type="checkbox" value=""/>
            </div></td>
        </tr>
      </tbody>
    </table>
    <br>
    <div class = "botonera">
      <button type="button" class="btn btn-success" style="text-align:left" id="realizar">
        Órden Finalizada
      </button>
      <button type="button" class="btn btn-danger" id="cancelar">
        Órden Cancelada
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

