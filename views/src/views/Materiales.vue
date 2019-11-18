<template>
  <div class="container" id="tabla_datos">
    <h2 class="container">Materiales</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Código</th>
          <th scope="col">Material</th>
          <th scope="col">Descripcion</th>
          <th scope="col">Proveedor</th>
          <th scope="col">Cantidad Disponible</th>
          <th scope="col">Costo Unitario</th>
        </tr>
      </thead>
      <tbody>
          <tr v-for="item in lists" v-bind:key="item.codmaterial">
          <th scope="row">{{ item.codmaterial }}</th>
          <td>{{ item.nombre }}</td>
          <td>{{ item.descripcion }}</td>
          <td>{{ item.idproveedor.nombre }}</td>
          <td>{{ item.cantidad }}</td>
          <td>{{ item.costo }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Materiales",
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
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/materiales")
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