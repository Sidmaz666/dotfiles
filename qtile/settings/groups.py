from libqtile.config import Key, Group, ScratchPad, DropDown
from libqtile.command import lazy
from .keys import mod, keys
groups =[Group(i) for i in [
    " ", " ", " ", " "," ", " ", ]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        Key([mod], actual_key, lazy.group[group.name].toscreen(), desc="Change Workspaces"),
       Key([mod, "shift"], actual_key, lazy.window.togroup(group.name), desc="Send Window to n Workspace"),

    ])

dropdown_conf = {
    'opacity': 0.8,
    'warp_pointer': True,
    'x' : 0.255,
    'y' : 0.20,
    'width' : 0.51,
    'height': 0.60 , 
}

groups.append(
    ScratchPad('sp', [
            DropDown(
                'term',
                'kitty',
                 **dropdown_conf
            ),
            DropDown(
                'filemanager',
                'kitty /home/kurama/.config/vifm/scripts/vifmrun',
                **dropdown_conf
            ),
            DropDown(
                'htop',
                'kitty htop',
                **dropdown_conf
            ),
            DropDown(
                'anime',
                'kitty /home/kurama/Documents/scripts/extra/ani-cli',
                 **dropdown_conf
            ),
             DropDown(
                'sound',
                'pavucontrol',
                **dropdown_conf
            )
        ]
    )
)

keys.extend(
    [
        Key([mod], 't',lazy.group['sp'].dropdown_toggle('term') ),
        Key( [mod,"control"], 'e', lazy.group['sp'].dropdown_toggle('filemanager') ),
         Key( [mod], 'p', lazy.group['sp'].dropdown_toggle('htop') ),
         Key( [mod,"control"], 'u', lazy.group['sp'].dropdown_toggle('anime') ),
             Key([mod], 's',lazy.group['sp'].dropdown_toggle('sound') )
    ]
)



#group_names = [(" ", {'layout': 'columns'}),
#               (" ", {'layout': 'columns'}),
#               (" ", {'layout': 'columns'}),
#               ("ﳜ", {'layout': 'columns'}),
#               ("  ", {'layout': 'columns'}),
#               (" ", {'layout': 'columns'}),
#              ]
#
#groups = [Group(name, **kwargs) for name, kwargs in group_names]
#
#for i, (name, kwargs) in enumerate(group_names, 1):
#    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
#    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

#

