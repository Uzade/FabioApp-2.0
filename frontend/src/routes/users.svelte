
<script lang="ts">
    import User from './../user.svelte';
    import { onMount } from 'svelte'
    let users: any[] = []

    onMount(async () => {
        const res = await fetch('http://localhost:8080/users/all')
        const data = await res.json()
        users = data.data
        console.log(users)
    })
</script>

<div id="userContainer">
    {#each users as user}
        <User UID={user.UID} email={user.email}/>
    {/each}
</div>

<style>
    
</style>

