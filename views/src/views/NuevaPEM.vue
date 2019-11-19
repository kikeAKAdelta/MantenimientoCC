<template>
  <div id="pem" class="container">
      <div class="card mb-3">
          <div class="card-body">
            <h4 class="card-tittle">AGREGAR NUEVO</h4>
            <div class="employee-form">
                <input id="procedimiento" type="text" class="form-control mb-2" placeholder="NUEVO PROCEDIMIENTO" v-model="procedimientos.procedimiento">
                <br>
                <h5 style='text-align:left'>RESPONSABLE</h5>
                    <select id="responsable" class="form-control mb-2">
                        <option v-for="item in lists3" v-bind:key="item.idusuario">{{ item.idusuario +" - "+ item.nombres +" "+item.apellidos}}</option>
                     </select>  
                <br>
                <h5 style='text-align:left'>TAREAS</h5>
                <div id="pasos" class="container">
                    <div class="card mb-3" 
                    >
                        <div class="card-body">
                            <h6 class="card-tittle">TAREA</h6>
                            <div class="employee-form" >
                                <input id="tarea" type="text" class="form-control mb-2" placeholder="AGREGA UNA TAREA" v-model="pasos.paso">
                            </div>
                        </div>
                    </div>
                </div> 
                <h5 style='text-align:left'>MATERIALES</h5>
                <div id="materiales" class="container">
                    <div class="card mb-3" 
                    >
                        <div class="card-body">
                            <h6 class="card-tittle">MATERIAL</h6>
                            <div class="employee-form">
                                <select id="mat" class="form-control mb-2">
                                    <option v-for="item in lists2" v-bind:key="item.codmaterial">{{ item.codmaterial +" - "+ item.nombre +" - Cantidad: "+item.cantidad}}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div> 

                <h5 style='text-align:left'>HERRAMIENTAS</h5>
                <div id="herramientas" class="container">
                    <div class="card mb-3" 
                    >
                        <div class="card-body">
                            <h6 class="card-tittle">HERRAMIENTA</h6>
                            <div class="employee-form">
                                <select id="herramienta" class="form-control mb-2">
                                    <option v-for="item in lists" v-bind:key="item.idherramienta">{{ item.idherramienta +" - "+ item.nombre }}</option>
                                </select>                            </div>
                        </div>
                    </div>
                </div>                
            </div>
          </div>
          <div class = "botonera2">
            <button type="button" class="btn btn-success" style='width:150px; height:50px' id="agregar"
            @click="getPosts()">
                Agregar
            </button>
        </div>
      </div>
  </div>
</template>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>

<script>
import axios from "axios";
var num;
    export default{
        mounted() {
            this.getMaterial();
            this.getHerramientas();
            this.getResponsables();
        },
        name:'container',
        data(){
            return{
                lists: [],
                lists2: [],
                lists3: [],
                pasos:{
                    idpaso:'',
                    paso:''
                },
                materiales:{
                    codmaterial:'', nombre:'', descripcion:'', idproveedor:{
                        idproveedor:'', nombre:'', telefono:'' 
                    }, cantidad:'', costo:''
                },
                herramientas:{
                    idherramienta:'', nombre:'', cantidad:''
                },
                responsable: {
                    idusuario:'', username:'', nombres:'', apellidos:'', idrol:{
                        idrol:'', rol:''
                    }
                },
                procedimientos: {idprocedimiento:'', procedimiento:''},
                pem : {idpem:'', idprocedimiento: {
                    idprocedimiento:'', procedimiento:''
                    },idusuario: {idusuario:'', username:'', nombres:'', apellidos:'', idrol:{
                        idrol:'', rol:''
                    }}},
                pasosprocedimiento: {idprocedimiento: {
                    idprocedimiento:'', procedimiento:''
                    }, idpaso:{
                    idpaso:'',
                    paso:''
                }},
                materialesprocedimiento: {idprocedimiento: {
                    idprocedimiento:'', procedimiento:''
                    }, codmaterial:{codmaterial:'', nombre:'', descripcion:'', idproveedor:{
                        idproveedor:'', nombre:'', telefono:'' 
                    }, cantidad:'', costo:''
                },
                herramientasprocedimiento: {idprocedimiento:{
                    idprocedimiento:'', procedimiento:''
                }, idherramienta:{
                    idherramienta:'', nombre:'', cantidad:''
                }}
            }
          }
        }, 
        methods: {
            getHerramientas() {
                axios
                .get("http://localhost:8181/MantenimientoAcc-Back/webresources/herramientas")
                .then(res => {
                console.log(res);
                this.lists = res.data;
             })
            .catch(err => {
              console.log(err);
              });
            },
            getMaterial() {
                axios
                .get("http://localhost:8181/MantenimientoAcc-Back/webresources/materiales")
                .then(res => {
                console.log(res);
                this.lists2 = res.data;
             })
            .catch(err => {
              console.log(err);
              });
            },
            getResponsables() {
                axios
                .get("http://localhost:8181/MantenimientoAcc-Back/webresources/usuarios")
                .then(res => {
                console.log(res);
                this.lists3 = res.data;
             })
            .catch(err => {
              console.log(err);
              });
            },
            
            
            //ULTRAMETODO
            
            getPosts(){
                axios
                .get("http://localhost:8181/MantenimientoAcc-Back/webresources/procedimiento/count")
                .then(res => {


                axios
                .get("http://localhost:8181/MantenimientoAcc-Back/webresources/pasos/count")
                .then(res2 => {

                var sel3= document.getElementById("responsable").value;
                let prov3 = parseInt(sel3.charAt(0));
                axios
                .get("http://localhost:8181/MantenimientoAcc-Back/webresources/usuarios/buscar/"+prov3)
                .then(res5 => {

                var sel = document.getElementById("herramienta").value;
                let prov = parseInt(sel.charAt(0));
                axios
                .get("http://localhost:8181/MantenimientoAcc-Back/webresources/herramientas/buscar/"+prov)
                .then(res3 => {
                var sel2 = document.getElementById("mat").value;
                let prov2 = sel2.charAt(0)+""+sel2.charAt(1)+""+sel2.charAt(2)
                +""+sel2.charAt(3)
                +""+sel2.charAt(4)+""+sel2.charAt(5);
                console.log(prov2);
                console.log(document.getElementById("mat").value);

                axios
                .get("http://localhost:8181/MantenimientoAcc-Back/webresources/materiales/obtener/"+prov2)
                .then(res4 => {
                    console.log(res4);
                    let nuevoProcedimiento = {
                        idprocedimiento: res.data+1, 
                        procedimiento: this.procedimientos.procedimiento
                    }
                    axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/procedimiento/', nuevoProcedimiento
                    ,{
                        headers: {
                        "Accept": "application/json",
                        'Content-Type': 'application/json',
                        },
                            method:"POST"
                        })
                        .then((response) => {
                            console.log(response);
                            
                            let nuevoPaso = {
                                idpaso: res2.data+1, 
                                paso: this.pasos.paso
                            }
                            var num = parseInt(nuevoProcedimiento.idprocedimiento);
                            console.log(num);
                            axios
                            .get("http://localhost:8181/MantenimientoAcc-Back/webresources/procedimiento/buscar/"+num)
                            .then(res7 => {    
                            axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/pasos/', nuevoPaso
                            ,{
                                headers: {
                                "Accept": "application/json",
                                'Content-Type': 'application/json',
                            },
                                method:"POST"
                            })
                            .then((response2) => {
                                console.log(response2);
                                var num2 = parseInt(nuevoPaso.idpaso)

                            axios
                            .get("http://localhost:8181/MantenimientoAcc-Back/webresources/pasos/buscar/"+num2)
                            .then(res8 => {    
                                console.log(res8);

                            //tablas relaciones
                            //ID PEM
                             axios
                            .get("http://localhost:8181/MantenimientoAcc-Back/webresources/pem/count")
                            .then(res6 => {    
                                console.log("COUNT PEM ");
                                console.log(res6);

                            let AgregarPEM = {
                                idpem: res6.data+1,
                                idprocedimiento: res7.data,
                                idusuario: res5.data
                            }
                            axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/pem/', AgregarPEM
                            ,{
                                headers: {
                                "Accept": "application/json",
                                'Content-Type': 'application/json',
                            },
                                method:"POST"
                            })
                            .then((response3) => {
                                console.log(response3);


                            /*let AgregarPP = {
                                idprocedimiento: res7.data,
                                idpaso: res8.data
                            }
                            axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/pasosprocedimientos/', AgregarPP
                            ,{
                                headers: {
                                "Accept": "application/json",
                                'Content-Type': 'application/json',
                            },
                                method:"POST"
                            })
                            .then((response4) => {
                                console.log(response4);
                            

                                let AgregarHP = {
                                idprocedimiento: res7.data,
                                idherramienta: res3.data
                            }
                            axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/herramientasprocedimientos/', AgregarHP
                            ,{
                                headers: {
                                "Accept": "application/json",
                                'Content-Type': 'application/json',
                            },
                                method:"POST"
                            })
                            .then((response5) => {
                                console.log(response5);
                            

                            let AgregarMP = {
                                idprocedimiento: res7.data,
                                codmaterial: res4.data
                            }
                            axios.post('http://localhost:8181/MantenimientoAcc-Back/webresources/materialesprocedimientos/', AgregarMP
                            ,{
                                headers: {
                                "Accept": "application/json",
                                'Content-Type': 'application/json',
                            },
                                method:"POST"
                            })
                            .then((response6) => {
                                console.log(response6);
                            


                            })
                            .catch((error) => {
                                console.log(error);
                            });



                            })
                            .catch((error) => {
                                console.log(error);
                            });




                            })
                            .catch((error) => {
                                console.log(error);
                            });

*/
                            })
                            .catch((error) => {
                                console.log(error);
                            });

                            })
                            .catch((error) => {
                                console.log(error);
                            });


                            })
                            .catch((error) => {
                                console.log(error);
                            });

                            })
                            .catch((error) => {
                                console.log(error);
                            });

                            })
                            .catch((error) => {
                                console.log(error);
                            });


                        })
                        .catch((error) => {
                        console.log(error);
                    });


                }).catch((error) => {
                console.log(error);
                });


                }).catch((error) => {
                console.log(error);
                });

                }).catch((error) => {
                console.log(error);
                });

                }).catch((error) => {
                console.log(error);
                });


                }).catch((error) => {
                console.log(error);
                });
            }
        }
    };
</script>

<style type="text/css">
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
