Selenium server with atom-shell that can be used with selenium grid. Based off [vvoyer/docker-selenium-firefox-chrome].

### Using with webdriver

```ruby 
caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"binary" => "/atom"})
driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub', desired_capabilities: caps
driver.get("https://www.google.com")
```


[vvoyer/docker-selenium-firefox-chrome]:https://registry.hub.docker.com/u/vvoyer/docker-selenium-firefox-chrome/