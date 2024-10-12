// Author: Edward Middleton-Smith
// Project: Dog Tags
// Technology: Dog Tag
// Feature: Main

length_bone = 40;
thickness = 2.5;
height_bone = 20;
height_text = 2;
radius_hole = 1.5;

radius_knob = height_bone / 2 + 0;

offset_text_y = -3 / 2;
space = 7;
offset_knob_y = -2;
offset_knob_x = -2;
$fn = 200;

postcode = "Post code";
phoneno = "Phone Number";


color("lightblue") union() {
    difference() {
        cube([length_bone, height_bone, thickness], center = true);
        translate([0, 7, 0]) cylinder(thickness, radius_hole, radius_hole, center = true);
    }
    translate([length_bone / 2 + offset_knob_x, height_bone / 2 + offset_knob_y, 0]) cylinder(thickness, radius_knob, radius_knob, center = true);
    translate([length_bone / 2 + offset_knob_x, -height_bone / 2 - offset_knob_y, 0]) cylinder(thickness, radius_knob, radius_knob, center = true);
    translate([-length_bone / 2 - offset_knob_x, height_bone / 2 + offset_knob_y, 0]) cylinder(thickness, radius_knob, radius_knob, center = true);
    translate([-length_bone / 2 - offset_knob_x, -height_bone / 2 - offset_knob_y, 0]) cylinder(thickness, radius_knob, radius_knob, center = true);
    translate([0, offset_text_y + space / 2, thickness / 2 + height_text / 2]) linear_extrude(height_text, center = true) text(postcode, size = 5, font="Arial:style=Bold", halign = "center", valign = "center");
    translate([0, offset_text_y - space / 2, thickness / 2 + height_text / 2]) linear_extrude(height_text, center = true) text(phoneno, size = 5, font="Arial:style=Bold", halign = "center", valign = "center");
}