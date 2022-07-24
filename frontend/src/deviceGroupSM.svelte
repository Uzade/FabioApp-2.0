<script lang="ts">
    export let groupName:String
    export let isStored:Boolean
    export let location:String
    export let devices:any
</script>

<div class="container">
    <h1>{groupName}</h1>
    {#if isStored}
        <h2>stored at "{location}"</h2>
    {:else}
        <h2>in use at "{location}"</h2>
    {/if}
    <h2>Contains:</h2>
    {#each devices as device}
        <h4>{device.name}</h4>
    {/each}
    
</div>

<style>
    .container{
        width: 60%;
        margin: 2% auto;
        padding: .5%;
        background-color: rgb(24, 27, 31);
    }
</style>