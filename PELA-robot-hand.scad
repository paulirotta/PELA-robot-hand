/*
PELA Robot Hand

PELA Parametric Blocks - 3D Printed LEGO-compatible parametric blocks

Published at http://robothand.PELAblocks.org

By Paul Houghton
Twitter: @mobile_rat
Email: paulirotta@gmail.com
Blog: https://medium.com/@paulhoughton

Creative Commons Attribution ShareAlike NonCommercial License
    https://creativecommons.org/licenses/by-sa/4.0/legalcode

Design work kindly sponsored by
    http://futurice.com

Import this into other design files:
    include <PELA-parameters.scad>
    use <PELA-block.scad>

All modules have sensible defaults derived from <parameters.scad>. 
You can ignore values you are not tampering with and only need to pass a
parameter if you are overriding.

All modules are setup for stateless functional-style reuse in other OpenSCAD files.
To this end, you can always pass in and override all parameters to create
a new effect. Doing this is not natural to OpenSCAD, so apologies for all
the boilerplate arguments which are passed in to each module or any errors
that may be hidden by the sensible default values. This is an evolving art.
*/

include <PELA-blocks/material.scad>
include <PELA-blocks/style.scad>
use <PELA-blocks/PELA-block.scad>
use <PELA-blocks/PELA-technic-block.scad>
use <PELA-blocks/box-enclosure/PELA-box-enclosure.scad>



/* [Hand] */

// Printing material (set to select calibrated knob, socket and axle hole fit)
material = 0; // [0:PLA, 1:ABS, 2:PET, 3:Biofila Silk, 4:Pro1, 5:NGEN, 6:NGEN FLEX, 7:Bridge Nylon, 8:TPU95, 9:TPU85/NinjaFlex]

// Is the printer nozzle >= 0.5mm? If so, some features are enlarged to make printing easier
large_nozzle = true;

// Enable generation of individual parts
full_hand = true; // Enable for rendering

// Expand this spacing between parts as a way to exapand for better visibility
expand_joint_space = false;

// Enable to round the bottom tip of each finger
fingertip_rounding = false;

finger2 = true || full_hand;
finger3 = false || full_hand;
finger4 = false || full_hand;
finger5 = false || full_hand;
palm = false || full_hand;
cover = true;

// Number of blocks wide is the rigid connector between the finger and the body
finger_rotator_width = 1;

// Number of blocks wide rotation surface for finger to roll downward from the palm
finger_rotator_length = 2;

/* [Thumb] */

finger1 = false; // || full_hand;

 // Number of blocks wide is the rigid connector between the thumb and the body
thumb_rotator_width = 1;

// Number of blocks wide rotation surface for thumb to roll downward from the palm
thumb_rotator_length = 4;

// Vertical size in block count of fingers
finger_height = 1;

// Thumb
finger1width = 2;
finger1height = finger_height;
finger1length1 = thumb_rotator_length; 
finger1length2 = 5; 
finger1length3 = 4; 


/* [Pointer Finger] */

finger2width = 2;
finger2height = finger_height;
finger2length1 = 4; 
finger2length2 = 4; 
finger2length3 = 3; 


/* [Index Finger] */

finger3width = 2;
finger3height = finger_height;
finger3length1 = 4; 
finger3length2 = 5; 
finger3length3 = 4; 



/* [Ring Finger] */

finger4width = 2;
finger4height = finger_height;
finger4length1 = 4; 
finger4length2 = 4; 
finger4length3 = 3; 



/* [Pinky Finger] */

finger5width = 2;
finger5height = finger_height;
finger5length1 = 4; 
finger5length2 = 4; 
finger5length3 = 2; 



/* [Block Options] */

// Basic unit vertical size of each block
block_height = 8; // [8:technic, 9.6:traditional blocks]

// Connectors on top surface of fingers
finger_knobs = true;

// Add full width through holes spaced along the length for PELA Techics connectors
side_holes = 3;  // [0:disabled, 1:short air vents, 2:full width connectors, 3:short connectors]

// Add a sheath around Technic side holes (only used if there are side_holes, disable for extra ventilation, enable for connector lock notches)
side_sheaths = true;

// Add short end holes spaced along the width for PELA Techics connectors
end_holes = 2;  // [0:disabled, 1:short air vents, 2:short connectors, 3:full length connectors]

// Add a sheath around end holes  (only used if there are end_holes, disable for extra ventilation, enable for connector lock notches)
end_sheaths = true;

// Add holes in the top deck to improve airflow and reduce weight
top_vents = false;

// Size of a hole in the top of each knob to keep the cutout as part of the outside surface (slicer-friendly manifold shape). 0 to disable or use for air circulation/aesthetics/drain resin from the cutout, but larger holes change flexture such that knobs may not hold as well.
knob_vent_radius = 1.8; // [0.0:0.1:3.9]

finger_joint_space = expand_joint_space ? 0.5*block_width : 0;

inter_finger_space = block_width;



/* [Cables] */

// Cut tunnels from the model as cable guides
cable_tunnel = true;

cable_tunnel_roundness = 8; // $fn value for shape of the tunnel

// Nominal diameter of the hole which cables slide through
cable_tunnel_d = 0.7;

// How deep from the surface of the part is the cable tunnel
cable_tunnel_inset = skin;

// Distance widthward from lengthwise centerline of the four cable tunnels
cable_tunnel_spacing = 4;



/* [Robot Hand Palm] */

// Hand body dimensions (knob count)
palm_length = 11;

// Hand body dimensions (knob count)
palm_width = 11;

// Hand body dimensions (knob count)
palm_height = 2;

// Bottom of enclosure
palm_bottom_type = 3; // [0:open bottom, 1:solid bottom, 2:socket panel bottom, 3:knob panel bottom]

// Add holes in the palm top deck (if cover_type is knobs or plain) to improve airflow and reduce weight
cover_top_vents = true;

// Style of palm cover
cover_type = 1; // [0:knobs, 1:sockets, 2:solid]

// Presence of palm cover bottom connector sockets
cover_sockets = true;

// Presence of palm cover top knobs
cover_knobs = true;

// Palm walls
left_wall_enabled = true;

// Palm walls
right_wall_enabled = true;

// Palm walls
front_wall_enabled = true;

// Palm walls
back_wall_enabled = true;

// Palm rim knobs
left_wall_knobs = true;

// Palm rim knobs
right_wall_knobs = true;

// Palm rim knobs
front_wall_knobs = true;

// Palm rim knobs
back_wall_knobs = true;



/* [Hidden] */



////////////////////
// Main View
////////////////////

robot_hand();





////////////////////
// Modules
////////////////////

module robot_hand() {

    finger_vertical_offset = panel_height();

    translate([0, 0, finger_vertical_offset]) {
        if (finger1) {    
            thumb_rotator(material=material, large_nozzle=large_nozzle, w=finger1width, l=1, h=finger1height, tx=block_width(-7), ty=block_width(-thumb_rotator_width) - finger_joint_space, left_cut=false, right_cut=true, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

            thumb_rotator(material=material, large_nozzle=large_nozzle, w=finger1width, l=1, h=finger1height, tx=block_width(-7), ty=block_width(-2*thumb_rotator_width) - 2*finger_joint_space, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

            finger1(material=material, large_nozzle=large_nozzle, tx=block_width(-7), ty=block_width(-4*thumb_rotator_width) - 3*finger_joint_space, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
        }

        if (finger2) {
            finger_rotator(material=material, large_nozzle=large_nozzle, w=finger2width, l=1, h=finger2height, tx=finger_joint_space, ty=0, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

            finger2(material=material, large_nozzle=large_nozzle, tx=block_width(finger_rotator_width)+2*finger_joint_space, ty=0, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
        }

        if (finger3) {
            finger_rotator(material=material, large_nozzle=large_nozzle, w=finger3width, l=1, h=finger3height, tx=finger_joint_space, ty=inter_finger_space + block_width(finger2width), finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

            finger3(material=material, large_nozzle=large_nozzle, tx=block_width(finger_rotator_width)+2*finger_joint_space, ty=inter_finger_space + block_width(finger2width), finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
        }

        if (finger4) {
            finger_rotator(material=material, large_nozzle=large_nozzle, w=finger4width, l=1, h=finger4height, tx=finger_joint_space, ty=2*inter_finger_space + block_width(finger2width+finger3width), finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

            finger4(material=material, large_nozzle=large_nozzle, tx=block_width(finger_rotator_width)+2*finger_joint_space, ty=2*inter_finger_space + block_width(finger2width+finger3width), finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
        }

        if (finger5) {
            finger_rotator(material=material, large_nozzle=large_nozzle, tx=finger_joint_space, h=finger5height, ty=3*inter_finger_space + block_width(finger2width+finger3width+finger4width), finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

            finger5(material=material, large_nozzle=large_nozzle, tx=block_width(finger_rotator_width)+2*finger_joint_space, ty=3*inter_finger_space + block_width(finger2width+finger3width+finger4width), finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
        }
    }

    if (palm) {
        palm_body(material=material, large_nozzle=large_nozzle, palm_length=palm_length, palm_width=palm_width, palm_height=palm_height, bottom_type=palm_bottom_type, cable_tunnel_spacing=cable_tunnel_spacing, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness, knob_vent_radius=knob_vent_radius);
    }

    if (cover) {
        translate([-block_width(palm_length), -block_width(palm_width + 0.5), 0]) {
            palm_cover(material=material, cover_type=cover_type, palm_length=palm_length, palm_width=palm_width, top_vents=cover_top_vents, knobs=cover_knobs, sockets=cover_sockets, solid_first_layer);
        }
    }
}


// A center to the hand, hollow for adding snap-fit internal components
module palm_body(material=material, large_nozzle=large_nozzle, palm_length=palm_length, palm_width=palm_width, palm_height=palm_height, bottom_type=palm_bottom_type, cable_tunnel_spacing=cable_tunnel_spacing, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness, knob_vent_radius=knob_vent_radius) {
    
    translate([-block_width(palm_length), 0, panel_height()]) {
        difference() {
            box_enclosure(material=material, large_nozzle=large_nozzle, l=palm_length, w=palm_width, h=palm_height, bottom_type=bottom_type, top_vents=top_vents, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, skin=skin, left_wall_enabled=left_wall_enabled, right_wall_enabled=right_wall_enabled, front_wall_enabled=front_wall_enabled, back_wall_enabled=back_wall_enabled, left_wall_knobs=left_wall_knobs, right_wall_knobs=right_wall_knobs, front_wall_knobs=front_wall_knobs, back_wall_knobs=back_wall_knobs, solid_upper_layers=solid_upper_layers, shell=shell, ridge_z_offset=ridge_z_offset, knob_vent_radius=knob_vent_radius);

            union() {
                palm_cable_tunnels(material=material, large_nozzle=large_nozzle, palm_width=palm_width, palm_length=palm_length, finger_height=finger_height, cable_tunnel_spacing=cable_tunnel_spacing, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness);

                translate([block_width(palm_width), 0, 0]) {
                    rotate([0, 0, 90]) {
                        palm_cable_tunnels(material=material, large_nozzle=large_nozzle, palm_width=palm_length, palm_length=palm_width, finger_height=finger_height, cable_tunnel_spacing=cable_tunnel_spacing, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness);
                    }
                }
            }
        }
    }
}


// Thumb
module finger1(material=material, large_nozzle=large_nozzle, tx=0, ty=0, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {

    finger_body1(material=material, large_nozzle=large_nozzle, w=finger1width-1, l=finger1length1, h=finger1height, tx=tx, ty=ty, left_cut=false, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body2(material=material, large_nozzle=large_nozzle, w=finger1width, l=finger1length2, h=finger1height, tx=tx+block_width(finger1length1) + finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body3(material=material, large_nozzle=large_nozzle, w=finger1width, l=finger1length3, h=finger1height, tx=tx+block_width(finger1length1 + finger1length2) + 2*finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
}

// Pointer
module finger2(material=material, large_nozzle=large_nozzle, tx=0, ty=0, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {
    finger_body1(material=material, large_nozzle=large_nozzle, w=finger2width, l=finger2length1, h=finger2height, tx=tx, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body2(material=material, large_nozzle=large_nozzle, w=finger2width, l=finger2length2, h=finger2height, tx=tx+block_width(finger2length1) + finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body3(material=material, large_nozzle=large_nozzle, w=finger2width, l=finger2length3, h=finger2height, tx=tx+block_width(finger2length1 + finger2length2) + 2*finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
}

// Index
module finger3(material=material, large_nozzle=large_nozzle, tx=0, ty=0, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {

    finger_body1(material=material, large_nozzle=large_nozzle, w=finger3width, l=finger3length1, h=finger3height, tx=tx, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body2(material=material, large_nozzle=large_nozzle, w=finger3width, l=finger3length2, h=finger3height, tx=tx+block_width(finger3length1) + finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body3(material=material, large_nozzle=large_nozzle, w=finger3width, l=finger3length3, h=finger3height, tx=tx+block_width(finger3length1 + finger3length2) + 2*finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
}

// Ring
module finger4(material=material, large_nozzle=large_nozzle, tx=0, ty=0, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {

    finger_body1(material=material, large_nozzle=large_nozzle, w=finger4width, l=finger4length1, h=finger4height, tx=tx, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body2(material=material, large_nozzle=large_nozzle, w=finger4width, l=finger4length2, h=finger4height, tx=tx+block_width(finger4length1) + finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body3(material=material, large_nozzle=large_nozzle, w=finger4width, l=finger4length3, h=finger4height, tx=tx+block_width(finger4length1 + finger4length2) + 2*finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
}

// Pinky
module finger5(material=material, large_nozzle=large_nozzle, tx=0, ty=0, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {
    finger_body1(material=material, large_nozzle=large_nozzle, w=finger5width, l=finger5length1, h=finger5height, tx=tx, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body2(material=material, large_nozzle=large_nozzle, w=finger5width, l=finger5length2, h=finger5height, tx=tx+block_width(finger5length1) + finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_body3(material=material, large_nozzle=large_nozzle, w=finger5width, l=finger5length3, h=finger5height, tx=tx+block_width(finger5length1 + finger5length2) + 2*finger_joint_space, ty=ty, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
}

// Rotation aid for the thumb
module thumb_rotator(material=material, large_nozzle=large_nozzle, w=thumb_rotator_width, l=thumb_rotator_length, h=1, tx=0, ty=0, left_cut=true, right_cut=true, side_holes=false, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {

    translate([tx, ty+block_width(w)]) {
        rotate([0, 0, -90]) {
            finger_body(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, left_cut=left_cut, right_cut=right_cut, tx=0, ty=0, side_holes=0, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
        }
    }
}

// Rotation aid for a finger
module finger_rotator(material=material, large_nozzle=large_nozzle, w=finger_rotator_width, l=finger_rotator_length, h=1, tx=0, ty=0, left_cut=false, right_cut=true, side_holes=false, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {
    
    translate([tx, ty]) {
        finger_body(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, left_cut=left_cut, right_cut=right_cut, tx=0, ty=0, side_holes=0, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
    }
}

// Base bone
module finger_body1(material=material, large_nozzle=large_nozzle, w=undef, l=undef, h=undef, tx=0, ty=0, left_cut=true, right_cut=true, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {

    finger_body(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, left_cut=left_cut, right_cut=right_cut, tx=tx, ty=ty, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
}

// Middle bone
module finger_body2(material=material, large_nozzle=large_nozzle, w=undef, l=undef, h=undef, tx=0, ty=0, left_cut=true, right_cut=true, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {
    
    finger_body(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, left_cut=left_cut, right_cut=right_cut, tx=tx, ty=ty, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);
}

// Tip bone
module finger_body3(material=material, large_nozzle=large_nozzle, w=undef, l=undef, h=undef, tx=0, ty=0, left_cut=true, right_cut=false, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, bearing_cutout=false, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {

    if (fingertip_rounding) {
        rotation = 0;
        intersection() {
            finger_body(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, left_cut=left_cut, right_cut=right_cut, tx=tx, ty=ty, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, bearing_cutout=false, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

            translate([tx, ty, 0]) {
                rotate([rotation, 0, 0]) {
                    fingertip_rounding(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h);
                }
            }
        }
    } else {
        finger_body(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, left_cut=left_cut, right_cut=right_cut, tx=tx, ty=ty, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);  
    }      
}


// A bone segment of a finger
module finger_body(material=material, large_nozzle=large_nozzle, w, l, h, left_cut=true, right_cut=true, tx=0, ty=0, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {

    rotation = 0;
    translate([tx, ty, 0]) {
        rotate([rotation, 0, 0]) {

            difference() {
                PELA_technic_block_solid_ends(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, top_vents=top_vents, bolt_holes=false, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

                union() {
                    // Re-carve sockets through finger features for easier connection
                    length = top_vents ? block_height(h+1, block_height=block_height) : block_height(h, block_height=block_height)-block_width(0.5);

                    offset_from_bottom = large_nozzle ? knob_height : 0;

                    translate([0, 0, offset_from_bottom]) {
                        double_socket_hole_set(material=material, large_nozzle=large_nozzle, l=l, w=w, sockets=sockets, alternate_length=length, length=length);
                    }
//                    if (large_nozzle) {
//#                        socket_hole_set(l=l, w=w, radius=axle_hole_radius*2/3, length=length);
//                    }

                    if (left_cut) {
                        left_cut_negative_space(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h);
                    }
                    if (right_cut) {
                        right_cut_negative_space(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h);
                    }
                    
                    cable_tunnel_negative_space(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, cable_tunnel_spacing=cable_tunnel_spacing, cable_tunnel_d=cable_tunnel_d);
                }
            }
        }
    }
}


// A block in which the first and last row (beginning and end of "length" axis, finger is longer in this direction) are solid internally expect for normal PELA block negative space
module PELA_technic_block_solid_ends(material=material, large_nozzle=large_nozzle, w=undef, l=undef, h=undef, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, top_vents=top_vents, bolt_holes=false, finger_knobs=finger_knobs, knob_vent_radius=knob_vent_radius) {

    solid_length = l==1 ? block_width(0.5) : 4.7;

    PELA_technic_block(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, side_holes=side_holes, side_sheaths=side_sheaths, end_holes=end_holes, end_sheaths=end_sheaths, top_vents=top_vents, knobs=finger_knobs, knob_vent_radius=knob_vent_radius);

    finger_bone_solid_end(material=material, large_nozzle=large_nozzle, solid_length=solid_length, w=w, h=h);

    translate([block_width(l), block_width(w), 0]) {
        rotate([0, 0, 180]) {
            finger_bone_solid_end(material=material, large_nozzle=large_nozzle, solid_length, w=w, h=h);
        }
    }
}


// A solid section less than one PELA block long and full finger width wide to strengthen the interior near each end of every finger bone
module finger_bone_solid_end(material=material, large_nozzle=large_nozzle, solid_length, w=undef, h=undef) {

    intersection() {
        difference() {
            cube([solid_length, block_width(w), block_height(h, block_height=block_height)]);

            double_end_connector_hole_set(material=material, large_nozzle=large_nozzle, l=1, w=w, hole_type=end_holes);
        }

        skinned_block(material=material, large_nozzle=large_nozzle, l=1, w=w, h=h);
    }
}



// 45 degree cut to allow finger bending, base end of finger bone
module left_cut_negative_space(material=material, large_nozzle=large_nozzle, w=undef, l=undef, h=undef, skin=skin) {

    rotate([0, 45, 0]) {
        cube([block_width(w), block_width(w*2), block_width(sin(45))], center=true);
    }
}



// 45 degree cut to allow finger bending, tip of finger bone
module right_cut_negative_space(material=material, large_nozzle=large_nozzle, w=undef, l=undef, h=undef, skin=skin) {

    translate([block_width(l), block_width(w)]) {
        rotate([0, 0, 180]) {
            left_cut_negative_space(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, skin=skin);
        }
    }
}



// The shape of a rounded fingertip
module fingertip_rounding(material=material, large_nozzle=large_nozzle, w=undef, l=undef, h=undef) {

    hull() {
        radius = knob_radius;

        translate([-block_width(l) + skin, skin, 0]) {
            cube([block_width(l) - 2*skin, block_width(w) - 2*skin, block_height(h+1, block_height=block_height)]);
        }

        translate([0, 0, block_height(h+1, block_height=block_height)]) {
            cube([block_width(l) - skin, block_width(w) - skin, 1]);
        }

        translate([block_width(l) - skin - radius, skin, radius]) {
            rotate([-90, 0, 0]) {
                cylinder(r=radius, h=block_width(w)-2*skin);
            }
        }
    }
}


// Cable tunnels to route finger cables into the palm
module palm_cable_tunnels(material=material, large_nozzle=large_nozzle, palm_width=palm_width, palm_length=palm_length, finger_height=finger_height, cable_tunnel_spacing=cable_tunnel_spacing, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness) {

    for (i=[-1:1:palm_width-1]) {
        translate([0, block_width(i-palm_width-0.5), 0]) {

            cable_tunnel_negative_space(material=material, large_nozzle=large_nozzle, w=palm_width, l=palm_length, h=finger_height, cable_tunnel_spacing=cable_tunnel_spacing, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness);
        }
    }
}


// Four cable tunnels for finger control lines
module cable_tunnel_negative_space(material=material, large_nozzle=large_nozzle, w=undef, l=undef, h=undef, cable_tunnel_spacing=cable_tunnel_spacing, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness) {

    if (cable_tunnel) {
        translate([0, -cable_tunnel_spacing, 0]) {
            cable_tunnel_set(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness);
        }
        translate([0, cable_tunnel_spacing, 0]) {
            cable_tunnel_set(material=material, large_nozzle=large_nozzle, w=w, l=l, h=h, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness);
        }
    }
}


// Two parallel space through which drive cables are threaded
module cable_tunnel_set(material=material, large_nozzle=large_nozzle, large_nozzle=large_nozzle, w=undef, l=undef, h=undef, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness) {

    translate([0, block_width(w/2), block_height(h, block_height=block_height)-cable_tunnel_inset]) {
        cable_tunnel(material=material, large_nozzle=large_nozzle, length=block_width(l), cable_tunnel_roundness=cable_tunnel_roundness);
    }

    translate([0, block_width(w/2), cable_tunnel_inset]) {
        cable_tunnel(material=material, large_nozzle=large_nozzle, length=block_width(l), cable_tunnel_roundness=cable_tunnel_roundness);
    }
}


// A space through which a drive cable is threaded
module cable_tunnel(material=material, large_nozzle=large_nozzle, length, cable_tunnel_d=cable_tunnel_d, cable_tunnel_roundness=cable_tunnel_roundness) {

    rotate([0, 90, 0]) {
        cylinder(d=cable_tunnel_d, h=length, $fn=cable_tunnel_roundness);
    }
}


module palm_cover(material=undef, cover_type=undef, palm_length=undef, palm_width=undef, top_vents=undef, knobs=undef, sockets=undef, solid_first_layer=undef) {
    
    assert(cover_type >= 0, "Robot Hand Cover Type must be 0-2");
    assert(cover_type <= 2, "Robot Hand Cover Type must be 0-2");
    
    if (cover_type == 0) {
        knob_panel(material=material, l=palm_length, w=palm_width, top_vents=top_vents, bolt_holes=bolt_holes, bolt_hole_radius=bolt_hole_radius, knobs=cover_knobs, sockets=cover_sockets, solid_first_layer=solid_first_layer);
    } else if (cover_type == 1) {
        socket_panel(material=material, large_nozzle=large_nozzle, cut_line=0, l=palm_length, w=palm_width, sockets=sockets, solid_first_layer=solid_first_layer, corner_bolt_holes=corner_bolt_holes, bolt_hole_radius=bolt_hole_radius, skin=skin, block_height=block_height);
    } else if (cover_type == 2) {
        knob_panel(material=material, l=palm_length, w=palm_width, top_vents=cover_top_vents, bolt_holes=cover_bolt_holes, bolt_hole_radius=bolt_hole_radius, knobs=false, sockets=cover_sockets, solid_first_layer=solid_first_layer);
    }
}
