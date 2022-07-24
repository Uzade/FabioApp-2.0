
<script>
    import { goto } from '$app/navigation'
    const back = () => {
        goto('/', {replaceState: true})
    }
</script>

<button on:click={back}>
    <div>
        <h1>&lt; back</h1>
    </div>
</button>
<slot>
    <h1>Error</h1>
    <p>This page could not be renderd</p>
    <p>Try to reload the page or go home and do something usefull</p>
</slot>

<style>
    :global(body) {
        font-family: Arial;
        margin: 0;
        padding: 0;
        text-align: center;
        background-color: rgb(14, 19, 22);
        color: aliceblue;
    }

    :global(a){
        text-decoration: none;
        color: inherit;
    }
</style>
