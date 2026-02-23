if (global.mundo == "Normal")
{
    image_index = 0;
    
}
else
{
    if (instance_exists(obj_grade))
    {
        image_index = 1;
    }
    else
    {
        image_index = 2;
    }
        
}