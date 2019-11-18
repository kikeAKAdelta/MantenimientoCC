<template>
  <div id="herramienta" class="container">
      <div class="card mb-3">
          <div class="card-body">
              <span class="float-right" style="cursor:pointer"
              @click="limpiar()"><h6>LIMPIAR</h6>
              </span>
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="nombre" type="text" class="form-control mb-2" placeholder="NOMBRE DEL PROVEEDOR" v-model="Proveedor.nombre">
                <input id="telefono" type="text" class="form-control mb-2" placeholder="TELEFONO" v-model="Proveedor.telefono">
            </div>
          </div>
          <div class = "botonera">
            <button type="button" class="btn btn-success" style='width:150px; height:50px' id="agregar"
            @click="getPosts()">
                Agregar
            </button>
        </div>
      </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Proveedores",
  data() {
    return{
      Proveedor: {idproveedor:'', nombre:'', telefono:''},
    };
  },
  methods: {
    limpiar(){
        document.getElementById("nombre").value = "";
        document.getElementById("telefono").value = "";
    },
    getPosts() {
        axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/proveedores/count")
        .then(res => {
           let nuevoProveedor = {
            idproveedor: res.data+1,
            nombre: this.Proveedor.nombre,
            telefono: this.Proveedor.telefono
          }
          console.log(nuevoProveedor);
          axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/proveedores/', nuevoProveedor
          ,{
            headers: {
              "Accept": "application/json",
             'Content-Type': 'application/json',
              },
              method:"POST"
          })
          .then((response) => {
            console.log(response);
          })
          .catch((error) => {
            console.log(error);
          });
        });
      }
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
