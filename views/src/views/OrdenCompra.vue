<template>
  <div id="ordencompra" class="container">
    <h2 class="container">Orden de Compra</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">N° Compra</th>
          <th scope="col">Código Material</th>
          <th scope="col">Material</th>
          <th scope="col">Cantidad a comprar</th>
          <th scope="col">Estado</th>
          <th scope="col">Fecha</th>
        </tr>
      </thead>
      <tbody> 
        <tr v-for="item in lists" v-bind:key="item">
          <th scope="row" v-text="item.id">{{ item.id }}</th>
          <td>{{ item.name }}</td>
          <td>{{ item.username }}</td>
          <td>{{ item.email }}</td>
          <td>{{ item.phone }}</td>
          <td>{{ item.website }}</td>
        </tr>
        <tr>
          <th scope="row">Destornillador 2</th>
          <td>30</td>
          <td>Proceso</td>
          <td>20/11/2019</td>
        </tr>
        <tr>
          <th scope="row">Destornillador 3</th>
          <td>30</td>
          <td>Completado</td>
          <td>20/11/2019</td>
        </tr>
        <tr>
          <th scope="row">Destornillador 4</th>
          <td>30</td>
          <td>Cancelado</td>
          <td>20/11/2019</td>
        </tr>
      </tbody>
    </table>
    <button type="button" class="btn btn-primary" id="nuevo">
      Nueva Orden de Compra
    </button>
  </div>
</template>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue-resource/1.5.1/vue-resource.min.js"></script>
<script type="text/javascript">
  var urlOrden= "https://jsonplaceholder.typicode.com/users";
  var vm = new Vue({
    el: "#ordencompra",
    data: {
      lists: []
    },

    mounted: function(){
      const axios = require('axios');
      axios.get(urlOrden)
        .then(response => {
          this.lists = response.data;
          console.log(response);
        })
        .catch(error => {
          console.log(error);
        });
      }
    })
</script>