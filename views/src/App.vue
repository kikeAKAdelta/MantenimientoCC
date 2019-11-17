<!-- eslint-disable -->
<template>
  <div id="app">
    <nav class="navbar navbar-dark bg-dark padding">
      <a class="navbar-brand" href="#">Navbar</a>
      <button
        class="navbar-toggler toggler-example"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent1"
        aria-controls="navbarSupportedContent1"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="dark"><i class="fas fa-bars fa-1x"></i></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent1">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/" class="navbar-brand">Home</router-link>
          </li>
        </ul>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/proveedor" class="navbar-brand"
              >Proveedor</router-link
            >
          </li>
        </ul>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/procedimiento" class="navbar-brand"
              >Procedimiento</router-link
            >
          </li>
        </ul>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/materiales" class="navbar-brand"
              >Materiales</router-link
            >
          </li>
        </ul>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/herramientas" class="navbar-brand"
              >Herramientas</router-link
            >
          </li>
        </ul>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/pasos" class="navbar-brand">Pasos</router-link>
          </li>
        </ul>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/orden" class="navbar-brand"
              >Orden de compra</router-link
            >
          </li>
        </ul>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/materiales" class="navbar-brand"
              >Materiales</router-link
            >
          </li>
        </ul>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/procedimientos" class="navbar-brand"
              >Procedimientos</router-link
            >
          </li>
        </ul>
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link to="/usuarios" class="navbar-brand"
              >Usuarios</router-link
            >
          </li>
        </ul>
      </div>
    </nav>
    <router-view />
  </div>
</template>

<style lang="scss">
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
.padding {
  margin-bottom: 3em;
}
</style>
