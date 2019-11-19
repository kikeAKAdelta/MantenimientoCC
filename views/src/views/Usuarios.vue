<template>
  <div class="container" id="tabla_datos">
    <h2 class="container">Usuarios</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Código</th>
          <th scope="col">Username</th>
          <th scope="col">Nombres</th>
          <th scope="col">Apellidos</th>
          <th scope="col">Rol</th>
        </tr>
      </thead>
      <tbody>
          <tr v-for="item in lists" v-bind:key="item.idusuario">
          <th scope="row">{{ item.idusuario }}</th>
          <td>{{ item.username }}</td>
          <td>{{ item.nombres }}</td>
          <td>{{ item.apellidos }}</td>
          <td>{{ item.idrol.rol }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Usuarios",
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
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/usuarios")
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