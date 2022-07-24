<script lang="ts" >
  export let name:String
  export let company:String
  export let cat:String
  export let subcat:String
  export let owner:String
</script>

<div class="container">
  <h1>{name}</h1>
  <h4>{company}</h4>
  <h4 id="cats">{cat} | {subcat}</h4>  
  <h6>owned by {owner}</h6>
</div>

<style>
  .container{
    text-align: center;
    width: 40%;
    margin: 2% auto;
    padding: 1%;
    background-color: rgb(38, 43, 49);
    border-radius: 1rem;
  }

  #cats{
    color: rgb(160, 160, 160);
  }
</style>