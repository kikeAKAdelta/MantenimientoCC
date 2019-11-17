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
                        <select class="form-control mb-2">
                            <option>USUARIO 1</option>
                            <option>USUARIO 2</option>
                        </select>
                    </div>
                    <div class="col">
                        <h5 style='text-align:left'>FECHA SOLICITUD</h5>
                        <input id="fechasolicitud" type="text" class="form-control mb-2" readonly>                    </div>
                </div>
                <br>
                <h5 style='text-align:left'>EQUIPO</h5>
                <select class="form-control mb-2">
                    <option>EQUIPO 1</option>
                    <option>EQUIPO 2</option>
                </select>
                <br>
                <h5 style='text-align:left'>TIPO DE MANTENIMIENTO</h5>
                <div class="form-row mb-2">
                    <div class="col">
                        <select class="form-control mb-2">
                            <option>MANTENIMIENTO 1</option>
                            <option>MANTENIMIENTO 2</option>
                        </select>
                    </div>
                    <div class="col">
                        <input id="numero" type="text" class="form-control mb-2" placeholder="TIEMPO / CANTIDAD">
                    </div>
                </div>
                <br>
                <input id="tipofalla" type="text" class="form-control mb-2" placeholder="TIPO DE FALLA">
                <textarea id="descripcion" class="form-control mb-2" cols="30" rows="10" placeholder="DESCRIPCIÓN DE LA FALLA"></textarea>
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
window.onload = function(){ 
    var f = new Date();
    document.getElementById("fechasolicitud").value = f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear();
}
export default {
  methods: {
    limpiar(){
        document.getElementById("tipofalla").value = "";
        document.getElementById("descripcion").value = "";
    }
  }
};
</script>


<style type="text/css">
    .botonera {
        display: flex;
        justify-content: end;
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
