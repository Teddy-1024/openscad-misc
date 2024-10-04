// Author: Edward Middleton-Smith
// Project: Miscellaneous
// Technology: DNA Double Helix
// Feature: Main

include <constants.scad>;

module tip_cutting_cube (radius_rotation_helix, radius_strand_helix, index_tip_helix, angle_incline, height, angle_twist_total) {
    dx = radius_rotation_helix / 2 + radius_strand_helix * 2;
    dy = radius_strand_helix * 2 * (1 - cos(angle_incline)); 
    edge_size = 3 * radius_strand_helix;
    echo("cutting cube edge size: ", edge_size);
    requires_rotation_to_alternative_tip_at_end = (index_tip_helix == 1 || index_tip_helix == 4);
    tip_is_at_top = (index_tip_helix == 3 || index_tip_helix == 4);
    height_tip_top = height;
    rotate([0, 0, (requires_rotation_to_alternative_tip_at_end ? 180 : 0) + (tip_is_at_top ? 0 : 0)]) translate([dx, dy, tip_is_at_top ? height_tip_top : 0]) rotate([-angle_incline, 0, 0]) cube(edge_size, center = true);
}

index_tip_helix = 1; // 1 - 4

tip_cutting_cube(radius_rotation_helix, radius_strand_helix, index_tip_helix, angle_incline, height, angle_twist_total);
