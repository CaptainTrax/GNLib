local PANEL = {}

AccessorFunc( PANEL, "color", "Color" )

AccessorFunc( PANEL, "title", "Title" )
AccessorFunc( PANEL, "font", "Font" )

function PANEL:Init()
    self:DockPadding( 10, 20, 10, 10 )

    self.color = GNLib.Colors.Clouds

    self.title = "GroupBox"
    self.font = "GNLFontB15"
end

function PANEL:Paint( w, h )
    --  > Just a copy/paste from GNTextEntry
    surface.SetDrawColor( self.color )

    surface.SetFont( self.font )
    local text_width, text_height = surface.GetTextSize( self.title )

    draw.SimpleText( self.title, self.font, 12, text_height / 2, self.color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

    surface.DrawLine( 4, text_height / 2, 8, text_height / 2 )
    surface.DrawLine( text_width + 14, text_height / 2, w - 4, text_height / 2 )
    surface.DrawLine( 3, h - 1, w - 4, h - 1 )
    surface.DrawLine( 0, text_height / 2 + 4, 0, h - 4 )
    surface.DrawLine( w - 1, text_height / 2 + 4, w - 1, h - 4 )

    GNLib.DrawOutlinedCircle( 4, text_height / 2 + 4, 4, 1, -90, -180, self.color )
    GNLib.DrawOutlinedCircle( 4, h - 4, 4, 1, -270, -180, self.color )
    GNLib.DrawOutlinedCircle( w - 4, text_height / 2 + 4, 4, 1, -90, 0, self.color )
    GNLib.DrawOutlinedCircle( w - 4, h - 4, 4, 1, 180, 270, self.color )
end

vgui.Register( "GNGroupBox", PANEL, "DPanel" )