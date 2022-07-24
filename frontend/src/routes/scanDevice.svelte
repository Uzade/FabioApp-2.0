
<script lang="ts">
    import Scanner from './../scanner.svelte'

    let scanResult: String

    const findDevice = (id: number) => {
        fetch
    }

    $: console.log(scanResult)
</script>

<div class="container">
    <Scanner bind:result={scanResult} />

    {#if scanResult}
        <p>device with id {scanResult} detected</p>
    {/if}
    
</div>