<script lang="ts">
    import { lableStore } from './../stores'
    import Lable from './../lable.svelte'

</script>

<div id='container'>
    <h1>Lables to print</h1>
    {#each $lableStore as lable}
        <Lable 
            name={lable.groupName}
            id={lable.id}
            devices={lable.devices}
        />
    {/each}
</div>