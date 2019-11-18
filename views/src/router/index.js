import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: Home
  },
  {
    path: "/proveedor",
    name: "proveedor",
    component: () => import("../views/Proveedor.vue")
  },
  {
    path: "/nuevoproveedor",
    name: "nuevoproveedor",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/NuevoProveedor.vue")
  },
  {
    path: "/inventario",
    name: "inventario",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/Inventario.vue")
  },
  {
    path: "/nuevoinventario",
    name: "nuevoinventario",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/NuevoInventario.vue")
  },
  {
    path: "/materiales",
    name: "materiales",
    component: () => import("../views/Materiales.vue")
  },
  {
    path: "/herramientas",
    name: "herramientas",
    component: () => import("../views/Herramientas.vue")
  },
  {
    path: "/nuevaherramienta",
    name: "nuevaherramienta",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/NuevaHerramienta.vue")
  },
  {
    path: "/pasos",
    name: "pasos",
    component: () => import("../views/PasosProcedimiento.vue")
  },
  {
    path: "/orden",
    name: "orden",
    component: () => import("../views/OrdenCompra.vue")
  },
  {
    path: "/nuevaordencompra",
    name: "nuevaordencompra",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/NuevaOrdenCompra.vue")
  },
  {
    path: "/usuarios",
    name: "usuarios",
    component: () => import("../views/Usuarios.vue")
  },
  {
    path: "/nuevousuario",
    name: "nuevousuario",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/NuevoUsuario.vue")
  },
  {
    path: "/pems",
    name: "pems",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(
        /* webpackChunkName: "about" */ "../views/PEMS.vue"
      )
  },
  {
    path: "/nuevapem",
    name: "nuevapem",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(
        /* webpackChunkName: "about" */ "../views/NuevaPEM.vue"
      )
  },
  {
    path: "/realizarsolicitud",
    name: "realizarsolicitud",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(
        /* webpackChunkName: "about" */ "../views/NuevaSolicitud.vue"
      )
  },
  {
    path: "/solicitudes",
    name: "solicitudes",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(
        /* webpackChunkName: "about" */ "../views/SolicitudesOrdenTrabajo.vue"
      )
    },
    {
      path: "/ordentrabajo",
      name: "ordentrabajo",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(
          /* webpackChunkName: "about" */ "../views/OrdenesTrabajo.vue"
        )
    }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
