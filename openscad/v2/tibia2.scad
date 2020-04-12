include <dimensions2.scad>;
include <servo2.scad>;

module tibia(tibia_alpha) {
    
    /*
    translate([0, -material_thickness/2, 0]) rotate([90, 180, 0]) servo(0.7);
    translate([-60, servo_size[2]/2 - material_thickness/2, -10]) cube([70, material_thickness, 20]);
    */




    _t_w1 = 50;
    _t_w2 = 30;
    _t_a1 = 60; // real angle
    
    _t_a2 = (180 - _t_a1)/2; // inside angle / 2
    _t_d1 = servo_size[1] / tan(_t_a2); // delta width related to angle
    
    _t_points1 = [[0, -servo_size[1]/2],
                    [0, servo_size[1]/2],
                    [_t_w1 + _t_d1/2, servo_size[1]/2],
    
                    [(_t_w1 + _t_d1/2) + (cos(_t_a1) * (_t_w2 + _t_d1/2)), servo_size[1]/2 - (sin(_t_a1) * (_t_w2 + _t_d1/2))],
                    [(_t_w1 - _t_d1/2) + (cos(_t_a1) * (_t_w2 - _t_d1/2)), -servo_size[1]/2 - (sin(_t_a1) * (_t_w2 - _t_d1/2))],
    
                    [_t_w1 - _t_d1/2, -servo_size[1]/2]];
    
    
    _t_h1 = (servo_size[2] + material_thickness)/2 + servo_air_space;
    
    color("green", tibia_alpha) {
        translate([-servo_size[1]/2, -_t_h1, 0])
            rotate([90, 0, 0]) linear_extrude(material_thickness) polygon(_t_points1);
        
        translate([-servo_size[1]/2, _t_h1 + material_thickness, 0])
            rotate([90, 0, 0]) linear_extrude(material_thickness) polygon(_t_points1);
    }
    
    
    
    
    
    _t_w3 = 120;
    _t_h2 = _t_h1 + material_thickness;
    _t_a3 = 60;
    
    _t_points2 = [[0, -_t_h2],
                    [0, _t_h2], 
                    [_t_w3 - _t_h2 * tan(_t_a3), _t_h2],
                    [_t_w3, 0], 
                    [_t_w3 - _t_h2 * tan(_t_a3), -_t_h2]];
 
    _t_x2 = (_t_points1[2][0]+_t_points1[5][0])/2 - servo_size[1]/2;
    _t_z2 = (_t_points1[2][1]+_t_points1[5][1])/2 - material_thickness/2;
    
    color("blue", tibia_alpha)
        translate([_t_x2, 0, _t_z2])
            rotate([0, _t_a1, 0])
            //rotate([0, 0, 0])
                linear_extrude(material_thickness) polygon(_t_points2);
 
}

//rotate([0, -34, 0]) 
//tibia();