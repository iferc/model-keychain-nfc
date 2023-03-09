//! Keychain Body.

// Make a hollow outer ring.

// Difference extrudes the first object, and then remove all following objects inside the difference.
difference() {
    // Extrude the outer body up by 5mm.
    // Center being true effectively extrudes half the height in both directions from the middle of that height.
    linear_extrude(height = 5, center = true)

    // Draw a circle with a diameter of 25.5mm (space needed for an NFC sticker),
    // plus a 2mm with border times 2 because we're explicitly setting the (d)iameter instead of radius.
    circle(d = 25.5 + 2 * 2);

    // The semi colon above ends this object, which is just the body.
    // All following objects will remove from the above object instead of drawing more new objects.

    // Extrude the inner body up by 6mm.
    // Any number greater than the height of the above object can be used.
    // A number exactly the same may leave a 0 width surface that will confuse object slicers for 3D printing.
    // Center being true effectively extrudes half the height in both directions from the middle of that height.
    linear_extrude(height = 6, center = true)

    // Draw a circle with a diameter of 25.5mm (space needed for an NFC sticker).
    circle(d = 25.5);
}


// Make a panel inside the hollow ring.

// Move the panel up the z-axis by 1mm.
// Note that the hollow ring is 2.5mm high on each side of the z-axis.
translate([0, 0, 1])

// Extrude the panel up 1mm.
// Center being true effectively extrudes half the height in both directions from the middle of that height.
// This means the panel starts 0.5mm above z = 0, fills 1mm, and leaves 0.5mm of space to the face of the hollow ring.
linear_extrude(height = 1, center = true)

// Draw a circle with a diameter of 25.5mm (space needed for an NFC sticker),
// plus a 1mm with border times 2 because we're explicitly setting the (d)iameter instead of radius.
// A number of 25.5 exactly may leave a 0 width gap between the panel and the hollow ring
// that will confuse object slicers for 3D printing.
circle(d = 25.5 + 1 * 2);

// The semi colon above ends this object, which is just the logo.
