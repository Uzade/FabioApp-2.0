<script lang="ts">
    import FullDevice from "./../fullDevice.svelte";
    import SelectLocation from "./../selectLocation.svelte";
    import { onMount } from "svelte"

    let devicesJSON:any = {data: []}
    let isModalVis = false
    let bindGroup:number = -1
    let selectedDevice:number = -1

    onMount(async () => {
        const res = await fetch('http://localhost:8080/device/all')
        devicesJSON = await res.json()
        console.log(devicesJSON)
    })

    $: addToGroup(bindGroup)

    const addToGroup = async (groupID:number) =>{
        if(groupID != -1){
            const data = {
                'groupID': groupID,
                'deviceID': selectedDevice
            }
            const res = await fetch('http://localhost:8080/device/groups/addDevice', {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
        }
    }
</script>

<div>
    {#if isModalVis}
        <SelectLocation
            bind:selected={bindGroup}
            bind:isVisible={isModalVis}
        />
    {/if}
    
    
    {#each devicesJSON.data as device}
         <FullDevice
            id={device.id}
            name={device.name}
            company={device.company}
            cat={device.category.name}
            subcat={device.subcategory.name}
            owner={device.Creator.UID}
            group={device.deviceGroup}
            bind:setVisSelect={isModalVis}
            bind:selectedID={selectedDevice}
         />
    {/each}
    
</div>