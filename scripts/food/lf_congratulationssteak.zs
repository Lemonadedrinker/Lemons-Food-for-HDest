class LF_CongratulationsSteak : UaS_Consumable
{
    default {
        UaS_Consumable.Calories 1250;
        UaS_Consumable.Fluid 200;
        UaS_Consumable.Bulk 8;
        UaS_Consumable.SpoilRate 1;
        +UaS_Consumable.RESEALABLE;
        Inventory.PickupMessage "$LF_CONGRATULATIONSSTEAK_PICKUP";
        UaS_Consumable.Description "$LF_CONGRATULATIONSSTEAK_DESCRIPTION";
        tag "$LF_CONGRATULATIONSSTEAK_TAG";
        Inventory.Icon "HSCVA0";
    }

    states (actor) {
        spawn:
            HSCV A -1;
            stop;
    }

    override void Messages()
    {
        AddOpenText("$LF_CONGRATULATIONSSTEAK_OPEN1");
        AddOpenText("$LF_CONGRATULATIONSSTEAK_OPEN2");
        AddOpenText("$LF_CONGRATULATIONSSTEAK_OPEN3");
        AddConsumeText("$LF_CONGRATULATIONSSTEAK_CONSUME1");
        AddConsumeText("$LF_CONGRATULATIONSSTEAK_CONSUME2");
        AddConsumeText("$LF_CONGRATULATIONSSTEAK_CONSUME3");
    }
}