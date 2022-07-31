<script lang="ts">
    import DeviceGroup from "./../deviceGroup.svelte";
    import Store from './../store.svelte'
    import { onMount } from "svelte";

    let devicesJSON:any = {data: []}

    onMount(async () => {
        const res = await fetch('http://localhost:8080/device/groups/all')
        devicesJSON = await res.json()
    })
</script>

<div id="store"><Store /></div>
<div class="container">
    {#each devicesJSON.data as deviceGroup}
        <DeviceGroup
            id={deviceGroup.id}
            groupName={deviceGroup.name}
            isStored={deviceGroup.location.isStorage}
            location={deviceGroup.location.name}
            devices={deviceGroup.devices}
        />
    {/each}

</div>


<style>
    #store{
        width: 20%;
        position: fixed;
        top: 0;
        right: 0;
        margin: 0%
    }
</style>