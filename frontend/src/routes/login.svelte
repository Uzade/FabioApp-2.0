
<script>
    const sendLogin = () =>{
        console.log("Moin")
    }
</script>

<div id="content">
    <h1>Login</h1>
    <p>Username</p>
    <input type="text" name="UID" id="UID">
    <p>Password</p>
    <input type="password" name="password" id="password">

    <div id="buttonContainer">
        <button on:click={sendLogin}>submit</button>
    </div>
    
</div>

<style>
    #content {
        margin: 3em;
        padding: 1em;
        background-color: rgb(27, 31, 37);
        display: inline-block;
        width: 30em;
        box-shadow: 5px 5px 20px rgb(10, 10, 10);
    }

    #buttonContainer{
        margin: 1em;
    }
</style>