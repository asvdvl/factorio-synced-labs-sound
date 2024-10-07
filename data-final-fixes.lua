local fssm = require("__factorio-sync-sound-manager__/prototypes/api")


for _, lab in pairs(data.raw['lab']) do
    --[[
        The reason why I use `registerPrototype` and not` applyNewSound` in the fact that I do not want to damage sound settings,
        such as multiple variations.`applyNewSound` good where you need to prescribe 1 sound.
    ]]
    lab.working_sound.speacker_audible_distance_modifier = lab.working_sound.audible_distance_modifier
    lab.working_sound.audible_distance_modifier = 0
    fssm.registerPrototype(lab)
end
