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
    path: "/procedimiento",
    name: "procedimiento",
    component: () => import("../views/Procedimiento.vue")
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
    path: "/usuarios",
    name: "usuarios",
    component: () => import("../views/Usuarios.vue")
  },
  {
    path: "/procedimientos",
    name: "procedimientos",
    component: () => import("../views/ProcedimientoMantenimiento.vue")
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
