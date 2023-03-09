//! Keychain Mount for attachment of rings or chains.

difference() {
    // First make a cylinder.

    // Move the panel up the y-axis by 16.5mm so that this is on the top outer edge of the main body.
    translate([0, 16.5, 0])

    // Extrude the panel up 3mm.
    // Center being true effectively extrudes half the height in both directions from the middle of that height.
    linear_extrude(height = 3, center = true)

    // Draw a circle with a diameter of 8mm.
    circle(d = 8);

    // The semi colon above ends this object, which is just the body.
    // All following objects will remove from the above object instead of drawing more new objects.

    // Next hollow out the cylinder.

    // Move the panel up the y-axis by 16.5mm so that this is on the top outer edge of the main body.
    // Same area as the above cylinder.
    translate([0, 16.5, 0])

    // Extrude the panel up 3mm.
    // Any number greater than the height of the above object can be used.
    // A number exactly the same as 3mm may leave a 0 width surface that will confuse object slicers for 3D printing.
    // Center being true effectively extrudes half the height in both directions from the middle of that height.
    linear_extrude(height = 6, center = true)

    // Draw a circle with a diameter of 5mm so that the keychain mount has a solid thickness of 3mm for strength.
    circle(d = 5);

    // Next remove any part of the mount that overlaps with the main ring body.

    // Extrude the panel up 3mm.
    // Any number greater than the height of the above object can be used.
    // A number exactly the same as 3mm may leave a 0 width surface that will confuse object slicers for 3D printing.
    // Center being true effectively extrudes half the height in both directions from the middle of that height.
    linear_extrude(height = 6, center = true)

    // Draw a circle with the inner diameter of the main ring body.
    // This keeps the main inner area clear.
    circle(d = 25.5);
}
