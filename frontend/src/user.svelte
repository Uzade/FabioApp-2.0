
<script lang="ts">
    export let UID:String;
    export let email:String;
</script>

<div id="wrapper">
    <h2>{UID}</h2>
    <p>email: {email}</p>
    <div id="buttonContainer">
        <button>bearbeiten</button>
        <button>löschen</button>
    </div>
    
</div>

<style>
    #wrapper{
        margin: .5em;
        padding: .5em;
        background-color: rgb(27, 31, 37);
        display: inline-block;
        width: 30em;
        box-shadow: 5px 5px 20px rgb(10, 10, 10);
    }
</style>