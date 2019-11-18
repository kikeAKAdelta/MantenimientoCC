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
          <tr v-for="item in lists" v-bind:key="item.codinventario">
          <th scope="row">{{ item.codinventario }}</th>
          <td>{{ item.nombre }}</td>
          <td>{{ item.descripcion }}</td>
          <td>{{ item.modelo }}</td>
          <td>{{ item.numeroserie }}</td>
          <td>{{ item.ano }}</td>
          <td>{{ item.condicion }}</td>
          <td>{{ item.ubicacion }}</td>
          <td>{{ item.vidautil }}</td>
          <td>{{ item.garantia }}</td>
        </tr>
      </tbody>
    </table>
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
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/inventario")
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