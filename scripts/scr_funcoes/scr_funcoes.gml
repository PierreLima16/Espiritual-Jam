function fx(_snd, _pitch1, _pitch2)
{
    var _pitch = random_range(_pitch1, _pitch2);
    
    audio_stop_sound(_snd);
    
    audio_play_sound(_snd, 0, 0, , , _pitch);
}

function msc(_msc, _volume)
{
    
    if (!audio_is_playing(_msc)) audio_play_sound(_msc, 1, 1, _volume);
}