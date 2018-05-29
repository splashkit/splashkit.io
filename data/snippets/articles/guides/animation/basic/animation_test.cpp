#include "splashkit.h"

/// A Test application to demonstrate the use of Animations in SplashKit.
int main()
{
    window w = open_window("Animation Test", 120, 120);
    
    // We could load all of the resources in a bundle
    // load_resource_bundle("dance bundle", "dance_bundle.txt");
    //
    // Then access by name
    // animation_script dance_script = animation_script_named("WalkingScript");
    // bitmap frog = bitmap_named("FrogBmp");

    // Loading them separately

    // Load image and set its cell details
    bitmap frog = load_bitmap("FrogBmp", "Frog.png");
    bitmap_set_cell_details(frog, 73, 105, 4, 4, 16); // cell width, height, cols, rows, count

    // Load the animation script
    animation_script dance_script = load_animation_script("WalkingScript", "kermit.txt");

    // Create the animation
    animation test = create_animation(dance_script, "WalkFront");

    // Create a drawing option
    drawing_options opt;
    opt = option_with_animation(test);

    // Basic event loop
    while( not quit_requested() )
    {
        // Draw the bitmap - using opt to link to animation
        clear_screen(COLOR_WHITE);
        draw_bitmap(frog, 20, 20, opt);
        refresh_screen(60);

        // Update the animation
        update_animation(test);

        process_events();

        // Switch animations
        if ( key_typed(UP_KEY))
        {
            assign_animation(test, "WalkBack");
        }
        else if ( key_typed(DOWN_KEY))
        {
            assign_animation(test, "WalkFront");
        }
        else if ( key_typed(D_KEY))
        {
            assign_animation(test, "Dance");
        }
    }
}
