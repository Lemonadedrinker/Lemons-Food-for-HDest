class LF_Teleportatium : UaS_Consumable
{
    const MAX_TELEPORT = 2048.0;

    default {
        UaS_Consumable.Calories 200;
        UaS_Consumable.Fluid 1000;
        UaS_Consumable.Bulk 10;
        UaS_Consumable.SpoilRate 0;
        -UaS_Consumable.PACKAGED;
        -UaS_Consumable.RESEALABLE;
        Inventory.PickupMessage "$LF_TELEPORTATIUM_PICKUP";
        UaS_Consumable.Description "$LF_TELEPORTATIUM_DESCRIPTION";
        tag "$LF_TELEPORTATIUM_TAG";
        Inventory.Icon "LFTPA0";
    }

    states (actor) {
        spawn:
            LFTP A -1;
            stop;
    }

    override void Messages()
    {
        AddConsumeText("$LF_TELEPORTATIUM_CONSUME1");
    }

    // Teleport the player
    override void OnConsume()
    {
        if (!owner) return;

        FLineTraceData traceData;
        FCheckPosition checkPosition;
        vector2 destination2;
        bool isValidMove = false;

        double playerHeight = owner.player.mo.height * 0.5 - owner.player.mo.floorclip + owner.player.mo.AttackZOffset * owner.player.crouchFactor;

        // First, check if it hits a telefraggable actor
        // If so, we're done already
        owner.LineTrace(owner.angle, MAX_TELEPORT, owner.pitch, TRF_SOLIDACTORS == 1, playerHeight, 0, 0, data: traceData);

        // Check if an actor was hit and there is enough space to make the teleport
        if (traceData.HitActor != null)
        {
            //Console.printf("Actor hit!");
            // Flags from https://zdoom.org/w/index.php?title=Teleport_(ZScript)
            owner.Teleport((traceData.HitActor.pos.X, traceData.HitActor.pos.Y, traceData.HitActor.pos.Z), owner.angle, TF_TELEFRAG == 1);
            return;
        }


        // Loops repeatedly, checking teleports along the raycast
        // Each loop the raycast gets slightly shorter
        for (int i = 0; i < 256; i++) {
            owner.LineTrace(owner.angle, MAX_TELEPORT - 32.0 * i, owner.pitch, 0, playerHeight, 0, 0, data: traceData);
            //Console.printf("Hit location: %d, %d, %d", traceData.HitLocation.X, traceData.HitLocation.Y, traceData.HitLocation.Z);

            destination2 = (traceData.HitLocation.X, traceData.HitLocation.Y);

            // Check if valid
            isValidMove = owner.CheckMove(destination2, PCM_NOACTORS == 1 | PCM_NOLINES == 1, tm: checkPosition);

            if (isValidMove) break;
        }

        // Actually teleport the player now
        // Flags from https://zdoom.org/w/index.php?title=Teleport_(ZScript)
        owner.Teleport(checkPosition.pos, owner.angle, TF_TELEFRAG == 1);
    }
}