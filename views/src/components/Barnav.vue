<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">{{ brand }}</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/">Inicio</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Inventario
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/inventario">Listado</a>
            <a class="dropdown-item" href="/nuevoinventario">Agregar nuevo</a>
          </div>
        <li class="nav-item">
          <a class="nav-link" href="/materiales">Materiales</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/herramientas">Herramientas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/proveedor">Proveedores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/usuarios">Usuarios</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Orden de Compra
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/orden">Listado</a>
            <a class="dropdown-item" href="/nuevaordencompra">Agregar nuevo</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
    export default {
        data () {
            return {
                brand: 'MANTENIMIENTO'
            }
        }
    }
</script>