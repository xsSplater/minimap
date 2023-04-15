local UIHudSettings = require("scripts/settings/ui/ui_hud_settings")
local UISettings = require("scripts/settings/ui/ui_settings")
local UIWidget = require("scripts/managers/ui/ui_widget")

local template = {}

template.create_widget_definition = function(settings, scenegraph_id)
    return UIWidget.create_definition({
        {
            pass_type = "texture_uv",
            value = "content/ui/materials/hud/interactions/icons/location",
            style_id = "icon",
            style = {
                uvs = {
                    { 0.1, 0.1 },
                    { 0.9, 0.9 }
                },
                vertical_alignment = "center",
                horizontal_alignment = "center",
                offset = { 0, 0, 0 },
                size = settings.icon_size,
                color = Color.ui_hud_green_super_light(255, true),
                default_color = Color.black(255, true),
            }
        },
    }, scenegraph_id)
end

template.update_function = function(widget, marker, x, y)
    local icon = widget.style.icon
    icon.offset[1] = x
    icon.offset[2] = y

    local data = marker.data
    local player = data.player
    local tagger_player = data.tag_instance:tagger_player()
    local player_slot = (tagger_player or player):slot()
    icon.color = UISettings.player_slot_colors[player_slot] or icon.default_color
end

return template
