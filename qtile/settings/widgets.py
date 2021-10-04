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
        padding=0
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
       # text="\u25E2",
       text="❮",
        fontsize=23,
        padding=3
    )
def powerline1(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
       # text="\u25E4",
       text= " ❯",
        fontsize=23,
        padding=3
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
            active=colors['color3'],
            inactive=colors['light'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['light'],
            this_current_screen_border=colors['text'],
            this_screen_border=colors['dark'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=False
        ),
    ]




primary_widgets = [

 widget.Image(**base(bg='dark') ,filename="~/.config/qtile/icons/menu.png", scale = "True",margin_x=5, margin=3,mouse_callbacks = {"Button1": lambda: os.system("rofi -show drun -show-icons -theme sm")}),
  *workspaces(),
  widget.CurrentLayoutIcon(**base(bg='dark',fg="light"), scale=0.75),
     widget.WindowCount(**base(fg='light', bg='dark'), fontsize=14, text_format='[{num}]', show_zero=True, padding=1),
    powerline1('light','dark'),

     widget.Memory(**base(fg='light',bg='dark'), fontsize=15,
         format=' [{MemUsed:.0f}{mm}/6.8G] : ',
padding=1
         ),
 widget.CPU(**base(fg='light',bg='dark'), fontsize=15, padding=1,
     format='({load_percent}%)'
     ),

 
     powerline1('light','dark'),
   
    
widget.Clock(**base(bg='dark',fg="light"), format=' %b-%d~%l:%M:%S %p ', padding=0),
   #powerline1('light','dark'),
  #  powerline1('color3','dark'),
   #separator(),

 #widget.WindowName(**base(fg='light'), fontsize=14),
#powerline1('light','dark'),
widget.TaskList(**base(bg='dark', fg='light'), fontsize=15, margin=0, highlight_method="block", markup_focused="<span weight='bold' underline='low'>{}</span>", title_width_method='uniform', boderwidth=0,font="Iosevka", border='#212121', urgent_border='#000000', rounded=False,
txt_floating="🗗", txt_maximized="🗖", txt_minimized=""
    ),

# widget.CPU(**base(fg='light',bg='dark'), fontsize=15, padding=1),
#powerline1('light','dark'),



# powerline1('color1', 'dark'),

#    powerline1('color2','dark'),

 #  powerline('light','dark'),
#  powerline('focus','dark'),

#powerline('light','dark'),
 #  icon(bg="dark", fg="light", text=' '),  # Icon: nf-fa-feed

    widget.Net(**base(bg='dark', fg="light"), interface='wlp1s0', padding=1, format='{down} ↓↑{up}'),
 

 #   widget.CurrentLayout(**base(bg='dark', fg="light"), padding=5),

   powerline('active', 'dark'),
    widget.Battery(**base(bg='dark',fg="light"),charge_char='',unknown_char=' ',discharge_char='', format= '{char} {percent:2.0%}', update_interval=10 ,padding=5),

powerline('light','dark'),
      icon(bg='dark', fg="light",text='🔅'),  # Icon: nf-fa-feed
    widget.Backlight(**base(bg='dark', fg="light"), padding=5, brightness_file="/sys/class/backlight/amdgpu_bl0/brightness", max_brightness_file="/sys/class/backlight/amdgpu_bl0/max_brightness"),
powerline('light','dark'),
   icon(bg='dark',fg="light",text='🔊'),  # Icon: nf-fa-feed

    widget.Volume(**base(bg='dark', fg="light")),

powerline('light','dark'),
 

# powerline('color3', 'dark'),


 widget.Systray(background=colors['dark'], padding=5),

]

secondary_widgets = [
   # *workspaces(),

  #  separator(),

 #   powerline1('light', 'dark'),
# widget.WindowName(**base(fg='light'), fontsize=14),

 #    widget.WindowCount(**base(fg='active', bg='dark'), fontsize=14, text_format='{num} ', show_zero=True),
   
   

#    widget.CurrentLayoutIcon(**base(bg='dark', fg='light'), scale=1),

 #   widget.CurrentLayout(**base(bg='dark', fg='light'), padding=5),

#    powerline1('light', 'dark'),

#    widget.Clock(**base(bg='dark', fg='light'), format='%c '),

widget.TaskList(**base(bg='dark',fg='light'), fontsize=18, margin=0, highlight_method="block", markup_focused="<span underline='low'>{}</span>", title_width_method='uniform', boderwidth=0,font="Iosevka", border='#00111a', urgent_border='dark' ),
separator(),
   widget.Notify(**base(bg='dark', fg="light"), padding=5, max_chars=10,default_timeout=3, action=True),

 widget.WindowCount(**base(fg='light', bg='dark'), fontsize=14, text_format='{num} ', show_zero=True),
    
 widget.CurrentLayoutIcon(**base(bg='dark', fg='light'), scale=0.7),

#    widget.CurrentLayout(**base(bg='dark', fg='light'), padding=5),


]


widget_defaults = {
    'font': 'Iosevka',
    'fontsize': 18,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
