<script lang="ts">
    import DeviceGroup from "./../deviceGroup.svelte";
    import Lable from "../devicelable.svelte";
    import { onMount } from "svelte";

    let devicesJSON:any = {data: []}

    onMount(async () => {
        const res = await fetch('http://localhost:8080/device/groups/all')
        devicesJSON = await res.json()
    })
</script>

<div class="container">
    {#each devicesJSON.data as deviceGroup}
        <DeviceGroup
            groupName={deviceGroup.name}
            isStored={deviceGroup.location.isStorage}
            location={deviceGroup.location.name}
            devices={deviceGroup.devices}
        />
    {/each}

    {`
    <Lable iid={5} name="Gerät" category="TestCategory" subcategory="TestSubCat"/>
    `}
</div>


<style>
    
</style>