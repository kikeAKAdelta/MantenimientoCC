<template>
  <div id="solicitudes" class="container">
    <h2 class="container">Solicitudes Órdenes de Trabajo</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID Solicitud</th>
          <th scope="col">Equipo</th>
          <th scope="col">Tipo de Mantenimiento</th>
          <th scope="col">Tipo de Falla</th>
          <th scope="col">Asignar Fecha</th>
        </tr>
      </thead>
      <tbody> 
        <tr v-for="item in lists" v-bind:key="item.idsolicitud">
          <th scope="row">{{ item.idsolicitud }}</th>
          <td>{{ item.codinventario.nombre }}</td>
          <td>{{ item.idpromant.descripcion }}</td>
          <td>{{ item.tipofalla }}</td>
          <td><input placeholder="AAAA-MM-DD"></td>
              <div class = "botonera">
      <button type="button" class="btn btn-success" style="text-align:left" id="realizar">
        Aceptar
      </button>
      <button type="button" class="btn btn-danger" id="cancelar">
        Denegar
      </button>
    </div>
        </tr>
      </tbody>
    </table>
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
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/solicitudordentrabajo/")
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
    padding-top: 10px;
    justify-content: space-between;
    width: 100%;
  }

</style>

