<template>
  <div class="container" id="tabla_datos">
    <h2 class="container">Usuarios</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Rol</th>
          <th scope="col">Nombre de Usuario</th>
          <th scope="col">Nombre</th>
          <th scope="col">Apellidos</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">Administrador</th>
          <td>Mark</td>
          <td>Otto</td>
          <td>Slow</td>
        </tr>
        <tr>
          <th scope="row">Gerente Comercial</th>
          <td>Jacob</td>
          <td>Thornton</td>
          <td>Haisenberg</td>
        </tr>
        <tr>
          <th scope="row">Reposnsable</th>
          <td>Larry</td>
          <td>the Bird</td>
          <td>Heisel</td>
        </tr>
      </tbody>
    </table>
    <button type="button" class="btn btn-primary" id="nuevo">
      Nuevo Usuario
    </button>
  </div>
</template>
