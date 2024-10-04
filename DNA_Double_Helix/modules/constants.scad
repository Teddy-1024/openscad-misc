// Author: Edward Middleton-Smith
// Project: DNA Double Helix
// Technology: Constants and Variables
// Feature: 

// constants
radius_rotation_helix = 80; // radius of helix (displacement of any part of helix from central axis)
radius_strand_helix = 20;
angle_twist_total = 1440;
height = 1300;
rise = 240; // vertical spacing between base-pair rungs
length_discretisation = 1; // length_discretisationretisation of points per units length
pi = 3.14159265359; // rounded

// intermediate variables
angle_incline = asin(height * 360 / angle_twist_total / 2 / pi / radius_rotation_helix);
echo("angle_incline: ", angle_incline);
