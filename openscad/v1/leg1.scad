include <dimensions1.scad>;
include <servo1.scad>;
include <bolt1.scad>;
include <coxa1.scad>;

module leg(leg_alpha) {
    translate([0, 0, -(servo_holder_h - servo_size[2]/2)]) rotate([0, 0, 180]) servo(0.7);
    rotate([0, 0, coxa_angle]) coxa(leg_alpha);
    
    
    // bolts
    _l_bolt_size = servo_holder_size[2] + material_thickness;
    translate([servo_size[1]/2 + servo_holder_hole_pos[0], servo_holder_hole_pos[1], servo_holder_size[2]])
        rotate([180, 0, 0]) bolt1(_l_bolt_size, leg_alpha);
    translate([servo_size[1]/2 + servo_holder_hole_pos[0], -servo_holder_hole_pos[1], servo_holder_size[2]])
        rotate([180, 0, 0]) bolt1(_l_bolt_size, leg_alpha);
    
    translate([-(servo_size[0] - servo_size[1]/2 + servo_holder_hole_pos[0]), servo_holder_hole_pos[1], servo_holder_size[2]])
        rotate([180, 0, 0]) bolt1(_l_bolt_size, leg_alpha);
    translate([-(servo_size[0] - servo_size[1]/2 + servo_holder_hole_pos[0]), -servo_holder_hole_pos[1], servo_holder_size[2]])
        rotate([180, 0, 0]) bolt1(_l_bolt_size, leg_alpha);
}

//leg();