<div id="content">
    <h1>Fabio-App</h1>
    <a href="/users">
        <div class="button">
            <p>Users</p>
        </div>
    </a>

    <div class="button">
        <p>Events</p>
    </div>

    <div class="button">
        <p>Devices</p>
    </div>
</div>

<style>

    h1{
        font-size: 3em;
    }

    #content {
        margin: 3em;
        padding: 1em;
        background-color: rgb(27, 31, 37);
        display: inline-block;
        width: 30em;
        box-shadow: 5px 5px 20px rgb(10, 10, 10);
    }

    .button {
        background-color: rgb(235, 33, 144);
        margin: 1em 2em;
        padding: 0.2em;
        font-size: 2em;
        position: relative;
        box-shadow: 0px;
        text-shadow: 0px;
        top: 0;
        left: 0;
        transition: top ease 0.5s, left ease 0.5s, box-shadow ease 0.5s, text-shadow ease 0.5s;
    }

    .button:hover{
        box-shadow: 0px 0px 10px rgb(233, 65, 157);
        text-shadow: 0px 0px 3px;
        top: -3px;
        left: -3px;
    }
</style>
