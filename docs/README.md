# PELA Robot Hand
## 3D Printed LEGO-compatible Parametric Robot Hand based on [PELA Blocks](http://pelablocks.org)

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

**This robot hand is a work in progress.**

## Models

[![PELA Robot Hand](PELA-robot-hand.png)](https://github.com/LEGO-Prototypes/PELA-robot-hand/blob/master/PELA-robot-hand.stl)

[3D PELA Robot Hand](https://github.com/LEGO-Prototypes/PELA-robot-hand/blob/master/PELA-robot-hand.stl)

Fingers are attached to the palm by Technics connectors. Replicable, flexible skin with PELA connectors on the inside surface and touch sensitivity on the outside will be added (not shown).


## Downloading

If you prefer to avoid git, you can download the files instead.

1. Download and unzip **[PELA Robot Hand](https://github.com/LEGO-Prototypes/PELA-robot-hand/archive/master.zip)**
1. Download and unzip **[PELA Blocks](https://github.com/LEGO-Prototypes/PELA-blocks/archive/master.zip)** as a subdirectory (`PELA-robot-hand\PELA-blocks`)
1. **[Calibrate](http://pelablocks.org/#calibrate)** the models to your printer/filament/slicer/preferences

## Git Clone

1. `git lfs install` and `git clone --recurse-submodules git@github.com:LEGO-compatible-gadgets/PELA-robot-hand.git`
1. `cd PELA-robot-hand\PELA-parameteric-blocks` and then `git checkout master`
1. **[Calibrate](http://pelablocks.org/#calibrate)** the models to your printer/filament/slicer/preferences
1. When PELA Blocks changes, [backup your calibration files](#calibration-file-backup) if needed, then either `git submodule update --remote` or cd into the submodule and `git reset --hard origin/master` and `git pull`

See also [Advanced Setup](http://pelablocks.org/ADVANCED-SETUP.html)

## Calibration

**IMPORTANT:** The STL models must be customized for your material, printer and slicer. First **[calibrate](http://pelablocks.org/#calibrate)** the PELA blocks for your printer to achieve a nice snap fit.

See also [Advanced Calibration](http://pelablocks.org/ADVANCED-CALIBRATION)

## Calibration File Backup

If you later update the PELA-blocks project to a newer version, you risk overwriting and loosing your calibration customizations. The simplest solution is to create a backup copy those settings.

1. `cd PELA-robot-hand/PELA-Blocks`
1. `cp PELA-parameters.scad ../PELA-parameters-backup.scad`
1. `cp PELA-print-parameters.scad ../PELA-print-parameters-backup.scad`

## Use

Edit the [OpenSCAD](http://www.openscad.org/) files to generate different views such as one finger at a time.

Be patient, have a nice meal and a coffee, the models are complex and render slowly.

## License

[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/3.0/88x31.png)](https://creativecommons.org/licenses/by-sa/4.0/)

**Creative Commons Attribution-ShareAlike 4.0 International License**

These designs are by PELA project contributors, not by the LEGO corporation. They are compatible with LEGO and similar blocks available from multiple manufacturers and online projects. The associated patents have expired. These designs are not identical to LEGO; they have been specially modified for easy 3D printing and offered in the spirit of open source collaborative innovation.

If what you want is available as injection molded plastic, buy it for the higher quality and durability. These model are helpful when you want something customized, a special color, an unusual material, and for replacement parts when you just can't wait.

## Open source design, Powered By Futurice

[![Futurice](images/futurice-logo.jpg)](https://futurice.com)

These open source designs are brought to you by [Futurice](http://futurice.com) and contributions from the community. Come work with the best.

The software needed is free and open source, [OpenSCAD](http://www.openscad.org/). You can probably learn it in less than an hour.

## Contact

Collaboration and pull requests are welcome: [Git Project](https://github.com/LEGO-Prototypes/PELA-robot-hand)

paul.houghton@futurice.com ( **[Blog](https://medium.com/@paulhoughton)** - **[Twitter](https://twitter.com/mobile_rat)** )

If you like it, please tweet about us! [<img src="images/share-twitter-button.jpg">](https://twitter.com/intent/tweet?screen_name=mobile_rat&hashtags=PELAblocks&related=mobile_rat&text=Engineering-grade%203D%20printed%20LEGO%20robot%20hand&tw_p=tweetbutton&url=http%3A%2F%2Frobothand.pelablocks.org)
