const LF_GRABBAG_REFID = "lgr";

class LF_GrabbagPickup : HDPickup
{
    default {
        -hdpickup.fitsinbackpack
        hdpickup.refid LF_GRABBAG_REFID;
        tag "Lemon's Grabbag";
    }

    states{
        spawn:
            PINS A -1; stop;
        pickup:
            TNT1 A 0{
                A_GiveInventory("LF_Grabbag", invoker.amount);
            }fail;
	}
}

class LF_Grabbag : UaS_Consumable
{
    default {
        Inventory.PickupMessage "$LF_GRABBAG_PICKUP";
        UaS_Consumable.Description "$LF_GRABBAG_DESCRIPTION";
        tag "$LF_GRABBAG_TAG";
    }

    override void Contents()
    {
        // Food
        AddItem("LF_LemonCandy");
        AddItem("LF_CongratulationsSteak");

        // Liquid
        AddItem("LF_InstantDeathium");
        AddItem("LF_Teleportatium");
    }

    override void Messages()
    {
        AddOpenText("$LF_GRABBAG_OPEN");
    }
}