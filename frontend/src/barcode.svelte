
<script lang="ts">
    import bwipjs from 'bwip-js' 
    import { onMount } from 'svelte'

    export let id: number

    onMount(() => {
    try {
        let canvas = bwipjs.toCanvas(`canvas${id}`, {
            bcid:        'pdf417',        // Barcode type
            text:        '' + id,             // Text to encode
            scale:       2,               // 3x scaling factor
            height:      8,               // Bar height, in millimeters
        })
    } catch (e) {
        // `e` may be a string or Error object
    }
    })
    
</script>

<div>
    <canvas id='canvas{id}'></canvas>
</div>

<style>
    canvas{
        background-color: white;
        padding: 2%;
    }
</style>