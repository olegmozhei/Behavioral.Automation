using System.Text.RegularExpressions;

namespace Behavioral.Automation.Configs.utils;

public static class NormalizePath
{
    public static string NormalizePathAccordingOs(this string fullPath)
    {
        fullPath = fullPath.Replace("/", Path.DirectorySeparatorChar.ToString());
        fullPath = fullPath.Replace(@"\", Path.DirectorySeparatorChar.ToString());
        return fullPath;
    }
    
    public static string ToCamelCase(this string str)
    {
        return Regex.Replace(str, @"[ ](\w)", m => m.Groups[1].Value.ToUpper());
    }
}