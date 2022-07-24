
<script lang="ts">
    import { onMount } from "svelte"
    import DeviceGroupSm from './deviceGroupSM.svelte'

    let groupsJSON:any = {data: []}
    let modal:any
    export let selected:number
    export let isVisible = true

    onMount( async () => {
        const res = await fetch('http://localhost:8080/device/groups/all')
        groupsJSON = await res.json()
        console.log(groupsJSON)
        modal = document.getElementById("modal")
        modal!.showModal()
    })

    const close = () => {
        isVisible = false
    }

    
</script>

<dialog id="modal">
    <h1>all groups</h1>
    {#each groupsJSON.data as group}
        <button on:click={() => {selected = group.id; close()}}>
            <DeviceGroupSm
                groupName={group.name}
                isStored={group.location.isStored}
                location={group.location.name}
                devices={group.devices}
            />
        </button>
        <br>
    {/each}
    <button on:click={close}>close</button>
</dialog>

<style>
    button{
        all: unset;
        width: 100%;
    }
    dialog{
        color: white;
        width: 60%;
        background-color: rgb(18, 23, 26);
        border: 0;
    }

    dialog::backdrop{
        background: linear-gradient(55deg, rgb(255, 0, 106), rgb(0, 217, 255));
        opacity: 0.25;
    }
</style>