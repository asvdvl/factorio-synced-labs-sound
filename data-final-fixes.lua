local fssm = require("__factorio-sync-sound-manager__/prototypes/api")


for _, lab in pairs(data.raw['lab']) do
    local sound = lab.working_sound and lab.working_sound.sound
    if sound then
        -- single sound, sound with variations, or an array of sounds
        sound = (sound.filename or sound.variations) and {sound} or sound

        for i, s in pairs(sound) do
            s.speaker_audible_distance_modifier = s.audible_distance_modifier
            s.audible_distance_modifier = 0
        end

        --[[
            The reason why I use `registerPrototype` and not` applyNewSound` in the fact that I do not want to damage sound settings,
            such as multiple variations.`applyNewSound` good where you need to prescribe 1 sound.
        ]]
        fssm.registerPrototype(lab)
    end
end
