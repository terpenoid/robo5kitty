include <dimensions2.scad>;

include <servo2.scad>;
include <femur2.scad>;


//coxa_angle = 0;
//femur_angle = -95;
//tibia_angle = 120;


module coxa(coxa_alpha) {
    
    //translate([0, 0, 0]) rotate([0, 0, 180]) servo(0.7);
    
    
    translate([coxa, 0, 0]) rotate([0, femur_angle, 0]) femur(coxa_alpha);
    
    
    
    _c_h1 = (servo_size[2] + material_thickness)/2 + servo_air_space;
    _c_h2 = servo_size[2] + servo_air_space * 2 + material_thickness * 2 + 5; ///////
    
    _c_points1 = [[0, _c_h2/2],
                    [15, _c_h2/2],
                    [40, _c_h2/2 - (_c_h2-servo_size[1])/2],
                    [40, -(_c_h2/2 - (_c_h2-servo_size[1])/2)],
                    [15, -_c_h2/2],
                    [0, -_c_h2/2],
    
                    [0, -_c_h2/2 + 8],
                    [20, 0],
                    [0, _c_h2/2 - 8]];
    color("green", coxa_alpha) {
        translate([20, -_c_h1, 0])
            rotate([90, 0, 0]) linear_extrude(material_thickness) polygon(_c_points1);
        translate([20, _c_h1 + material_thickness, 0])
            rotate([90, 0, 0]) linear_extrude(material_thickness) polygon(_c_points1);
    }
    
    
    
    _c_points2 = [[-servo_size[1]/2, -servo_size[1]/2],
                    [-servo_size[1]/2, servo_size[1]/2],
                    [20, _c_h1 + material_thickness],
                    [30, _c_h1 + material_thickness],
    
                    [30, _c_h1],
                    [10, 0],
                    [30, -_c_h1],
    
                    [30, -_c_h1 - material_thickness],
                    [20, -_c_h1 - material_thickness]];
    
    color("blue", coxa_alpha) {
        translate([0, 0, servo_size[2]/2 + servo_air_space])
            linear_extrude(material_thickness) polygon(_c_points2);
        translate([0, 0, -(servo_size[2]/2 + material_thickness + servo_air_space)])
            linear_extrude(material_thickness) polygon(_c_points2);
    }
    
}

// coxa();


