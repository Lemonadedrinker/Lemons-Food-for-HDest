class LF_InstantDeathium : UaS_Consumable
{
    default {
        UaS_Consumable.Calories 0;
        UaS_Consumable.Fluid 1000;
        UaS_Consumable.Bulk 10;
        UaS_Consumable.SpoilRate 0;
        -UaS_Consumable.PACKAGED;
        -UaS_Consumable.RESEALABLE;
        Inventory.PickupMessage "$LF_DEATHIUM_PICKUP";
        UaS_Consumable.Description "$LF_DEATHIUM_DESCRIPTION";
        tag "$LF_DEATHIUM_TAG";
        Inventory.Icon "LFIDA0";
    }

    states (actor) {
        spawn:
            LFID A -1;
            stop;
    }

    override void Messages()
    {
        AddConsumeText("$LF_DEATHIUM_CONSUME1");
    }

    // Kill the player
    override void OnConsume()
    {
        if (!owner) return;

        // Flags from https://zdoom.org/w/index.php?title=DamageMobj
        Actor gods = Spawn("NoitaGods");
        owner.DamageMobj(gods, null, 500, 'deathium', 2047);

        // Delete the potion, 
        //GoAwayAndDie();
    }
}

// Used to send the information to the Lemon's Custom Death Sounds mod
class NoitaGods : Actor
{
    // Used to instantly delete this actor in case it ever gets spawned in somehow
    override void Tick()
    {
        Destroy();
    }
}