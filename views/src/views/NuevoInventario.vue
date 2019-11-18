<template>
  <div id="ordencompra" class="container">
      <div class="card mb-3">
          <div class="card-body">
              <span class="float-right" style="cursor:pointer"
              @click="limpiar()"><h6>LIMPIAR</h6>
              </span>
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="nombre" type="text" class="form-control mb-2" placeholder="EQUIPO">
                <textarea id="descripcion" class="form-control mb-2" cols="30" rows="10" placeholder="DESCRIPCIÓN"></textarea>
                <input id="modelo" type="text" class="form-control mb-2" placeholder="MODELO">
                <input id="numeroserie" type="text" class="form-control mb-2" placeholder="NÚMERO DE SERIE">
                <input id="ano" type="text" class="form-control mb-2" placeholder="AÑO">
                <input id="condicion" type="text" class="form-control mb-2" placeholder="CONDICIÓN">
                <input id="ubicacion" type="text" class="form-control mb-2" placeholder="UBICACIÓN">
                <input id="vidautil" type="text" class="form-control mb-2" placeholder="VIDA UTIL">
                <input id="gar" type="checkbox" class="form-control mb-2" value="garantia"/>¿POSEE GARANTÍA?
            </div>
          </div>
          <div class = "botonera">
            <button type="button" class="btn btn-success" style='width:150px; height:50px' id="agregar">
                Agregar
            </button>
            </div>
      </div>
  </div>
</template>

<script>
export default {
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
