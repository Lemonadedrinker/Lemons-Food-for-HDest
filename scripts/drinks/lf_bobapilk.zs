class LF_BobaPilk : UaS_Consumable
{
    default {
        UaS_Consumable.Calories 150;
        UaS_Consumable.Fluid 400;
        UaS_Consumable.Bulk 5;
        UaS_Consumable.SpoilRate 1.2;
        -UaS_Consumable.PACKAGED;
        +UaS_Consumable.RESEALABLE;
        Inventory.PickupMessage "$LF_BOBAPILK_PICKUP";
        UaS_Consumable.Description "$LF_BOBAPILK_DESCRIPTION";
        tag "$LF_BOBAPILK_TAG";
        Inventory.Icon "LFBPA0";
        Scale 0.5;
    }

    states (actor) {
        spawn:
            LFBP A -1;
            stop;
    }

    override void Messages()
    {
        AddConsumeText("$LF_BOBAPILK_CONSUME1");
        AddConsumeText("$LF_BOBAPILK_CONSUME2");
        AddConsumeText("$LF_BOBAPILK_CONSUME3");
    }
}