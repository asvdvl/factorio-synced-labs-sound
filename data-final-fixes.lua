local fssm = require("__factorio-sync-sound-manager__/prototypes/api")

local SILENCE = "__base__/sound/silence-1sec.ogg"

for _, lab in pairs(data.raw['lab']) do
    local working_sound = lab.working_sound
    local sound = working_sound and working_sound.sound
    if sound then
        -- pass the original audible distance to the emitter copy.
        -- SoundDefinition (array elements) has no audible_distance_modifier field, so arrays are skipped.
        if sound.filename or sound.variations then
            sound.speaker_audible_distance_modifier = sound.audible_distance_modifier or 1
        end

        fssm.registerPrototype(lab)

        -- silence the lab itself. audible_distance_modifier is not a SoundDefinition property,
        -- so replacing the whole sound is the only reliable way (works for arrays too).
        working_sound.sound = {
            filename = SILENCE,
            volume = 1,
            audible_distance_modifier = 0
        }
    end
end
