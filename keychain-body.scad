//! Entrypoint for the main keychain body with one side having a face and the other side being empty.

// Union will combine all contained objects into a single object.
union () {
    // Move the logo up 2mm along the z-axis.
    translate([0, 0, 2])

    // Apply the code in the logo file to show the logo.
    include <./components/logo.scad>

    // Apply the code in the ring file to show the whole ring body.
    include <./components/ring.scad>
}

// Apply the code in the keychain mount file tp show the mount for rings and chains.
include <./components/mount.scad>