class LF_LemonCandy : UaS_Consumable
{
    default {
        UaS_Consumable.Calories 300;
        UaS_Consumable.Fluid -50;
        UaS_Consumable.Bulk 3;
        UaS_Consumable.SpoilRate 0.01;
        +UaS_Consumable.PACKAGED;
        +UaS_Consumable.RESEALABLE;
        Inventory.PickupMessage "$LF_LEMONCANDY_PICKUP";
        UaS_Consumable.Description "$LF_LEMONCANDY_DESCRIPTION";
        tag "$LF_LEMONCANDY_TAG";
        Inventory.Icon "LFLEMONCANDY";
    }

    states (actor) {
        spawn:
            HSCV A -1;
            stop;
    }

    override void Messages()
    {
        AddOpenText("$LF_LEMONCANDY_OPEN1");
        AddOpenText("$LF_LEMONCANDY_OPEN2");
        AddOpenText("$LF_LEMONCANDY_OPEN3");
        AddOpenText("$LF_LEMONCANDY_OPEN4");
        AddConsumeText("$LF_LEMONCANDY_CONSUME1");
        AddConsumeText("$LF_LEMONCANDY_CONSUME2");
        AddConsumeText("$LF_LEMONCANDY_CONSUME3");
    }
}