#include "splashkit.h"

#define SCREEN_BORDER 100

void update_camera_position(double player_x, double player_y)
{
    // Test edge of screen boundaries to adjust the camera
    double left_edge = camera_x() + SCREEN_BORDER;
    double right_edge = left_edge + screen_width() - 2 * SCREEN_BORDER;
    double top_edge = camera_y() + SCREEN_BORDER;
    double bottom_edge = top_edge + screen_height() - 2 * SCREEN_BORDER;

    // Test if the player is outside the area and move the camera
    // the player will appear to stay still and everything else
    // will appear to move :)

    // Test top/bottom of screen
    if (player_y < top_edge)
    {
        move_camera_by(0, player_y - top_edge);
    }
    else if (player_y > bottom_edge)
    {
        move_camera_by(0, player_y - bottom_edge);
    }

    // Test left/right of screen
    if (player_x < left_edge)
    {
        move_camera_by(player_x - left_edge, 0);
    }
    else if (player_x > right_edge)
    {
        move_camera_by(player_x - right_edge, 0);
    }
}

/**
 * Entry point.
 * 
 * Manages the initialisation of data, the event loop, and quitting.
 */
int main()
{
    open_window("Camera Test", 800, 800);

    double player_x = 400, player_y = 400;

    while ( not quit_requested() )
    {
        // Handle input to adjust player movement
        process_events();
        
        if (key_down(LEFT_KEY)) player_x -= 3;
        if (key_down(RIGHT_KEY)) player_x += 3;
        if (key_down(DOWN_KEY)) player_y += 3;
        if (key_down(UP_KEY)) player_y -= 3;

        update_camera_position(player_x, player_y);

        // Redraw everything
        clear_screen(COLOR_BLACK);

        // Draw to the screen
        draw_text("HUD - top left", COLOR_WHITE, 0, 0, option_to_screen());

        // as well as the player who can move
        fill_circle(COLOR_YELLOW, player_x, player_y, 20);

        // including something stationary - it doesn't move
        fill_rectangle(COLOR_WHITE, 400, 200, 10, 10);

        refresh_screen(60);
    }

    return 0;
}