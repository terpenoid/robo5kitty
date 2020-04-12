include <dimensions1.scad>;
include <servo1.scad>;

module servo2(servo_alpha) {
    
        //translate([0, 0, material_thickness])
        servo(servo_alpha);
            
        _holder_size_w = servo_size[0] + servo_holder_size[0] * 2;
        color("red", servo_alpha)
            translate([-(servo_size[1] / 2 + servo_holder_size[0]),
                    -servo_holder_size[1] / 2,
                    -(servo_size[2] / 2 )])
                cube([_holder_size_w, servo_size[1], material_thickness]);
        


}

servo2(0.5);