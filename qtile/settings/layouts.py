from libqtile import layout
from libqtile.config import Match
from .theme import colors
layout_conf = {
    'border_focus':"#ffffff",
    'border_width': 2,
    'border_normal': "#666666",
    'margin': 5
}
layouts = [
    #layout.Max(),
  #  layout.MonadTall(**layout_conf),
    #layout.MonadWide(**layout_conf),
  # layout.Bsp(**layout_conf),
   # layout.Matrix(columns=2, **layout_conf),
   # layout.RatioTile(**layout_conf),
     layout.Columns(**layout_conf),
    layout.Max(),
   # layout.Tile(**layout_conf),
   # layout.TreeTab(sections=[""], section_top=0, panel_width=35),
    # layout.VerticalTile(**layout_conf),
   #  layout.Zoomy(columnwidth=50, margin=0, property_big='1.0', property_name='ZOOM',property_small='0.1'),
]

floating_layout = layout.Floating(
    float_rules=[
        {
            'wmclass': 'feh'

            },
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
    ],
    border_focus="#ffffff"
)
