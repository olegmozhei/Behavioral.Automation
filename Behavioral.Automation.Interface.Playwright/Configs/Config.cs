﻿using Microsoft.Extensions.Configuration;

namespace Behavioral.Automation.Pages.Configs;

public class Config
{
    [ConfigurationKeyName("BASE_URL")] 
    public string BaseUrl { get; set; }
    
    [ConfigurationKeyName("SEARCH_ATTRIBUTE")] 
    public string SearchAttribute { get; set; }
}