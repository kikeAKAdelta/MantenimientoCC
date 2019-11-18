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
          <tr v-for="item in lists" v-bind:key="item.idherramienta">
          <th scope="row">{{ item.idherramienta }}</th>
          <td>{{ item.nombre }}</td>
          <td>{{ item.cantidad }}</td>
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
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/herramientas")
        .then(res => {
          console.log(res);
          this.lists = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>