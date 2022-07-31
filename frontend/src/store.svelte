
<script lang="ts">
    import { lableStore } from "./stores";

    const removeLable = (lableId: number) =>{
        console.log("removed ", lableId)
        $lableStore = $lableStore.filter((lable) => {
            return lable.id != lableId
        })
        localStorage.setItem('lableStore', JSON.stringify($lableStore))
    }
</script>

{#if $lableStore.length > 0}
    <div id="container">
        <h3>LableStore</h3>
        {#each $lableStore as lableItem}
            <div id="item">
                <h5>{lableItem.groupName}</h5>
                <button on:click={() => {removeLable(lableItem.id)}}>remove</button>
            </div>
        {/each}

        <a href="/printLable"><h1>Go Print</h1></a>

    </div>
{/if}




<style>
    #container{
        background-color: rgb(23, 28, 31);
        width: 100%;
    }

    #item{
        background-color: rgb(35, 41, 44);
        width: 80%;
        margin: 3% auto;
        padding: 1%;
        border-radius: .4em;
    }
</style>
     