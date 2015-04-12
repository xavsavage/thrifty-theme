
--[[
                                                  
     Licensed under GNU General Public License v2 
      * (c) 2015,      xavsavage                 
      * (c) 2014,      projektile                 
      * (c) 2013,      Luke Bonham                
      * (c) 2010-2012, Peter Hofmann              
                                                  
     This is a modified version of centerwork from the Lain module.
--]]

local awful     = require("awful")
local beautiful = require("beautiful")
local tonumber  = tonumber
local math      = { floor = math.floor }

local bottomrightwork =
{
    name         = "bottomrightwork",
    top_left     = 2,
    top_right    = 3,
    bottom_left  = 1,
    bottom_right = 0
}

function bottomrightwork.arrange(p)
    -- A useless gap (like the dwm patch) can be defined with
    -- beautiful.useless_gap_width .
    local useless_gap = tonumber(beautiful.useless_gap_width) or 0

    -- A global border can be defined with
    -- beautiful.global_border_width
    local global_border = tonumber(beautiful.global_border_width) or 0
    if global_border < 0 then global_border = 0 end

    -- Themes border width requires an offset
    local bw = tonumber(beautiful.border_width) or 0

    -- Screen.
    local wa = p.workarea
    local cls = p.clients

    -- Borders are factored in.
    wa.height = wa.height - ((global_border * 2) + (bw * 2))
    wa.width = wa.width - ((global_border * 2) + (bw * 2))

    -- Width of main column?
    local t = awful.tag.selected(p.screen)
    local mwfact = awful.tag.getmwfact(t)

    if #cls > 0
    then
        -- Main column, fixed width and height.
        local c = cls[#cls]
        local g = {}
        local lowerheight = math.floor(0.8 * wa.height)
        local upperheight = wa.height - lowerheight
        local rightwidth = math.floor(0.75 * wa.width)
        local leftwidth = wa.width - rightwidth

        local at = 0
        for i = #cls,1,-1
        do
            -- It's all fixed. If there are more than 4 clients,
            -- those additional clients will float. This is
            -- intentional.
            if at == 4
            then
                break
            end

            c = cls[i]
            g = {}

            if at == bottomrightwork.top_left
            then
                -- top left
                g.x = wa.x + (useless_gap / 2) + global_border
                g.y = wa.y + (useless_gap / 2) + global_border
                g.width = leftwidth - useless_gap
                g.height = upperheight - useless_gap
            elseif at == bottomrightwork.top_right
            then
                -- top right
                g.x = wa.x + leftwidth + (useless_gap / 2) + global_border
                g.y = wa.y + (useless_gap / 2) + global_border
                g.width = rightwidth - useless_gap
                g.height = upperheight - useless_gap
            elseif at == bottomrightwork.bottom_left
            then
                -- bottom left
                if #cls < 3
                then
                    g.height = wa.height - useless_gap
                    g.y = wa.y + (useless_gap / 2) + global_border
                else
                    g.height = lowerheight - useless_gap
                    g.y = wa.y + upperheight + (useless_gap / 2) + global_border
                end
                g.x = wa.x + (useless_gap / 2) + global_border
                g.width = leftwidth - useless_gap
            elseif at == bottomrightwork.bottom_right
            then
                -- Bottom right (master)
                if #cls < 4
                then
                    g.height = wa.height - useless_gap
                    g.y = wa.y + (useless_gap / 2) + global_border
                else
                    g.height = lowerheight - useless_gap
                    g.y = wa.y + upperheight + (useless_gap / 2) + global_border
                end
                if #cls == 1
                then
                    g.width = wa.width - useless_gap
                    g.x = wa.x + (useless_gap / 2) + global_border
                else
                    g.width = rightwidth - useless_gap
                    g.x = wa.x + leftwidth + (useless_gap / 2) + global_border
                end
            end

            c:geometry(g)

            at = at + 1
        end

        -- Set remaining clients to floating.
        for i = (#cls - 1 - 3),1,-1
        do
            c = cls[i]
            awful.client.floating.set(c, true)
        end
    end
end

return bottomrightwork
