# load in the webdriver gem to interect with selenium
require 'selenium-webdriver'
#setup chrome plugin
#driver = Selenium::WebDriver::Chrome.driver_path='C:\Ruby26-x64\bin\chromedriver.exe'
#this line will start the browser
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

def document_initialised(driver)
  driver.execute_script('return initialised')
end

#Navigate to URl
driver.get 'https://www.google.com'

wait.until{|document_initialised| driver}
search_form = driver.find_element(:css,"input[name='q']").text
"Hello from JavaScript!".eql? search_form

#Maximize the window
driver.manage.window.maximize
driver.manage.timeouts.implicit_wait = 10

# Enter text into the  Chrome Browser
driver.find_element(:css,"input[name='q']").send_keys 'selenium tutorial'
#driver.find_element(:id,"fakebox-input").send_keys 'ruby'
sleep(3)

#Scroll up & down the page
driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
sleep(3)
driver.action.send_keys(:return).perform

# driver.action.key_down(:enter).key_up(:enter).perform
sleep(5)

# Using of a variable name element1 and store the all locator
element1=driver.find_element(:xpath,"(//div[@class='g']//h3)")
puts"#{element1}"

# Starting of for loop
for i in 1..13

# Starting of scrolling loop
  for j in 1..5
    driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
  end

# If condition is false here & not open
  if i==4 ||i==5 ||i==6 ||i==7
    next
  end

#Using of a variable element and store the locator value using interpolation getting the link
  element=driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]")
  sleep(5)

  driver.action.move_to(element).perform
  sleep(5)
#link element locator
# driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]").click
  element.click
  sleep(5)
# Browser is back here
  driver.navigate.back
  sleep(5)

# Browser Refresh
  driver.navigate.refresh
  sleep(5)

#Increment of loop
  i+=1
end

#Browser close
driver.close



