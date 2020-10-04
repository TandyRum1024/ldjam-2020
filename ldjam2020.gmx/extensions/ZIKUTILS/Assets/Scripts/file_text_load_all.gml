/// file_text_load_all(_file)
/*
    Loads all the text from given file
    and returns the string with file's contents
*/
var _file = argument0;
var _contents = "";
var _FILE = file_text_open_read(_file);
if (_FILE != -1)
{
    /// Using the loop, read all the lines and append it into the contents variable until the EOF is reached
    while (!file_text_eof(_FILE))
    {
        _contents += file_text_readln(_FILE);
    }
    
    file_text_close(_FILE);
    // debug_log("file_text_load_all> SUCCESSFULLY LOADED FILE `", _file, "`");
}
else
{
    /// Couldn't open the file, perhaps the file doesn't exist or something
    debug_log("file_text_load_all> COULDN'T LOAD THE FILE `", _file, "`");
}

return _contents;
