
<script lang="ts">
    import { onMount } from 'svelte'
    let users: any[] = []

    onMount(async () => {
        const res = await fetch('http://localhost:8080/users/all')
        const data = await res.json()
        users = data.data
        console.log(users)
    })
</script>

{#each users as user}
     <h2>Name: {user.UID}</h2>
     <p>email: {user.email}</p>
{/each}
