from libqtile import layout
from libqtile.config import Match
from .theme import colors
layout_conf = {
    'border_focus': colors['focus'][0],
    'border_width': 4,
    'margin': 10
}
layouts = [
    #layout.Max(),
   # layout.MonadTall(**layout_conf),
    #layout.MonadWide(**layout_conf),
    #layout.Bsp(**layout_conf),
    #layout.Matrix(columns=2, **layout_conf),
    #layout.RatioTile(**layout_conf),
     layout.Columns(margin=10, border_width=3, border_focus="#e0218a", border_normal="#696969"),
    layout.Max(),
    #layout.Tile(margin=10),
   # layout.TreeTab(sections=[""], section_top=0, panel_width=35),
    # layout.VerticalTile(),
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
    border_focus=colors["color4"][0]
)
