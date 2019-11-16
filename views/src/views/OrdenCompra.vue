<template>
  <div class="container" id="ordencompra">
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
          <th scope="row" v-text="item.id"></th>
          <td v-text="item.name">30</td>
          <td v-text="item.username">30</td>
          <td v-text="item.email">30</td>
          <td v-text="item.phone">30</td>
          <td v-text="item.website">30</td>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue-resource/1.5.1/vue-resource.min.js"></script>
<script type="text/javascript">
    var urlOrden= 'https://jsonplaceholder.typicode.com/todos/1';
    new Vue({
    el: '#ordencompra',
    data: {
      lists: []
    },
    methods: {
      getOrden: function() {
        this.$http.get(urlOrden).then(function(response){
          this.lists = response;
        });
      }
    }
});

</script>