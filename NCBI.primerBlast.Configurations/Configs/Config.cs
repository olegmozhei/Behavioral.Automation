﻿using Microsoft.Extensions.Configuration;

namespace NCBI.PrimerBlast.Configurations.Configs;

public class Config
{

    [ConfigurationKeyName("ASSERT_TIMEOUT_MILLISECONDS")] 
    public float? AssertTimeoutMilliseconds { get; set; }
    
    [ConfigurationKeyName("SEARCH_ATTRIBUTE")] 
    public string SearchAttribute { get; set; }

    [ConfigurationKeyName("SLOW_MO_MILLISECONDS")]
    public float? SlowMoMilliseconds { get; set; }

    [ConfigurationKeyName("HEADLESS")] public bool? Headless { get; set; } = true;
    [ConfigurationKeyName("RECORD_VIDEO")] public bool RecordVideo { get; set; } = false;
}