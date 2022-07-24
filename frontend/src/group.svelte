
<script lang="ts">
    export let location:any
</script>

<div class="container">
    {#if location.isEvent}
        <h4>currently in use at Event:</h4>
        <h6>{location.name}</h6>
    {:else}
         <h4>currently in Storage:</h4>
         <h6>{location.name}</h6>
    {/if}
</div>

<style>
    .container{
        background-color: rgb(50, 57, 65);
        width: 80%;
        margin: auto;
        padding: 1px;
        border-radius: .5em;
    }
</style>