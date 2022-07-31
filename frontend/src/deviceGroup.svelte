<script lang="ts">
    import Device from "./device.svelte";
    import { lableStore } from './stores'
    import type { Device as tDevice } from './types'
    import { browser } from '$app/env'

    export let id:number
    export let groupName:string
    export let isStored:boolean
    export let location:string
    export let devices:tDevice[]

    const addToStore = () => {
        //$lableStore = $lableStore.concat({id, groupName, devices})
        $lableStore = [...$lableStore, {id, groupName, devices}]
        console.log(($lableStore))
        localStorage.setItem('lableStore', JSON.stringify($lableStore))
        
    }

</script>


<div class="container">
    id: {id}
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
    <button on:click={addToStore}>add to lableStore</button>
    
</div>

<style>
    .container{
        width: 60%;
        margin: 2% auto;
        padding: .5%;
        background-color: rgb(24, 27, 31);
    }
</style>