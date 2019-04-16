#include "splashkit.h"

int main()
{
    // Lets read into this string...
    string name = "unknown";

    // Open a window to show the user...
    open_window("Reading Input.", 800, 600);

    // Load a font for text rendering
    load_font("input", "arial.ttf");

    // Define area where text shoud appear
    rectangle rect = rectangle_from( 230.0, 50.0, 200.0, 30.0 );

    // Start reading text in this area
    // This could be in the loop, if we had a button or something to click to trigger this
    start_reading_text(rect);

    // Here is our game loop
    do
    {
        // Listen for input... this will update the text read
        process_events();

        // Looks like we finished reading text...
        if ( not reading_text())
        {
            // Was input cancelled?
            if ( text_entry_cancelled() )
            {
                name = "unknown";
            }
            else
            {
                // Get the name from the text input
                name = text_input();
            }
        }

        // Draw the screen...
        clear_screen(COLOR_WHITE);

        draw_rectangle(COLOR_BLACK, rect);
        
        // If we are reading text... then show what it is
        if ( reading_text() )
        {
            draw_collected_text(COLOR_BLACK, font_named("input"), 18, option_defaults());
        }

        // Draw what we have in the name
        draw_text(name, COLOR_BLACK, font_named("input"), 18, 10, 10);

        // Show it..
        refresh_screen(60);
    } while ( ! quit_requested() );
}