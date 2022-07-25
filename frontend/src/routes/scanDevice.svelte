
<script lang="ts">
    import DeviceGroup from './../deviceGroup.svelte';

    import Scanner from './../scanner.svelte'

    let scanResult: String
    let group: any = {data: {}}

    const findDevice = async (id: number) => {
        const rawGroup = await fetch(`http://localhost:8080/device/groups/unique?groupID=${id}`)
        group = await rawGroup.json()
        group = group.data
    }

    $: if(scanResult){findDevice(parseInt("" + scanResult))}
    
</script>

<div class="container">
    <Scanner bind:result={scanResult} />

    {#if scanResult}
        <p>device with id {scanResult} detected</p>
    {/if}

    {#if group.id}
    <DeviceGroup
        groupName={group.name}
        isStored={group.location.isStorage}
        location={group.location.name}
        devices={group.devices}
    />
    {/if}
    
</div>

<style>

</style>