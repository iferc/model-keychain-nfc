//! Tool for orienting both side of keychain logo's to be in parallel of each other.

module logo(height, offset) {
    // Extrude the logo up by a given amount.
    // Center being true effectively extrudes half the height in both directions from the middle of that height.
    linear_extrude(height = height, center = true)

    // Resize the width of the logo to be 20.5mm across, slightly larger than the 20mm used for the face plate.
    // Auto being true means the other axes will auto-resize to maintain it's original aspect ratio.
    resize([20.5,0,0], auto = true)

    // Slightly enlarge the logo without causing size distortion.
    offset(r = offset)

    // Rotate the logo since this tool needs to fit on top of the regular logo panels.
    rotate([180, 0, 0])

    // Import the svg of our intended logo.
    // Center being true means the center of the model will be draw at the origin: x = 0, y = 0, and z = 0.
    import("./images/code-logo.svg", center = true);
}

module tube(height = 40, diameter = 22) {
    // Move the panel up the z-axis by half of the given height to make the tube extrude on one side of the z-axis.
    translate([0, 0, - (height / 2)])

    // Extrude the tube up by the given amount.
    // Center being true effectively extrudes half the height in both directions from the middle of that height.
    linear_extrude(height = height, center = true)

    // Draw a circle with a diameter of the given amount.
    circle(d = diameter);
}

// Difference extrudes the first object, and then remove all following objects inside the difference.
difference() {
    // Draw a tube object to be the main tool body.
    tube(40);

    // The semi colon above ends this object, which is just the body.
    // All following objects will remove from the above object instead of drawing more new objects.

    // Remove material fitting the logo with more offset (enlarging) than previously used for a loose fit.
    logo(height = 8, offset = 3);

    // Move the leverage insert slots to the bottom of the tube.
    translate([0, 0, - 30])

    // Remove material for a slot that can hold leverage sticks both for ease of turning and for gauging alignment.
    cube([1.75, 40, 20], center = true);
}
