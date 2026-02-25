if (global.mundo == "Normal")
{
    image_index = 0;
    
}
else
{
    var _grade = instance_exists(obj_grade);
    if (_grade)
    {
        image_index = 1;
    }
    else if (obj_grade.indice == indice)
    {
        image_index = 2;
    }
        
}

