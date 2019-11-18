<template>
  <div id="herramienta" class="container">
      <div class="card mb-3">
          <div class="card-body">
              <span class="float-right" style="cursor:pointer"
              @click="limpiar()"><h6>LIMPIAR</h6>
              </span>
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="username" type="text" class="form-control mb-2" placeholder="USERNAME">
                <input id="nombres" type="text" class="form-control mb-2" placeholder="NOMBRES">
                <input id="apellidos" type="text" class="form-control mb-2" placeholder="APELLIDOS">
                <select id="roles" class="form-control mb-2">
                    <option>ADMIN</option>
                    <option>GERENTE COMERCIAL</option>
                    <option>RESPONSABLE</option>
                    <option>USUARIO</option>
                </select>
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
        document.getElementById("username").value = "";
        document.getElementById("nombres").value = "";
        document.getElementById("apellidos").value = "";
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
