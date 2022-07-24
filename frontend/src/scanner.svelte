<script lang="ts">
 import { Html5Qrcode } from 'html5-qrcode'
 import { onMount } from 'svelte'

 let scanning = false

 export let result: String

 let html5Qrcode: Html5Qrcode

 onMount(init)

 function init() {
     html5Qrcode = new Html5Qrcode('reader')
 }

 function start() {
     html5Qrcode.start(
         { facingMode: 'environment' },
         {
             fps: 10,
             qrbox: { width: 250, height: 250 },
         },
         onScanSuccess,
         onScanFailure
     )
     scanning = true
 }

 async function stop() {
     await html5Qrcode.stop()
     scanning = false
 }

 function onScanSuccess(decodedText: any, decodedResult: any) {
     result = decodedText
     //console.log(result)
 }

 function onScanFailure(error: any) {
     
 }
</script>

<style>
 main {
     display: flex;
     flex-direction: column;
     align-items: center;
     justify-content: center;
     gap: 20px;
 }
 reader {
     width: 100%;
     min-height: 500px;
     background-color: black;
 }
</style>

<main>
 <reader id="reader"/>
 {#if scanning}
     <button on:click={stop}>stop</button>
 {:else}
     <button on:click={start}>start</button>
 {/if}
</main>