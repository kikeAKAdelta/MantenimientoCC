<template>
  <div id="herramienta" class="container">
      <div class="card mb-3">
          <div class="card-body">
              <span class="float-right" style="cursor:pointer"
              @click="limpiar()"><h6>LIMPIAR</h6>
              </span>
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="username" type="text" class="form-control mb-2" placeholder="USERNAME" v-model="Usuario.username">
                <input id="nombres" type="text" class="form-control mb-2" placeholder="NOMBRES" v-model="Usuario.nombres">
                <input id="apellidos" type="text" class="form-control mb-2" placeholder="APELLIDOS" v-model="Usuario.apellidos">
                <select id="roles" class="form-control mb-2">
                    <option v-for="item in lists" v-bind:key="item.idrol">{{ item.idrol +" - "+ item.rol}}</option>
                </select>
            </div>
          </div>
          <div class = "botonera">
            <button type="button" class="btn btn-success" style='width:150px; height:50px' id="agregar"
            @click="getPosts">
                Agregar
            </button>
        </div>
      </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
mounted() {
    this.getRol();
  },
  name: "Usuarios",
  data() {
    return{
      lists:[],
      Usuario: {idusuario:'', username:'', nombres:'', apellidos:'', idrol:{
          idrol:'', rol:''
      }},
    };
  },
  methods: {
    limpiar(){
        document.getElementById("username").value = "";
        document.getElementById("nombres").value = "";
        document.getElementById("apellidos").value = "";
    },
    getRol() {
      axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/rol")
        .then(res => {
          console.log(res);
          this.lists = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getPosts() {
        axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/usuarios/count")
        .then(res => {
            var sel = document.getElementById("roles").value;
           let prov = parseInt(sel.charAt(0));
           console.log(prov);
            axios
            .get("http://localhost:8181/MantenimientoAcc-Back/webresources/rol/buscar/"+prov)
            .then(res2 => {
            console.log(res2);
                let nuevoUsuario = {
                idusuario: res.data+1,
                username: this.Usuario.username,
                nombres: this.Usuario.nombres,
                apellidos: this.Usuario.apellidos,
                idrol: res2.data
            }
          console.log(nuevoUsuario);
          axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/usuarios/', nuevoUsuario
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
        })
            .catch(err => {
            console.log(err);
            });
        });
      }, 
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
