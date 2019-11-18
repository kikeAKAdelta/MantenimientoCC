<template>
  <div id="herramienta" class="container">
      <div class="card mb-3">
          <div class="card-body">
              <span class="float-right" style="cursor:pointer"
              @click="limpiar()"><h6>LIMPIAR</h6>
              </span>
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="nombre" type="text" class="form-control mb-2" placeholder="HERRAMIENTA" v-model="Herramienta.nombre">
                <input id="cantidad" type="text" class="form-control mb-2" placeholder="CANTIDAD" v-model="Herramienta.cantidad">
            </div>
          </div>
          <div class = "botonera">
            <button type="button" class="btn btn-success" style='width:150px; height:50px' id="agregar" @click="getPosts()">
                Agregar
            </button>
        </div>
      </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Herramientas",
  data() {
    return{
      Herramienta: {nombre:'', cantidad:''},
    };
  },
  methods: {
    limpiar(){
        document.getElementById("nombre").value = "";
        document.getElementById("cantidad").value = "";
    },
    getPosts() {
          let nuevaHerramienta = JSON.stringify({
            nombre: this.Herramienta.nombre,
            cantidad: this.Herramienta.cantidad
          });
          console.log(nuevaHerramienta);
          axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/herramientas/', nuevaHerramienta
          ,{
            headers: {
              "Access-Control-Allow-Origin":"*",
              "Accept": "application/json",
             'Content-Type': 'application/json',
              "Authorization": "Bearer token",
              },
              method:"POST"
          })
          .then((response) => {
            console.log(response);
          })
          .catch((error) => {
            console.log(error);
          });
        },
      }, mounted() {
          this.getPosts();
      }
    };
</script>


<style type="text/css">
    .botonera {
        display: flex;
        justify-content: flex-end;
        padding-right: 2%;
        padding-bottom: 2%;
        width: 100%;
    }
    h6 {
        font-size: 15px;
    }
    .agregar{
        width: 30%;
    }
</style>
