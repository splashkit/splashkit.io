#include "splashkit.h"

int main() 
{
    sound_effect  snd_effect;

    open_window("Sound Demo", 320, 240);

    snd_effect = load_sound_effect("chipmunk", "chipmunk.ogg");

    load_sound_effect("bells", "bells.ogg");
    load_sound_effect("camera", "camera.ogg");
    load_sound_effect("boing", "comedy_boing.ogg");
    load_sound_effect("dinosaur", "dinosaur.ogg");
    load_sound_effect("bark", "dog_bark.ogg");

    do 
    {
        process_events();
        if ( key_down(RIGHT_CTRL_KEY) || key_down(LEFT_CTRL_KEY) )
        {
            if ( key_typed(NUM_1_KEY))
                snd_effect = sound_effect_named("chipmunk");
            if ( key_typed(NUM_2_KEY))
                snd_effect = sound_effect_named("bells");
            if ( key_typed(NUM_3_KEY))
                snd_effect = sound_effect_named("camera");
            if ( key_typed(NUM_4_KEY))
                snd_effect = sound_effect_named("boing");
            if ( key_typed(NUM_5_KEY))
                snd_effect = sound_effect_named("dinosaur");
            if ( key_typed(NUM_6_KEY))
                snd_effect = sound_effect_named("bark");
        }
        else
        {
            if ( key_typed(NUM_1_KEY))
                play_sound_effect(snd_effect);
            if ( key_typed(NUM_2_KEY))
                play_sound_effect(snd_effect, 0.5f);
            if ( key_typed(NUM_3_KEY))
                play_sound_effect(snd_effect, 3, 0.25);
            if ( key_typed(NUM_4_KEY))
                play_sound_effect(snd_effect, -1, 0.1);
            if ( key_typed(NUM_5_KEY))
            {
                if ( sound_effect_playing(snd_effect))
                    stop_sound_effect(snd_effect);
            }
        }

        clear_screen(COLOR_WHITE);

        draw_text("Control Sound (Escape or q to quit)", COLOR_RED, "arial", 18, 15, 15);
        draw_text("1: Play Sound At Full Volume", COLOR_BLUE, "arial", 14, 20, 50);
        draw_text("2: Play Sound At 50% Volume", COLOR_BLUE, "arial", 14, 20, 80);
        draw_text("3: Play Sound At 25% Volume 3 Times", COLOR_BLUE, "arial", 14, 20, 110);
        draw_text("4: Play Sound Continuously at 10%", COLOR_BLUE, "arial", 14, 20, 140);
        draw_text("5: Stop Playing Current Sound", COLOR_BLUE, "arial", 14, 20, 170);
        draw_text("CTRL + (1-6) switch sound effects", COLOR_BLUE, "arial", 14, 20, 200);

        refresh_screen(60);
    } while ( ! (quit_requested() || key_typed(ESCAPE_KEY) || key_typed(Q_KEY)));

    return 0;
}