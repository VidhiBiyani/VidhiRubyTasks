# load in the webdriver gem to interect with selenium
require 'selenium-webdriver'
#setup chrome plugin
#driver = Selenium::WebDriver::Chrome.driver_path='C:\Users\vidhi\Desktop\Ruby Folder\chromedriver.exe'
#this line will start the browser
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

def document_initialised(driver)
  driver.execute_script('return initialised')
end

# Navigate to url
driver.get 'https://www.indeed.co.in/jobs?q=java+developer&l=Pune%2C+Maharashtra'
driver.manage.window.maximize


wait.until{|document_initialised| driver}
search_form = driver.find_element(:xpath,"//a[@class='jobtitle turnstileLink ']").text
"Hello from JavaScript!".eql? search_form
i=1
for i in 1..16
  element1=driver.find_element(:xpath,"(//a[@class='jobtitle turnstileLink '])[#{i}]").text
  puts"the title of company #{i} is "+element1
  sleep 5
  element2=driver.find_element(:xpath,"(//span[@class='company'])[#{i}]").text
  puts "the company name #{i} is "+element2
  sleep 5
  element5=driver.find_element(:xpath,"(//div[@class='summary'])[#{i}]").text
  puts "the description is #{i} is "+element5
end
