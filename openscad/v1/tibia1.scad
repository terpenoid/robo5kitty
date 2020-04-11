include <dimensions1.scad>;
include <servo1.scad>;
include <bolt1.scad>;

module tibia(tibia_alpha) {
    
    rotate([90, 0, 0]) servo(0.7);
    
    
    // main poly
    _tibia_h0 = servo_size[1] + tibia_holder_thickness * 2;
    _tibia_h1 = 17;
    _tibia_w1 = 110;
    _tibia_w2 = 10;
    
    a0 = [[0, 0], [-10, _tibia_h0/2], [0, _tibia_h0],
            [servo_size[0] + servo_holder_size[0] * 2, _tibia_h0],
            [_tibia_w1, _tibia_h0-(_tibia_h0-_tibia_h1)/2],
            [_tibia_w1, (_tibia_h0-_tibia_h1)/2],
            [servo_size[0] + servo_holder_size[0] * 2, 0]];     
    b0 = [0, 1, 2, 3, 4, 5, 6];
    
    // hole 1 poly
    a1 = [[servo_holder_size[0] - air_space, tibia_holder_thickness - air_space],
            [servo_holder_size[0] - air_space, tibia_holder_thickness + servo_size[1] + air_space],
            [servo_size[0] + servo_holder_size[0] + air_space, tibia_holder_thickness + servo_size[1] + air_space],
            [servo_size[0] + servo_holder_size[0] + air_space, tibia_holder_thickness - air_space]];
    b1 = [7, 8, 9, 10];
    
    // hole 2 poly
    _hole2_h1 = 7;
    a2 = [[servo_size[0] + servo_holder_size[0] * 2, _hole2_h1],
            [servo_size[0] + servo_holder_size[0]*2, _tibia_h0 - _hole2_h1],
            [_tibia_w1 - _tibia_w2, _tibia_h0-(_tibia_h0-_tibia_h1)/2 - 5],
            [_tibia_w1 - _tibia_w2, (_tibia_h0-_tibia_h1)/2 + 5]];            
    b2 = [11, 12, 13, 14];
    
    a  = concat (a0, a1, a2);
    b  = [b0, b1, b2];
    
    _holder_pos_y = servo_holder_h - servo_size[2] / 2;
    
    
    color("green", tibia_alpha) {
        // plate1.1
        translate([-(servo_size[1]/2 + servo_holder_size[0]),
            -(_holder_pos_y - material_thickness),
            -_tibia_h0/2])
            rotate([90, 0, 0])
                linear_extrude(material_thickness)
                    polygon(a, b);
        
        // plate1.2
        translate([-(servo_size[1]/2 + servo_holder_size[0]), _holder_pos_y, -_tibia_h0/2])
            rotate([90, 0, 0])
                linear_extrude(material_thickness)
                    polygon(a, b);
    }
        
    
    // bolts1
    _bolt_size1 = _holder_pos_y * 2 + servo_holder_size[2];
    
    translate([-(servo_size[1]/2 + servo_holder_hole_pos[0]),
            -(_holder_pos_y + servo_holder_size[2]),
            servo_holder_hole_pos[1]])
        rotate([-90, 0, 0]) bolt1(_bolt_size1, tibia_alpha);
        
    translate([-(servo_size[1]/2 + servo_holder_hole_pos[0]),
            -(_holder_pos_y + servo_holder_size[2]),
            -servo_holder_hole_pos[1]])
        rotate([-90, 0, 0]) bolt1(_bolt_size1, tibia_alpha);
    
    translate([servo_size[0] - servo_size[1]/2 + servo_holder_hole_pos[0],
            -(_holder_pos_y + servo_holder_size[2]),
            servo_holder_hole_pos[1]])
        rotate([-90, 0, 0]) bolt1(_bolt_size1, tibia_alpha);
        
    translate([servo_size[0] - servo_size[1]/2 + servo_holder_hole_pos[0],
            -(_holder_pos_y + servo_holder_size[2]),
            -servo_holder_hole_pos[1]])
        rotate([-90, 0, 0]) bolt1(_bolt_size1, tibia_alpha);
        
        
    // end of tibia
    _end_points = [[0, 0], [0, _tibia_h1], [10, _tibia_h1], [90, -45], [90, -50], [10, 0]];
    _end_pos_x = _tibia_w1 - servo_size[1]/2 - servo_holder_size[0] - _tibia_w2;
    color("blue", tibia_alpha) {
        translate([_end_pos_x, -(_holder_pos_y - material_thickness*2), -_tibia_h1/2])
            rotate([90, 0, 0]) linear_extrude(material_thickness) polygon(_end_points);
        translate([_end_pos_x, (_holder_pos_y - material_thickness), -_tibia_h1/2])
            rotate([90, 0, 0]) linear_extrude(material_thickness) polygon(_end_points);
    }
    
    
    echo();
    echo();
    
    pos_of_end = [_end_pos_x + 90.13, 50];
    tibia_w = sqrt( pow(pos_of_end[0], 2) + pow(pos_of_end[1], 2) );
    echo(tibia_w);
    
    echo();
    echo();
    
    
    // bolts2
    _bolt_size2 = _holder_pos_y * 2;
    
    translate([_end_pos_x + _tibia_w2/2,
            -(_holder_pos_y),
            -servo_holder_hole_pos[1]])
        rotate([-90, 0, 0]) bolt1(_bolt_size2, tibia_alpha);
    
    translate([_end_pos_x + _tibia_w2/2,
            -(_holder_pos_y),
            servo_holder_hole_pos[1]])
        rotate([-90, 0, 0]) bolt1(_bolt_size2, tibia_alpha);
        
        
        
}

 //tibia();