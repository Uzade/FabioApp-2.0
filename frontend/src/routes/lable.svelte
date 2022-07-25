
<script lang="ts">
    import Barcode from './../barcode.svelte'

    export let name: String = 'Gerät'
    export let id: number = 3
    export let cat: String = 'Ton'
    export let subcat: String = 'mic'
    export let company: String = 'BigSound'
</script>

<div id='container'>
    <h1>{name}</h1>
    <h5>company: {company}</h5>
    <h3>categorie: {cat} | {subcat}</h3>
    <Barcode id={id} />
</div>

<style>
    #container{
        color: black;
        background-color: white;
        width: 350px;
        margin: auto;
    }
</style>