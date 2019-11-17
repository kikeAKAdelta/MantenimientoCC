<template>
  <div class="container">
    <h2>Procedimiento Estandar de Mantenimiento</h2>
    <br>
<div class="row">
    <div class="col-md-6" v-for="film in films" :key="film.episode_id" style="margin-bottom: 10px;">
        <div class="card">
                <div class="card-body">
                <h5 class="card-title">PEM# {{film.episode_id}}</h5>
                <div>
                    <p><strong>Procedimiento: </strong> {{film.producer}}</p>
                    <p><strong>Encargado: </strong> {{film.director}}</p>
                    <p><strong>Tareas: </strong></p>
                    <ul>
                    </ul>
                    <p><strong>Materiales: </strong></p>
                    <ul>
                    </ul>
                    <p><strong>Herramientas: </strong></p>
                    <ul>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
  </div>
</template>
<script>
    import axios from "axios";
    export default {
     name: "Peliculas",
    mounted() {
      this.getFilms();
    },
    data() {
      return {
      films: []
      };
    },
    methods: {
      getFilms() {
        axios
          .get("https://swapi.co/api/films/")
          .then(res => {
            //console.log(res);
            this.films = res.data.results;
          })
          .catch(err => {
            console.log(err);
          });
        }
      }
  };
</script>