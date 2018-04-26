<template>
    <div class="configuration">
        <h1>Configuration</h1>
        <form class="form">
            <div class="form-group">
                <label for="exampleFormControlInput1">Mirror</label>
                <input type="url" class="form-control" id="exampleFormControlInput1" v-model="mirror">

            </div>

            <div class="form-group">
                <label for="exampleFormControlSelect1">Example select</label>
                <select class="form-control" id="exampleFormControlSelect1">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect2">Example multiple select</label>
                <select multiple class="form-control" id="exampleFormControlSelect2">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Example textarea</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <div class="row">
                <div class="col-sm-12 text-center">
                    <input type="submit" id="btnSave" class="btn btn-primary btn-md center-block" value="Guardar" @Click="save()" >
                    <input type="button" id="btnCancel" class="btn btn-danger btn-md center-block"  value="Cancelar" @click="navHome()" >
                </div>
            </div>
        </form>


    </div>
</template>

<script>
    export default {
      name: 'Configuration',
      data () {
        return {
          mirror: 'http://soflibre.unizar.es/debian/'
        }
      },
      methods: {
        navHome () {
          this.$router.push({name: 'home'})
        },
        save () {}
      }
    }
</script>

<style scoped>
    .btn {
        width: 100px
    }
    .configuration {
        margin: 25px auto auto;
        text-align: center;
        width: 70%
    }
    .form {
        width: 100%;
        display: inline-block;
        text-align: left;
    }
    label {
        color: white;
    }
</style>
