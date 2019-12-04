/*
 * BenchPSU v2 case to fit DPS800GB A
 * ==================================
 * CC-BY-SA
 *
 * Thomas Flummer, tf@hackmeister.dk
 *
 */


module rounded_edge(radius, length)
{
    difference()
    {
        translate([-(radius+1)/2+1, -(radius+1)/2+1, length/2])
            cube([radius+1, radius+1, length], center = true);
        translate([-radius, -radius, length/2-0.5])
            cylinder(r = radius, h = length+4, center = true, $fn = radius*20);
    }
}

module benchtop_psu_v2_front()
{
    difference()
    {
        union()
        {
            minkowski()
            {
                translate([0, 0, (40+6)/2])
                    cube([54, 104, 40], center = true);
                
                sphere(r = 3, $fn = 60);
            }

            difference()
            {
                translate([0, (104-87)/2, (40+3)+20/2])
                    cube([54+3*2, 87+3*2, 20], center = true);

                translate([54/2+3, (104-87)/2-(87/2+3), 40])
                rotate(-90, [0, 0, 1])
                    rounded_edge(3, 30);

                translate([-(54/2+3), (104-87)/2-(87/2+3), 40])
                rotate(180, [0, 0, 1])
                    rounded_edge(3, 30);

                translate([54/2+3, (104-87)/2+(87/2+3), 40])
                rotate(0, [0, 0, 1])
                    rounded_edge(3, 30);

                translate([-(54/2+3), (104-87)/2+(87/2+3), 40])
                rotate(90, [0, 0, 1])
                    rounded_edge(3, 30);

            }
            
            minkowski()
            {
                difference()
                {
                    translate([0, -(104+3*2)/2+15, (40+3)/2])
                    rotate(90, [0, 1, 0])
                        cylinder(r = (60)/2, h = 54, center = true, $fn = 150);
                    
                    translate([0, -30, -50/2+3])
                        cube([100, 100, 50], center = true);
                }
                
                sphere(r = 3, $fn = 60);
            }
        }
        union()
        {
            difference()
            {
                translate([0, 0, (40+3)/2+3/2])
                    cube([54, 104, 40.1], center = true);
            
                // button support
                difference()
                {
                    translate([54/2-32, 104/2-32, 5/2+2])
                        cylinder(r = 8/2, h = 5, center = true, $fn = 30);
                    
                    translate([54/2-32, 104/2-32+5+3, 5/2+2])
                        cube([10, 10, 6], center = true);
                }
            }

            translate([0, (104-87)/2, (40+3)+20/2])
                cube([54, 87, 20.1], center = true);

            difference()
            {
                translate([0, -(104+3*2)/2+15, (40+3)/2])
                rotate(90, [0, 1, 0])
                    cylinder(r = (60+3)/2-3, h = 54, center = true, $fn = 80);
                
                translate([0, -30, -50/2+3])
                    cube([100, 100, 50], center = true);
            }
    
            // display
            translate([54/2-32, 104/2-13.5, 0])
                cube([25, 14, 10], center = true);

            translate([54/2-32, 104/2-13.5, -2])
            difference()
            {
                cube([25+4, 14+4, 10], center = true);

                translate([0, (14+4)/2, 10/2])
                rotate(45, [1, 0, 0])
                    cube([30, 5, 5], center = true);

                translate([0, -(14+4)/2, 10/2])
                rotate(45, [1, 0, 0])
                    cube([30, 5, 5], center = true);

                translate([(25+4)/2, 0, 10/2])
                rotate(45, [0, 1, 0])
                    cube([5, 30, 5], center = true);

                translate([-(25+4)/2, 0, 10/2])
                rotate(45, [0, 1, 0])
                    cube([5, 30, 5], center = true);
            }
            
            // button
            translate([54/2-32, 104/2-32, 0])
                cylinder(r = 4/2, h = 20, center = true, $fn = 30);

            // 3v3
            translate([54/2-22.5, 104/2-51, 0])
                cylinder(r = 6/2, h = 20, center = true, $fn = 30);

            translate([54/2-41.5, 104/2-51, 0])
                cylinder(r = 6/2, h = 20, center = true, $fn = 30);

            // 5v0
            translate([54/2-22.5, 104/2-71, 0])
                cylinder(r = 6/2, h = 20, center = true, $fn = 30);

            translate([54/2-41.5, 104/2-71, 0])
                cylinder(r = 6/2, h = 20, center = true, $fn = 30);

            // 12v
            translate([54/2-22.5, 104/2-91, 0])
                cylinder(r = 6/2, h = 20, center = true, $fn = 30);

            translate([54/2-41.5, 104/2-91, 0])
                cylinder(r = 6/2, h = 20, center = true, $fn = 30);
            
            // 64 pin connector cutout
            translate([54/2-15/2, 104/2-5/2+1.5, 32/2+3])
                cube([15, 5, 32], center = true);

            translate([54/2-15/2, 104/2-5/2+1.5, 32+3])
            rotate(45, [1, 0, 0])
                cube([15, 5*sqrt(2)/2, 5*sqrt(2)/2], center = true);


            // programming
            translate([-54/2-3/2, 104/2-21, 6+3+1])
                cube([4, 16, 3], center = true);

            // ventilation
            for(i = [3 : 11])
            {
                translate([-54/2-3/2, 40-i*8, 3+3+20/2])
                rotate(-9, [1, 0, 0])
                union()
                {
                        cube([4, 3, 20], center = true);

                    translate([0, 0, 20/2])
                    rotate(45, [1, 0, 0])
                        cube([4, 3*sqrt(2)/2, 3*sqrt(2)/2], center = true);
                }

            }

            for(i = [0 : 11])
            {
                translate([54/2+3/2, 40-i*8, 3+3+20/2])
                rotate(-9, [1, 0, 0])
                union()
                {
                        cube([4, 3, 20], center = true);

                    translate([0, 0, 20/2])
                    rotate(45, [1, 0, 0])
                        cube([4, 3*sqrt(2)/2, 3*sqrt(2)/2], center = true);
                }

            }
            
            // screw holes (right side)
            translate([-54/2-3/2, (104-87)/2+63/2, 40+3])
            rotate(90, [0, 1, 0])
                cylinder(r = 4/2, h = 10, center = true, $fn = 30);

            translate([-54/2-3/2-1.2, (104-87)/2+63/2, 40+3])
            rotate(-90, [0, 1, 0])
                cylinder(r1 = 4/2, r2 = 7/2, h = 2, center = true, $fn = 30);

            translate([-54/2-3/2, (104-87)/2-63/2, 40+3])
            rotate(90, [0, 1, 0])
                cylinder(r = 4/2, h = 10, center = true, $fn = 30);

            translate([-54/2-3/2-1.2, (104-87)/2-63/2, 40+3])
            rotate(-90, [0, 1, 0])
                cylinder(r1 = 4/2, r2 = 7/2, h = 2, center = true, $fn = 30);

            // screw holes (left side)
            translate([54/2+3/2, (104-87)/2+69/2, 40+3-1.5])
            rotate(90, [0, 1, 0])
                cylinder(r = 4/2, h = 10, center = true, $fn = 30);

            translate([54/2+3/2+1.2, (104-87)/2+69/2, 40+3-1.5])
            rotate(90, [0, 1, 0])
                cylinder(r1 = 4/2, r2 = 7/2, h = 2, center = true, $fn = 30);

            translate([54/2+3/2, (104-87)/2-69/2, 40+3-1.5])
            rotate(90, [0, 1, 0])
                cylinder(r = 4/2, h = 10, center = true, $fn = 30);

            translate([54/2+3/2+1.2, (104-87)/2-69/2, 40+3-1.5])
            rotate(90, [0, 1, 0])
                cylinder(r1 = 4/2, r2 = 7/2, h = 2, center = true, $fn = 30);
        }
    }
}

module button()
{
    union()
    {
        translate([0, 0, 12/2])
            cylinder(r = 3.5/2, h = 12, center = true, $fn = 35);

        translate([0, 0, 2.4/2])
            cylinder(r = 6/2, h = 2.4, center = true, $fn = 35);

    }
}

module psu()
{
    color([0.9, 0.9, 0.9])
        cube([54, 87, 215], center = true);
}

    benchtop_psu_v2_front();
    
//    button();


// mockup
/*
rotate(99, [1, 0, 0])
    color([1, 0, 0])
    benchtop_psu_v2_front();

rotate(99, [1, 0, 0])
    translate([54/2-32, 104/2-32, 10.3])
    rotate(180, [1, 0, 0])
    color([0, 0, 0])
    button();


rotate(99, [1, 0, 0])
translate([0, (104-87)/2, 215/2+32+3])
    psu();
*/