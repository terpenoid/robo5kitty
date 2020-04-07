include <dimensions1.scad>;
include <servo1.scad>;
include <bolt1.scad>;
include <femur1.scad>;

module coxa(coxa_alpha) {
    
    // translate([0, 0, -(servo_holder_h - servo_size[2]/2)]) rotate([0, 0, 180]) servo(0.7);
    
    // coxa holder + servo + femur
    _coxa_main_h = servo_size[2] - servo_holder_h - servo_size[1]/2 + servo_air_space;
    translate([0, 0, _coxa_main_h]) {
    
        translate([coxa, 0, 0]) {
            rotate([90, 90, 0]) servo(0.7);
            rotate([0, femur_angle, 0]) femur(coxa_alpha);
        }
        
                _coxa_holder1_h = servo_size[0] + servo_holder_size[0] * 2;
        _coxa_holder1_w = servo_size[1] + coxa_holder_thickness * 2;
        
        _coxa_holder1_corrections = [1, 3, 8];
        
        // main poly
        _ca0 = [[0, 0],
        
                // [0, _coxa_holder1_corrections[0]],
                [-_coxa_holder1_corrections[2], _coxa_holder1_corrections[0]],
                [-_coxa_holder1_corrections[2], _coxa_holder1_h - _coxa_holder1_corrections[1]],
                // [0, _coxa_holder1_h - _coxa_holder1_corrections[1]],
        
                [0, _coxa_holder1_h], [_coxa_holder1_w, _coxa_holder1_h], [_coxa_holder1_w, 0], [0, 0]];
        
        //_cb0 = [0, 1, 2, 3, 4, 5, 6, 7, 8];
        _cb0 = [0, 1, 2, 3, 4, 5, 6];
        
        // hole 1 poly
        _ca1 = [[tibia_holder_thickness - air_space, servo_holder_size[0] - air_space],
                [tibia_holder_thickness - air_space, _coxa_holder1_h - servo_holder_size[0] + air_space],
                [_coxa_holder1_w - coxa_holder_thickness + air_space, _coxa_holder1_h - servo_holder_size[0] + air_space],
                [_coxa_holder1_w - coxa_holder_thickness + air_space, servo_holder_size[0] - air_space]];
        //_cb1 = [9, 10, 11, 12];
        _cb1 = [7, 8, 9, 10];
        
        _ca  = concat (_ca0, _ca1);
        _cb  = [_cb0, _cb1];
        
        _c_holder_pos_y = servo_holder_h - servo_size[2] / 2;

        color("green", coxa_alpha) {
        
            translate([coxa - servo_size[1]/2 - coxa_holder_thickness,
                -(_c_holder_pos_y - material_thickness),
                -(servo_size[0] - servo_size[1]/2 + servo_holder_size[0])])
                rotate([90, 0, 0])
                    linear_extrude(material_thickness)
                        polygon(_ca, _cb);
            
            translate([coxa - servo_size[1]/2 - coxa_holder_thickness,
                _c_holder_pos_y,
                -(servo_size[0] - servo_size[1]/2 + servo_holder_size[0])])
                rotate([90, 0, 0])
                    linear_extrude(material_thickness)
                        polygon(_ca, _cb);
            
        }
        
        
        _c_holder_w = coxa - air_space;
        _c_holder_points = [[0, -servo_size[1]/2], [0, servo_size[1]/2],
                [_c_holder_w, servo_size[1]/2],
                
                [_c_holder_w, _c_holder_pos_y],
                [_c_holder_w - (_coxa_holder1_corrections[2] + coxa_holder_thickness - air_space), _c_holder_pos_y],
                [_c_holder_w - (_coxa_holder1_corrections[2] + coxa_holder_thickness - air_space), _c_holder_pos_y - material_thickness],
                [_c_holder_w, _c_holder_pos_y - material_thickness],
                
                [_c_holder_w, -(_c_holder_pos_y - material_thickness)],
                [_c_holder_w - (_coxa_holder1_corrections[2] + coxa_holder_thickness - air_space), -(_c_holder_pos_y - material_thickness)],
                [_c_holder_w - (_coxa_holder1_corrections[2] + coxa_holder_thickness - air_space), -_c_holder_pos_y],
                [_c_holder_w, -_c_holder_pos_y],
                
                [_c_holder_w, -servo_size[1]/2]];
        
        color("blue", coxa_alpha) {
            translate([-servo_size[1]/2, 0, servo_size[1]/2])
                linear_extrude(material_thickness) polygon(_c_holder_points);
            
            translate([-servo_size[1]/2, 0, servo_size[1]/2 - servo_size[2] - material_thickness - servo_air_space*2])
                linear_extrude(material_thickness) polygon(_c_holder_points);
        }
        
        
        
        // bolts1
        _c_bolt_size1 = _c_holder_pos_y * 2 + servo_holder_size[2];
        
        translate([coxa - servo_holder_hole_pos[1],
                -(_c_holder_pos_y + servo_holder_size[2]),
                servo_size[1]/2 + servo_holder_hole_pos[0]])
            rotate([-90, 0, 0]) bolt1(_c_bolt_size1, coxa_alpha);
        
        translate([coxa + servo_holder_hole_pos[1],
                -(_c_holder_pos_y + servo_holder_size[2]),
                servo_size[1]/2 + servo_holder_hole_pos[0]])
            rotate([-90, 0, 0]) bolt1(_c_bolt_size1, coxa_alpha);
        
        translate([coxa - servo_holder_hole_pos[1],
                -(_c_holder_pos_y + servo_holder_size[2]),
                -(servo_size[0] - servo_size[1]/2 + servo_holder_hole_pos[0])])
            rotate([-90, 0, 0]) bolt1(_c_bolt_size1, coxa_alpha);
        
        translate([coxa + servo_holder_hole_pos[1],
                -(_c_holder_pos_y + servo_holder_size[2]),
                -(servo_size[0] - servo_size[1]/2 + servo_holder_hole_pos[0])])
            rotate([-90, 0, 0]) bolt1(_c_bolt_size1, coxa_alpha);
        
        

        
    }
    
    
    
}

// coxa();





