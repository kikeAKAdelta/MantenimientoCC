<template>
  <div id="ordencompra" class="container">
      <div class="card mb-3">
          <div class="card-body">
              <span class="float-right" style="cursor:pointer"
              @click="limpiar()"><h6>LIMPIAR</h6>
              </span>
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="nombre" type="text" class="form-control mb-2" placeholder="MATERIAL">
                <textarea id="descripcion" class="form-control mb-2" cols="30" rows="10" placeholder="DESCRIPCIÓN"></textarea>
                <select class="form-control mb-2">
                    <option>PROVEEDOR 1</option>
                    <option>PROVEEDOR 2</option>
                </select>
                <input id="costo" type="text" class="form-control mb-2" placeholder="COSTO">
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
        document.getElementById("costo").value = "";
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
