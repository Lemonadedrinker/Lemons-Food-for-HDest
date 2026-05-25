class LF_BFGCake : UaS_Consumable
{
    default {
        UaS_Consumable.Calories 9000;
        UaS_Consumable.Fluid 0;
        UaS_Consumable.Bulk 90;
        UaS_Consumable.SpoilRate 0.2;
        +UaS_Consumable.RESEALABLE;
        Inventory.PickupMessage "$LF_BFGCAKE_PICKUP";
        UaS_Consumable.Description "$LF_BFGCAKE_DESCRIPTION";
        tag "$LF_BFGCAKE_TAG";
        Inventory.Icon "LFBFA0";
        Scale 0.75;
    }

    states (actor) {
        spawn:
            LFBF A -1;
            stop;
    }

    override void Messages()
    {
        AddOpenText("$LF_BFGCAKE_OPEN1");
        AddOpenText("$LF_BFGCAKE_OPEN2");
        AddOpenText("$LF_BFGCAKE_OPEN3");

        AddConsumeText("$LF_BFGCAKE_CONSUME1");
        AddConsumeText("$LF_BFGCAKE_CONSUME2");
        AddConsumeText("$LF_BFGCAKE_CONSUME3");
    }
}