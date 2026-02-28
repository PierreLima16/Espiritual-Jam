image_alpha = lerp(image_alpha, 0, 0.1);

image_speed = 0;


if (image_alpha <= 0.02)
{
    instance_destroy();
}
