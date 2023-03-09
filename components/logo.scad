//! Logo to show on Keychain.

// Extrude the logo up by 1mm.
// Center being true effectively extrudes half the height in both directions from the middle of that height.
linear_extrude(height = 1, center = true)

// Resize the width of the logo to be 20mm across.
// Auto being true means the other axes will auto-resize to maintain it's original aspect ratio.
resize([20,0,0], auto = true)

// Slightly shrink the logo without causing size distortion.
// Note that since offset comes after resize, the width will remain 20mm.
offset(r=-1)

// Import the svg of our intended logo.
// Center being true means the center of the model will be draw at the origin: x = 0, y = 0, and z = 0.
// Note how the path is relative to the the root since a root scad file imports this file.
import("./images/code-logo.svg", center = true);

// The semi colon above ends this object, which is just the logo.
