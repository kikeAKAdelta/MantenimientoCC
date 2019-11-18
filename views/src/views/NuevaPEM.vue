<template>
  <div id="pem" class="container">
      <div class="card mb-3">
          <div class="card-body">
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="procedimiento" type="text" class="form-control mb-2" placeholder="NUEVO PROCEDIMIENTO">
                <br>
                <h5 style='text-align:left'>RESPONSABLE</h5>
                <select id="responsable" class="form-control mb-2">
                    <option></option>
                </select>     
                <br>
                <h5 style='text-align:left'>TAREAS</h5>
                <div id="pasos" class="container">
                    <div class="card mb-3" 
                    v-for="(tarea,index) in pasos" :key="tarea.id">
                        <div class="card-body">
                            <span class="float-right" style="cursor:pointer"
                            @click="limpiar(index)"><h6>x</h6>
                            </span>
                            <h6 class="card-tittle">TAREA {{ index +1}}</h6>
                            <div class="employee-form">
                                <input id="tarea" type="text" class="form-control mb-2" placeholder="AGREGA UNA TAREA" v-model="tarea.paso">
                            </div>
                        </div>
                    </div>
                </div> 
                <div class = "botonera">
                    <button type="button" class="btn btn-info" style='width:40px; height:40px text-align:center'
                    @click="otropaso()">
                        +
                    </button>
                </div>
                <h5 style='text-align:left'>MATERIALES</h5>
                <div id="materiales" class="container">
                    <div class="card mb-3" 
                    v-for="(mat,index) in materiales" :key="mat.id">
                        <div class="card-body">
                            <span class="float-right" style="cursor:pointer"
                            @click="limpiar2(index)"><h6>x</h6>
                            </span>
                            <h6 class="card-tittle">MATERIAL {{ index +1}}</h6>
                            <div class="employee-form">
                                <input id="material" type="text" class="form-control mb-2" placeholder="AGREGA UN MATERIAL" v-model="mat.material">
                            </div>
                        </div>
                    </div>
                </div> 
                <div class = "botonera">
                    <button type="button" class="btn btn-info" style='width:40px; height:40px text-align:center'
                    @click="otromaterial()">
                        +
                    </button>
                </div>

                <h5 style='text-align:left'>HERRAMIENTAS</h5>
                <div id="herramientas" class="container">
                    <div class="card mb-3" 
                    v-for="(her,index) in herramientas" :key="her.id">
                        <div class="card-body">
                            <span class="float-right" style="cursor:pointer"
                            @click="limpiar3(index)"><h6>x</h6>
                            </span>
                            <h6 class="card-tittle">HERRAMIENTA {{ index +1}}</h6>
                            <div class="employee-form">
                                <input id="herramienta" type="text" class="form-control mb-2" placeholder="AGREGA UNA HERRAMIENTA" v-model="her.herramienta">
                            </div>
                        </div>
                    </div>
                </div> 
                <div class = "botonera">
                    <button type="button" class="btn btn-info" style='width:40px; height:40px text-align:center'
                    @click="otraherramienta()">
                        +
                    </button>
                </div>                
            </div>
          </div>
          <div class = "botonera2">
            <button type="button" class="btn btn-success" style='width:150px; height:50px' id="agregar">
                Agregar
            </button>
        </div>
      </div>
  </div>
</template>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>
<script>
    export default{
        name:'container',
        data(){
            return{
                pasos:[{
                    paso:''
                }],
                materiales:[{
                    material:''
                }],
                herramientas:[{
                    herramienta:''
                }]
            }
        }, 
        methods: {
            otropaso(){
                this.pasos.push({
                    paso: ''
                })
            },
            limpiar(index){
                this.pasos.splice(index, 1);
            },
            otromaterial(){
                this.materiales.push({
                    material: ''
                })
            },
            limpiar2(index){
                this.materiales.splice(index, 1);
            },
            otraherramienta(){
                this.herramientas.push({
                    herramienta: ''
                })
            },
            limpiar3(index){
                this.herramientas.splice(index, 1);
            }
        }
    };
</script>

<style type="text/css">
    .botonera {
        display: flex;
        justify-content: center;
        padding-bottom: 2%;
        width: 100%;
    }
    .botonera2 {
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
