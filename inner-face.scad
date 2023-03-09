//! Entrypoint for an inner face plate with logo for inserting into the hollow side of the the main keychain body.

// Intersection will only keep the volumn of objects where all objects exists in the same space.
intersection () {
    // Union will combine all contained objects into a single object.
    union () {
        // Move the logo up 2mm along the z-axis.
        translate([0, 0, 2])

        // Apply the code in the logo file to show the logo.
        include <./components/logo.scad>

        // Apply the code in the ring file to show the whole ring body.
        include <./components/ring.scad>
    };

    // Extrude the inner body up by 8mm.
    // Any number greater than the height of the above object can be used.
    // A number exactly the same may leave a 0 width surface that will confuse object slicers for 3D printing.
    // Center being true effectively extrudes half the height in both directions from the middle of that height.
    linear_extrude(height = 8, center = true)

    // Draw a circle with a diameter of 25mm (same space as the inner diamater of the keychain body).
    // This dictates the overall width of inner piece that must fit snugly into the main body.
    circle(d = 25);
}
