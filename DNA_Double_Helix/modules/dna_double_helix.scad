// Author: Edward Middleton-Smith
// Project: Miscellaneous
// Technology: DNA Double Helix
// Feature: Main

include <constants.scad>;
use <tip_cutting_cube.scad>;

module DNA_Double_Helix(radius_rotation_helix, radius_strand_helix, angle_twist_total, height, rise, length_discretisation, pi, angle_incline) {
    union() {
        difference() {
            union() {
                linear_extrude(height = height, center = false, convexity = 10, twist = angle_twist_total, slices = height * length_discretisation) translate([radius_rotation_helix, 0, 0]) scale([1, 2, 1]) circle(radius_strand_helix);
                linear_extrude(height = height, center = false, convexity = 10, twist = angle_twist_total, slices = height * length_discretisation) translate([-radius_rotation_helix, 0, 0]) scale([1, 2, 1]) circle(radius_strand_helix);
            }
            
            // grooves
            
        
            // tip removal - forces faces at ends of helix to be tangential to helix circumference at that point
            for (index_tip_helix = [1:4]) {
                rotate([0, 0, -7]) tip_cutting_cube(radius_rotation_helix, radius_strand_helix, index_tip_helix, angle_incline, height, angle_twist_total);
            }
        }  

        // knobs - balls at ends of helixes
        rotate([0, 0, -25]) translate([radius_rotation_helix, radius_strand_helix * (1 - sin(angle_incline)),radius_strand_helix * cos(angle_incline)]) sphere(radius_strand_helix);
        rotate([0, 0, 155]) translate([radius_rotation_helix, radius_strand_helix * (1 - sin(angle_incline)),radius_strand_helix * cos(angle_incline)]) sphere(radius_strand_helix);
        rotate([0, 0, 39]) mirror([0, 0, 1]) translate([0, 0, -height]) {
            rotate([0,0,-25]) translate([radius_rotation_helix, radius_strand_helix * (1 - sin(angle_incline)),radius_strand_helix * cos(angle_incline)]) sphere(radius_strand_helix);
            rotate([0,0,155]) translate([radius_rotation_helix, radius_strand_helix * (1 - sin(angle_incline)),radius_strand_helix * cos(angle_incline)]) sphere(radius_strand_helix);
        }


        // base-pair rungs
        for (index_rung = [1 : (height - height % rise) / rise]) {
            echo("index rung: ", index_rung);
            position_rung = rise * index_rung / height * angle_twist_total;
            echo("position rung: ", position_rung);
            translate([0, 0, rise * index_rung - radius_strand_helix * 3/2]) rotate([-angle_incline, 90, -position_rung]) scale([1/2, 1, 1]) cylinder(2 * radius_rotation_helix, radius_strand_helix, radius_strand_helix, center = true);
        }
    }
}

DNA_Double_Helix(radius_rotation_helix, radius_strand_helix, angle_twist_total, height, rise, length_discretisation, pi, angle_incline);