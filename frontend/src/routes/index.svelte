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

    :root {
        --white:rgba(255, 255, 255, 0.4);
        --green: rgba(0, 255, 220, 0.6);
        --light-green: rgba(0, 255, 220, 0.4);
        --pink: rgba(255, 0, 180, 0.8);
        --light-pink: rgba(255, 0, 180, 0.6);
    }

    h1{
        position: relative;
        font-size: 4.2em;
        margin-bottom: 2em;
        color: #fff;
        text-shadow:
            0 0 5px var(--white),
            0 0 8px var(--white),
            0 0 18px var(--white),
            0 0 42px var(--pink),
            0 0 82px var(--pink),
            0 0 92px var(--pink),
            0 0 102px var(--pink),
            0 0 151px var(--light-pink);

    }

    h1::after{
        content: " ";
        background-color: var(--pink);
        position: absolute;
        width: 80%;
        height: .8em;
        left: 10%;
        top: 150%;
        transform: perspective(1.2em) rotateX(20deg);
        filter: blur(.5em);
        opacity: 50%;
        
    }

    #content {
        margin: 3em;
        padding: 1em;
        background-color: rgb(27, 31, 37);
        display: inline-block;
        width: 30rem;
        box-shadow: 5px 5px 20px rgb(10, 10, 10);
    }

    .button {
        margin: 1em 2em;
        padding: 0.2em;
        font-size: 2em;
        border: .1em solid #fff;
        border-radius: .3em;
        box-shadow:
            inset 0px 0px 3px var(--white),
            0px 0px 3px var(--white),
            inset 0px 0px 7px var(--white),
            0px 0px 7px var(--white),
            inset 0px 0px 11px var(--green),
            0px 0px 11px var(--green),
            inset 0px 0px 25px var(--green),
            0px 0px 25px var(--green),
            inset 0px 0px 100px var(--light-green),
            0px 0px 100px var(--light-green);
        text-shadow:
            0 0 5px var(--white),
            0 0 8px var(--white),
            0 0 18px var(--white),
            0 0 42px var(--green),
            0 0 82px var(--green),
            0 0 92px var(--green),
            0 0 102px var(--green),
            0 0 151px var(--light-green);

    }

</style>
