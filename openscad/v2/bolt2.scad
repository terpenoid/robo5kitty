include <dimensions2.scad>;




module bolt1(width, bolt_alpha) {
    
    _bolt1_r1 = 1.5;
    _bolt1_r2 = 3;
    _bolt1_r3 = 3.2;
    
    _bolt1_h1 = 3;
    _bolt1_h2 = 2;
    _bolt1_h3 = 3;
   
    
    color("Peru", bolt_alpha) {
        cylinder(h = width + _bolt1_h2 + _bolt1_h3, r = _bolt1_r1);
        
        difference() {
            translate([0, 0, -_bolt1_h1]) cylinder(h = _bolt1_h1, r = _bolt1_r2);
            translate([0, 0, -_bolt1_h1-1]) cylinder(h = _bolt1_h1/2+1, r = _bolt1_r2/1.7, $fn = 6);
        }
        
        translate([0, 0, width]) cylinder(h = _bolt1_h2, r = _bolt1_r3, $fn = 6);
    }
    
}

 //bolt1(30);