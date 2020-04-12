include <dimensions2.scad>;
include <servo2.scad>;
include <bolt2.scad>;
include <leg2.scad>;


    _body_d1 = 100;
    _body_d2 = 90; // _body_d1 - servo_size[2] - servo_holder_size[0];
    
    _body_holder_w_b = servo_size[2] + servo_holder_size[0]*2;
    _body_holder_w_s = servo_size[2] + air_space*2;
    
    _body_holder_h_b = servo_size[1] + body_holder_thickness*2;
    _body_holder_h_s = servo_size[1] + air_space*2;

    _b_a0 = [ [-_body_holder_h_b/2, -_body_d1], [-_body_holder_h_b/2, -_body_d2],
            
            [-_body_d2, -_body_holder_h_b/2], [-_body_d1, -_body_holder_h_b/2],
            [-_body_d1, _body_holder_h_b/2], [-_body_d2, _body_holder_h_b/2], 
            
            [-_body_holder_h_b/2, _body_d2], [-_body_holder_h_b/2, _body_d1],
            [_body_holder_h_b/2, _body_d1], [_body_holder_h_b/2, _body_d2], 
            
            [_body_d2, _body_holder_h_b/2], [_body_d1, _body_holder_h_b/2],
            [_body_d1, -_body_holder_h_b/2], [_body_d2, -_body_holder_h_b/2], 
            
            [_body_holder_h_b/2, -_body_d2], [_body_holder_h_b/2, -_body_d1] ];
    
    
    _b_b0 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    
    // hole 1 poly
    _b_a1 = [ [-_body_holder_h_s/2, -(_body_d1-servo_holder_size[0])],
            [-_body_holder_h_s/2, -(_body_d1-servo_holder_size[0] - _body_holder_w_s)], 
            [_body_holder_h_s/2, -(_body_d1-servo_holder_size[0] - _body_holder_w_s)],
            [_body_holder_h_s/2, -(_body_d1-servo_holder_size[0])] ];
    _b_b1 = [16, 17, 18, 19];
    
    // hole 2 poly
    _b_a2 = [ [-(_body_d1-servo_holder_size[0]), -_body_holder_h_s/2],
            [-(_body_d1-servo_holder_size[0]), _body_holder_h_s/2],
            [-(_body_d1-servo_holder_size[0] - _body_holder_w_s), _body_holder_h_s/2],
            [-(_body_d1-servo_holder_size[0] - _body_holder_w_s), -_body_holder_h_s/2] ];
    _b_b2 = [20, 21, 22, 23];
    
    // hole 3 poly
    _b_a3 = [ [-_body_holder_h_s/2, (_body_d1-servo_holder_size[0])],
            [-_body_holder_h_s/2, (_body_d1-servo_holder_size[0] - _body_holder_w_s)], 
            [_body_holder_h_s/2, (_body_d1-servo_holder_size[0] - _body_holder_w_s)],
            [_body_holder_h_s/2, (_body_d1-servo_holder_size[0])] ];
    _b_b3 = [24, 25, 26, 27];
    
    // hole 4 poly
    _b_a4 = [ [(_body_d1-servo_holder_size[0]), -_body_holder_h_s/2],
            [(_body_d1-servo_holder_size[0]), _body_holder_h_s/2],
            [(_body_d1-servo_holder_size[0] - _body_holder_w_s), _body_holder_h_s/2],
            [(_body_d1-servo_holder_size[0] - _body_holder_w_s), -_body_holder_h_s/2] ];
    _b_b4 = [28, 29, 30, 31];
    
    
    
    _b_a  = concat (_b_a0, _b_a1, _b_a2, _b_a3, _b_a4);
    _b_b  = [_b_b0, _b_b1, _b_b2, _b_b3, _b_b4];
    
    color("gold")
        translate([0, 0, 0])
            rotate([0, 0, 0])
                linear_extrude(material_thickness)
                    polygon(_b_a, _b_b);
   
   
   
   
  /* 
   _b_poins_down = [ [-_body_holder_h_b/2, -_body_d1], [-_body_holder_h_b/2, -_body_d2],
            
            [-_body_d2, -_body_holder_h_b/2], [-_body_d1, -_body_holder_h_b/2],
            [-_body_d1, _body_holder_h_b/2], [-_body_d2, _body_holder_h_b/2], 
            
            [-_body_holder_h_b/2, _body_d2], [-_body_holder_h_b/2, _body_d1],
            [_body_holder_h_b/2, _body_d1], [_body_holder_h_b/2, _body_d2], 
            
            [_body_d2, _body_holder_h_b/2], [_body_d1, _body_holder_h_b/2],
            [_body_d1, -_body_holder_h_b/2], [_body_d2, -_body_holder_h_b/2], 
            
            [_body_holder_h_b/2, -_body_d2], [_body_holder_h_b/2, -_body_d1] ];
   
   color("gold")
        translate([0, 0, -(servo_holder_h + material_thickness + servo_air_space)])
            rotate([0, 0, 0])
                linear_extrude(material_thickness)
                    polygon(_b_poins_down);
   */
   
   
   
   //////////////
   
    translate([_body_d1 - servo_size[1]/2 - servo_holder_size[0] - air_space, 0, material_thickness])
        rotate([0, 0, 0]) leg(0.7);
   
    translate([-(_body_d1 - servo_size[1]/2 - servo_holder_size[0] - air_space), 0, material_thickness])
        rotate([0, 0, 180]) leg(0.7);
        
    translate([0, _body_d1 - servo_size[1]/2 - servo_holder_size[0] - air_space, material_thickness])
        rotate([0, 0, 90]) leg(0.7);
        
    translate([0, -(_body_d1 - servo_size[1]/2 - servo_holder_size[0] - air_space), material_thickness])
        rotate([0, 0, -90]) leg(0.7);
   
   
         