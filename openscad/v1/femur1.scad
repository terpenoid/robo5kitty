include <dimensions1.scad>;
include <servo1.scad>;
include <bolt1.scad>;
include <tibia1.scad>;

module femur(femur_alpha) {
    
    //rotate([90, 90, 0]) servo(0.7);
    
    translate([femur, 0, 0]) rotate([0, tibia_angle, 0]) tibia(femur_alpha);

    _femur_w = femur + servo_size[1];
    
    color("HotPink", femur_alpha) {
        translate([-servo_size[1]/2, -(servo_size[2]/2 + material_thickness + servo_air_space), -servo_size[1]/2])
            cube([_femur_w, material_thickness, servo_size[1]]);
        
        translate([-servo_size[1]/2, (servo_size[2]/2 + servo_air_space), -servo_size[1]/2])
            cube([_femur_w, material_thickness, servo_size[1]]);
        
        translate([femur/2 - 5, -(servo_size[2]/2 + servo_air_space), -servo_size[1]/2])
            cube([10, servo_size[2] + servo_air_space * 2, servo_size[1]]);
    }
    
    
}


//femur();