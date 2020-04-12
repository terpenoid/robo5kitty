include <dimensions2.scad>;

include <servo2.scad>;
include <coxa2.scad>;


module leg(leg_alpha) {
    translate([0, 0, -8]) {
        rotate([0, 0, 180]) servo(0.7);
        coxa(leg_alpha);
    }
}

//leg();