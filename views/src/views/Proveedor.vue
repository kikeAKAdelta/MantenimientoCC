<template>
  <div class="container" id="tabla_datos">
    <h2 class="container">Proveedores</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Código</th>
          <th scope="col">Proveedor</th>
          <th scope="col">Teléfono</th>
        </tr>
      </thead>
      <tbody>
          <tr v-for="item in lists" v-bind:key="item.idproveedor">
          <th scope="row">{{ item.idproveedor }}</th>
          <td>{{ item.nombre }}</td>
          <td>{{ item.telefono }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Proveedores",
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
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/proveedores")
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