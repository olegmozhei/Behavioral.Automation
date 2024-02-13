# Solution description  
## Bindings  
Bindings provides only regular expressions to write test steps.  
Bindings can be used to write manual or automation test cases, no difference here  
No implementation. Implementation can be Playwright, can be Selenium, doesn't matter
Bindings interfaces should not return locators
## Interfaces  
LocatorStorageService implementation is SUT interface dependent and should be placed in Playwright interface
WebContext (no need to use custom, but webContext implementation dependent??)
Config class to base url
## Customization  
Hooks (to connect bindings interfaces to interfaces implementation (both default and custom one))
Config json with base url to interface Config class