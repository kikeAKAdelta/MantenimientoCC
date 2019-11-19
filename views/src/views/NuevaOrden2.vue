<template>
  <div id="ordencompra" class="container">
      <div class="card mb-3">
          <div class="card-body">
              <span class="float-right" style="cursor:pointer"
              @click="limpiar()"><h6>LIMPIAR</h6>
              </span>
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="nombre" type="text" class="form-control mb-2" placeholder="MATERIAL" v-model="Material.nombre">
                <textarea id="descripcion" class="form-control mb-2" cols="30" rows="10" placeholder="DESCRIPCIÓN" v-model="Material.descripcion"></textarea>
                <select id="sel" class="form-control mb-2">
                    <option v-for="item in lists" v-bind:key="item.idproveedor">{{ item.idproveedor +" - "+ item.nombre}}</option>
                </select>
                <input id="costo" type="text" class="form-control mb-2" placeholder="COSTO" v-model="Material.costo">
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
  mounted() {
    this.getProveedores();
  },
  name: "Ordencompra",
  data() {
    return{
      lists: [],
      Material: {codmaterial:'', nombre:'', descripcion:'', proveedor:{
          idproveedor:'', nombre:'', telefono:''
      }, cantidad:'', costo:''},
      OrdenCompra:{
        idcompra: '', codmaterial:{codmaterial:'', nombre:'', descripcion:'', idproveedor:{
          idproveedor:'', nombre:'', telefono:''}, cantidad:'', costo:''}, 
          cantidad:'', 
        idstatus:{ 
            idstatus:'', estado:''
        }, fecha:''
      }
    };
  },
  methods: {
    limpiar(){
        document.getElementById("nombre").value = "";
        document.getElementById("descripcion").value = "";
        document.getElementById("costo").value = "";


    },
    getProveedores() {
      axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/proveedores")
        .then(res => {
          console.log(res);
          this.lists = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    pgFormatDate(date) {
  function zeroPad(d) {
    return ("0" + d).slice(-2)
  }

  var parsed = new Date(date)

  return [parsed.getUTCFullYear(), zeroPad(parsed.getMonth() + 1), zeroPad(parsed.getDate()), zeroPad(parsed.getHours()), zeroPad(parsed.getMinutes()), zeroPad(parsed.getSeconds())].join(" ");
},
    getPosts() {       
        axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/materiales/count")
        .then(res => {
           var sel = document.getElementById("sel").value;
           let prov = parseInt(sel.charAt(0));
           console.log(prov);
            axios
            .get("http://localhost:8181/MantenimientoAcc-Back/webresources/proveedores/obtener/"+prov)
            .then(res2 => {
            console.log(res2);

           let nuevoMaterial = {
            codmaterial: "MAT-0" +(res.data+1),
            nombre: this.Material.nombre,
            descripcion: this.Material.descripcion,
            idproveedor: res2.data,
            cantidad: 0,
            costo: parseFloat(this.Material.costo)
          }
          console.log(nuevoMaterial);
          axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/materiales/', nuevoMaterial
          ,{
            headers: {
              "Accept": "application/json",
             'Content-Type': 'application/json',
              },
              method:"POST"
          })
          .then((response) => {
            console.log(response);
             axios
             //LLENAR ORDEN COMPRA
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/ordencompra/count")
        .then(res => {
          console.log(nuevoMaterial.codmaterial);
                  axios
                    .get("http://localhost:8181/MantenimientoAcc-Back/webresources/status/buscar/1")
                    .then(res3 => {
                      axios
                    .get("http://localhost:8181/MantenimientoAcc-Back/webresources/materiales/obtener/"+nuevoMaterial.codmaterial)
                    .then(res4 => {
                                          console.log("HOLIS "+ res3);
                        let nuevoOrden = {
                        idcompra: res.data+1,
                        cantidad: 3,
                        codmaterial: res4.data,
                        idstatus: res3.data,
                        fecha: new Date().toISOString()

                      }
                    console.log(nuevoOrden);
                    axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/ordencompra/', nuevoOrden
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
                  })
                    })
                    .catch((error) => {
                    console.log(error);
                  })
                })
                .catch((error) => {
                  console.log(error);
                })
              })
            })
          })
          .catch((error) => {
            console.log(error);
          });
        })
        .catch(err => {
           console.log(err);
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
