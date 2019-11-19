<template>
  <div id="solicitud" class="container">
      <div class="card mb-3">
          <div class="card-body">
              <span class="float-right" style="cursor:pointer"
              @click="limpiar()"><h6>LIMPIAR</h6>
              </span>
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <br>
                <div class="form-row mb-2">
                    <div class="col">
                        <h5 style='text-align:left'>SOLICITANTE</h5>
                        <select id="solicitante" class="form-control mb-2">
                            <option v-for="item in lists" v-bind:key="item.idusuario">{{ item.idusuario +" - "+ item.nombres + " " + item.apellidos}}</option>
                        </select>
                    </div>
                    <div class="col">
                        <h5 style='text-align:left'>FECHA SOLICITUD</h5>
                        <input id="fechasolicitud" type="text" class="form-control mb-2" readonly>                    </div>
                </div>
                <br>
                <h5 style='text-align:left'>EQUIPO</h5>
                <select id="equipo" class="form-control mb-2">
                    <option v-for="item in lists2" v-bind:key="item.codinventario">{{ item.codinventario +" - "+ item.nombre }}</option>
                </select>
                <br>
                <h5 style='text-align:left'>TIPO DE MANTENIMIENTO</h5>
                <div class="form-row mb-2">
                    <div class="col">
                        <select id="tipo" class="form-control mb-2">
                            <option v-for="item in lists3" v-bind:key="item.idpromant">{{ item.idpromant +" - "+ item.descripcion }}</option>
                        </select>
                    </div>
                    <div class="col">
                        <input id="numero" type="text" class="form-control mb-2" placeholder="TIEMPO / CANTIDAD" v-model="Solicitud.numero">
                    </div>
                </div>
                <br>
                <input id="tipofalla" type="text" class="form-control mb-2" placeholder="TIPO DE FALLA" v-model="Solicitud.tipofalla">
                <textarea id="descripcion" class="form-control mb-2" cols="30" rows="10" placeholder="DESCRIPCIÓN DE LA FALLA" v-model="Solicitud.descripcion"></textarea>
            </div>
          </div>
          <div class = "botonera">
            <button type="button" class="btn btn-success" style='width:150px; height:50px' id="agregar"
            @click="realizarSolicitud">
                Agregar
            </button>
        </div>
      </div>
  </div>
</template>

<script>
import axios from "axios";

window.onload = function(){ 
    var f = new Date();
    document.getElementById("fechasolicitud").value = f.getFullYear()+ "-" + (f.getMonth() +1) + "-" + f.getDate();
}
export default {
      mounted() {
    this.getUsuarios();
    this.getEquipo();
    this.getTipoMant();
  },
    data() {
        return{
            lists:[],
            lists2:[],
            lists3:[],
            Solicitud:{idsolicitud:'', idusuario:'', codinventario:'', idpromant:''
            ,numero:'', fechasolicitud:'', tipofalla:'', descripcion:''}
        }
    },
  methods: {
    limpiar(){
        document.getElementById("tipofalla").value = "";
        document.getElementById("descripcion").value = "";
    },getUsuarios() {
      axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/usuarios")
        .then(res => {
          console.log(res);
          this.lists = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },getEquipo() {
      axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/inventario")
        .then(res => {
          console.log(res);
          this.lists2 = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },getTipoMant() {
      axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/procedimientosmantenimiento")
        .then(res => {
          console.log(res);
          this.lists3 = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    realizarSolicitud(){
        //OBTENER ID SOLICITUD
        axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/solicitudordentrabajo/count")
        .then(res => { 

 //OBTENER USUARIO
        var sel = document.getElementById("solicitante").value;
        let prov = parseInt(sel.charAt(0));
        axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/usuario/buscar/"+prov)
        .then(res2 => { 

//OBTENER INVENTARIO
        var sel2 = document.getElementById("equipo").value;
        let prov2 = sel2.charAt(0)+sel2.charAt(1)+sel2.charAt(2)+sel2.charAt(3)+sel2.charAt(4);
        axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/inventario/obtener/"+prov2)
        .then(res3 => { 

        var sel3 = document.getElementById("tipo").value;
        let prov3 = sel3.charAt(0)+sel3.charAt(1)+sel3.charAt(2)+sel3.charAt(3)+sel3.charAt(4);
        //OBTENER TIPO MANTENIMIENTO
        axios
        .get("http://localhost:8181/MantenimientoAcc-Back/webresources/procedimientosmantenimiento/obtener/"+prov3)
        .then(res4 => { 

                    let nuevoOrden = {
                        idsolicitud: res.data+1,
                        idusuario: res2.data,
                        codinventario: res3.data,
                        idpromant: res4.data,
                        numero: this.Solicitud.numero, 
                        fechasolicitud: new Date().toISOString(),
                        tipofalla: this.Solicitud.tipofalla, 
                        descripcion: this.Solicitud.descripcion

                      }
                    console.log(nuevoOrden);
                    axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/solicitudorden/', nuevoOrden
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

        })

        })



        })

        //TIPO MANTENIMIENTO
        .catch((error) => {
            console.log(error);
        })


        //INVENTARIO
        .catch((error) => {
            console.log(error);
        })

        //USUARIO
        .catch((error) => {
            console.log(error);
        })
        //ID SOLICITUD
        .catch((error) => {
            console.log(error);
        })
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
