/// singleton_check
singletonInit = false;
if (instance_number(object_index) > 1)
{
    debug_log("singleton_check > `", object_get_name(object_index), "` already exists, deleting the current instance");
    instance_destroy(id);
}
else
{
    singletonInit = true;
}
