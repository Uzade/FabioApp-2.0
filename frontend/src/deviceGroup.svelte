<script lang="ts">
    import Device from "./device.svelte";

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
    {#each devices as device}
        <Device 
            name={device.name} 
            company={device.company} 
            cat={device.category.name}
            subcat={device.subcategory.name}
            owner={device.Creator.UID}
        />
    {/each}

    <button>add to event</button>
    <button>add device</button>
    <button>delete</button>
    
</div>

<style>
    .container{
        width: 60%;
        margin: 2% auto;
        padding: .5%;
        background-color: rgb(24, 27, 31);
    }
</style>