include <dimensions2.scad>;

module servo(servo_alpha) {
    
    union() {
    
        //body
        color("gray", servo_alpha)
            translate([-servo_size[1] / 2, -servo_size[1] / 2, -servo_size[2] / 2])
                cube(servo_size);
        
        
        // holder
        difference() {

            // holder plate
            _holder_pos_z = servo_holder_h - servo_size[2] / 2;
            _holder_size_w = servo_size[0] + servo_holder_size[0] * 2;
            color("red", servo_alpha)
                translate([-(servo_size[1] / 2 + servo_holder_size[0]),
                        -servo_holder_size[1] / 2,
                        _holder_pos_z])
                    cube([_holder_size_w, servo_holder_size[1], servo_holder_size[2]]);
            
            
            // holder holes
            _hole_pos_x1 = -(servo_size[1] / 2 + servo_holder_hole_pos[0]);
            _hole_pos_x2 = servo_size[0] -servo_size[1] / 2 + servo_holder_hole_pos[0];
            _hole_pos_z = (servo_holder_h - servo_size[2] / 2) - 1; // "-1" - correction for hole
            _hole_h = servo_holder_size[2] + 2; // "2=1*2" - correction for hole
            color("green", servo_alpha) {
                translate([_hole_pos_x1, -servo_holder_hole_pos[1], _hole_pos_z])
                    cylinder(h = _hole_h, r = servo_holder_hole_radius);
                translate([_hole_pos_x1, servo_holder_hole_pos[1], _hole_pos_z])
                    cylinder(h = _hole_h, r = servo_holder_hole_radius);
                
                translate([_hole_pos_x2, -servo_holder_hole_pos[1], _hole_pos_z])
                    cylinder(h = _hole_h, r = servo_holder_hole_radius);
                translate([_hole_pos_x2, servo_holder_hole_pos[1], _hole_pos_z])
                    cylinder(h = _hole_h, r = servo_holder_hole_radius);
            }
            
        }
        
        // pin
        color("gold", servo_alpha)
            translate([0, 0, servo_size[2]/2 - 1]) // "-1" - correction for intersection
                cylinder(h = servo_pin_hight + 1, r = servo_pin_radius); // "+1" - correction for intersection
        
    }

}

//servo(0.5);