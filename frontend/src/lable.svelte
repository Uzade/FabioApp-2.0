
<script lang="ts">
    import Barcode from './barcode.svelte'
    import type { Device } from './types'

    export let name: String
    export let id: number = 3
    export let devices: Device[]

</script>

<div id='container'>
    <h1>{name}</h1>
    <h3>Contains {devices.length} devices</h3>
    {#each devices as device}
        <div id="device">
            <h4>{device.name}</h4>
            <p>{device.company}</p>
        </div>
    {/each}
    <Barcode id={id} />
</div>

<style>
    #container{
        color: black;
        background-color: white;
        width: 550px;
        margin: auto;
    }

    #device{
        width: 40%;
        margin: 2% 8%;
        padding: 1px;
        outline: 1px;
        outline-style: solid;
    }
</style>