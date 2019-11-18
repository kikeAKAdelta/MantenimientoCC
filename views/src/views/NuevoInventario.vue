<template>
  <div id="ordencompra" class="container">
      <div class="card mb-3">
          <div class="card-body">
              <span class="float-right" style="cursor:pointer"
              @click="limpiar()"><h6>LIMPIAR</h6>
              </span>
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="nombre" type="text" class="form-control mb-2" placeholder="EQUIPO" v-model="Inventario.nombre">
                <textarea id="descripcion" class="form-control mb-2" cols="30" rows="10" placeholder="DESCRIPCIÓN" v-model="Inventario.descripcion"></textarea>
                <input id="modelo" type="text" class="form-control mb-2" placeholder="MODELO" v-model="Inventario.modelo">
                <input id="numeroserie" type="text" class="form-control mb-2" placeholder="NÚMERO DE SERIE" v-model="Inventario.numeroserie">
                <input id="ano" type="text" class="form-control mb-2" placeholder="AÑO" v-model="Inventario.ano">
                <input id="condicion" type="text" class="form-control mb-2" placeholder="CONDICIÓN" v-model="Inventario.condicion">
                <input id="ubicacion" type="text" class="form-control mb-2" placeholder="UBICACIÓN" v-model="Inventario.ubicacion">
                <input id="vidautil" type="text" class="form-control mb-2" placeholder="VIDA UTIL" v-model="Inventario.vidautil">
                <input id="gar" type="checkbox" class="form-control mb-2" value="garantia" v-model="Inventario.garantia"/>¿POSEE GARANTÍA?
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
  name: "Inventario",
  data() {
    return{
      Inventario: {codinventario:'', nombre:'', descripcion:'',
      modelo:'', numeroserie:'', ano:'', condicion:'', ubicacion:'', vidautil:'', garantia:''},
    };
  },
  methods: {
    limpiar(){
        document.getElementById("nombre").value = "";
        document.getElementById("descripcion").value = "";
        document.getElementById("modelo").value = "";
        document.getElementById("numeroserie").value = "";
        document.getElementById("ano").value = "";
        document.getElementById("condicion").value = "";
        document.getElementById("ubicacion").value = "";
        document.getElementById("vidautil").value = "";
    },
    getPosts() {
        axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/inventario/count")
        .then(res => {
          var chk = document.getElementById("gar");
           if(chk.checked){
              this.Inventario.garantia = true;
           }else{
             this.Inventario.garantia = false;
           }
           let nuevoInventario = {
            codinventario: "EQ-0" +(res.data+1),
            nombre: this.Inventario.nombre,
            descripcion: this.Inventario.descripcion,
            modelo: this.Inventario.modelo,
            numeroserie: this.Inventario.numeroserie,
            ano: this.Inventario.ano,
            condicion: this.Inventario.condicion,
            ubicacion: this.Inventario.ubicacion,
            vidautil: this.Inventario.vidautil,
            garantia: this.Inventario.garantia
          }
          console.log(nuevoInventario);
          axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/inventario/', nuevoInventario
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
