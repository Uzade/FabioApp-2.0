<script lang="ts" >
    export let id:number
    export let name:String
    export let company:String
    export let cat:String
    export let subcat:String
    export let owner:String
    export let group:any
    export let setVisSelect:boolean
    export let selectedID:number

    import Group from "./group.svelte"
  </script>
  
  <div class="container">
    <h1>{name}</h1>
    <h4>{company}</h4>
    <h4 id="cats">{cat} | {subcat}</h4>  
    <h6>owned by {owner}</h6>
    {#if !group}
      <h4>Not contained in a group</h4>
      <button>put in new group</button>
      <button on:click={() => {setVisSelect = true; selectedID = id}}>put in existing group</button>
      {:else}
      <Group location={group.location} />
    {/if}
    
    
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