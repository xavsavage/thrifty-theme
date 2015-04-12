
--[[
                                                  
     Licensed under GNU General Public License v2 
      * (c) 2015,      xavsavage                 
      * (c) 2014,      projektile                 
      * (c) 2013,      Luke Bonham                
      * (c) 2010-2012, Peter Hofmann              
                                                  
--]]

local awful     = require("awful")
local beautiful = require("beautiful")
local tonumber  = tonumber
local math      = { floor = math.floor }

local coding =
{
    name         = "coding",
    main         = 0,
	over_main    = 1,
    top_left     = 2,
    top_right    = 3,
    bottom_left  = 5,
    bottom_right = 4
}

function coding.arrange(p)
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
		local mainwidth = math.floor(0.25 * wa.width)
		local mainheight = math.floor(0.75 * wa.height)
		local remainderwidth = wa.width - mainwidth

		local at = 0
		for i = #cls,1,-1
		do
			-- It's all fixed. If there are more than 6 clients,
			-- those additional clients will float. This is
			-- intentional.
			if at == 6
			then
				break
			end

			c = cls[i]
			g = {}

			if at == coding.main
			then
				-- main window
				g.x = wa.x + (useless_gap / 2) + global_border
				g.y = wa.y + (useless_gap / 2) + global_border
				g.width = mainwidth - useless_gap
				g.height = mainheight - useless_gap
			elseif at == coding.over_main
			then
				g.y = wa.y + mainheight + (useless_gap / 2) + global_border
				g.x = wa.x + (useless_gap / 2) + global_border
				g.width = mainwidth - useless_gap
				g.height = wa.height - mainheight - useless_gap
			elseif at == coding.top_left
			then
				-- top left
				if #cls < 6
				then
					g.height = wa.height - useless_gap
				else
					g.height = (wa.height / 2) - useless_gap
				end
				if #cls < 4
				then
					g.width = remainderwidth - useless_gap
				else
					g.width = (remainderwidth / 2) - useless_gap
				end
				g.y = wa.y + (useless_gap / 2) + global_border
				g.x = wa.x + mainwidth + (useless_gap / 2) + global_border
			elseif at == coding.top_right
			then
				-- top right
				if #cls < 5
				then
					g.height = wa.height - useless_gap
				else
					g.height = (wa.height / 2) - useless_gap
				end
				g.y = wa.y + (useless_gap / 2) + global_border
				g.x = wa.x + mainwidth + (remainderwidth / 2) + (useless_gap / 2) + global_border
				g.width = (remainderwidth / 2) - useless_gap
			elseif at == coding.bottom_left
			then
				-- bottom left
				g.y = wa.y + (wa.height / 2) + (useless_gap / 2) + global_border
				g.x = wa.x + mainwidth + (useless_gap / 2) + global_border
				g.height = (wa.height / 2) - useless_gap
				g.width = (remainderwidth / 2) -  useless_gap
			elseif at == coding.bottom_right
			then
				-- Bottom right
				g.y = wa.y + (wa.height / 2) + (useless_gap / 2) + global_border
				g.x = wa.x + mainwidth + (remainderwidth / 2) + (useless_gap / 2) + global_border
				g.height = (wa.height / 2) - useless_gap
				g.width = (remainderwidth / 2) -  useless_gap
			end

			c:geometry(g)

			at = at + 1
		end

		-- Set remaining clients to floating.
		for i = (#cls - 1 - 5),1,-1
		do
			c = cls[i]
			awful.client.floating.set(c, true)
		end
    end
end

return coding
