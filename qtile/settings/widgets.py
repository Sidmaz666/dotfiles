import os
from libqtile import widget
from .theme import colors


def base(fg='text', bg='dark'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="\u25E2",
        fontsize=60,
        padding=-3
    )
def powerline1(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="\u25E4",
        fontsize=60,
        padding=-3
    )

def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
    ]




primary_widgets = [

 widget.Image(**base(bg='dark') ,filename="~/.config/qtile/icons/menu.png", scale = "True",margin_x=5, margin=3,mouse_callbacks = {"Button1": lambda: os.system("rofi -show drun -show-icons -theme sms")}),
 powerline1('dark','light'),
   widget.Memory(**base(fg='dark',bg='light'), fontsize=15),
   widget.CPU(**base(fg='dark',bg='light'), fontsize=15),
  powerline1('light','color1'),
  widget.Clock(**base(bg='color1'), format='%A:%d-%b-%Y %l:%M:%S %p ', padding=1),
   powerline1('color1','dark'),
   separator(),

 widget.WindowName(**base(fg='light'), fontsize=14),

    powerline('color3', 'dark'),

   icon(bg="color3", text=' '),  # Icon: nf-fa-feed

    widget.Net(**base(bg='color3'), interface='wlp1s0'),

    powerline('color1','color3'),

    widget.Battery(**base(bg='color1'),charge_char='',unknown_char=' ',discharge_char='', format= '{char} {percent:2.0%}', padding=5),

    powerline('color2','color1'),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),

   powerline('color1', 'color2'),

    icon(bg='color1',text='醙 '),  # Icon: nf-fa-feed

    widget.Volume(**base(bg='color1')),

    icon(bg='color1',text=' ∮'),  # Icon: nf-fa-feed

    widget.Notify(**base(bg='color1'), padding=5, max_chars=10,default_timeout=3, action=True),


 powerline('dark', 'color1'),


 widget.Systray(background=colors['dark'], padding=5),
  *workspaces(),

]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('color1', 'color3'),

    widget.CurrentLayoutIcon(**base(bg='color1'), scale=1),

    widget.CurrentLayout(**base(bg='color1'), padding=5),

    powerline('color2', 'color1'),

    widget.Clock(**base(bg='color2'), format='%c '),

]

widget_defaults = {
    'font': 'Ubuntu Mono Nerd Font',
    'fontsize': 17,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
