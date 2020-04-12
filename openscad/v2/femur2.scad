include <dimensions2.scad>;

include <servo2.scad>;
include <tibia2.scad>;




module femur(femur_alpha) {
    
    translate([femur, 0, 0]) rotate([0, tibia_angle, 0]) tibia(femur_alpha);
    
    translate([0, -material_thickness/2, 0]) rotate([90, 0, 0]) servo(0.7);
    translate([femur, -material_thickness/2, 0]) rotate([90, 180, 0]) servo(0.7);
    
    
    
    _f_w1 = femur + servo_size[1] + servo_holder_size[0] * 2;
    
    translate([-(servo_size[1]/2 + servo_holder_size[0]),
            servo_size[2]/2 - material_thickness/2,
            -servo_size[1]/2])
            cube([_f_w1, material_thickness, 20]);
    
    
    _f_h2 = servo_size[1] + femur_holder_thickness * 2;

    _f_points1 = [[0, 0],
                    [0, _f_h2],
                    [_f_w1, _f_h2],
                    [_f_w1, 0]];
                    
    color("blue", femur_alpha)
        translate([-(servo_size[1]/2 + servo_holder_size[0]),
                    -(servo_holder_h - servo_size[2]/2 - material_thickness/2),
                    -_f_h2/2])
            rotate([90, 0, 0]) linear_extrude(material_thickness) polygon(_f_points1);
    

}

// femur();