<script lang="ts">
    export let iid:number;
    export let name:String;
    export let category:String;
    export let subcategory:String;
    //const apiUrl = "https://api.qrserver.com/v1/create-qr-code/?size=100x100&data=\""
</script>

<div id="container">
    <div id="text">
        <h1 id="name">{name}</h1>
        <h3 id="cat">{category}</h3>
        <h3 id="subcat">{subcategory}</h3>
    </div>
    
</div>

<style>
    #container{
        display: flex;
        justify-content: space-around;
        background-color: white;
        width: 400px;
        height: 200px;
    }
    #name{
        color:aqua;
        background-color: blue;
    }
    #cat, #subcat{
        color: black !important;
    }
</style>