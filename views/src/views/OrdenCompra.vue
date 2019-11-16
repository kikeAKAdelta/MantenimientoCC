<template>
  <div class="container" id="tabla_datos">
    <h2 class="container">Orden de Compra</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Material</th>
          <th scope="col">Cantidad</th>
          <th scope="col">Estado</th>
          <th scope="col">Fecha</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">Destornillador</th>
          <td>30</td>
          <td>Completado</td>
          <td>20/11/2019</td>
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
