# load in the webdriver gem to interect with selenium
require 'selenium-webdriver'
#setup chrome plugin
driver = Selenium::WebDriver::Chrome.driver_path='C:\Ruby26-x64\bin\chromedriver.exe'
#this line will start the browser
driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

def document_initialised(driver)
  driver.execute_script('return initialised')
end

# Navigate to url
driver.get 'https://www.hq.com/'
wait.until{|document_initialised| driver}
search= driver.find_element(:xpath,"//button[text()='Contact']").text
"Hello from JavaScript!".eql? search

#Maximize window
driver.manage.window.maximize
driver.manage.timeouts.implicit_wait = 10

driver.find_element(:xpath,"//button[text()='Contact']").click
sleep 5
driver.find_element(:xpath,"//button[text()='Accept']").click
sleep 5
#Enter full name
driver.find_element(:id,"full_name").send_keys "Vidhi"
sleep 2
#Enter email id
driver.find_element(:id,"email").send_keys "abc@gmail.com"
sleep 2
if driver.find_element(:id,"city").displayed?
  puts "State dropdown is displayed.."
  select = driver.find_element(:id,"city")
  alloptions = select.find_elements(:tag_name,"option")
  puts alloptions.size

  alloptions.each do  |option|
    puts "Text is.."+option.attribute("text")
    if option.attribute("text")=="munich"
      option.click
      puts "text has been selected.."
      sleep 5
      break
    end
  end
end
#Enter city name
driver.find_element(:id,"city").send_keys "munich"
sleep 4
#Enter Mobile Number
driver.find_element(:id,"phone_number").send_keys "9875212545"
sleep 5
#Enter text in Comments
driver.find_element(:id,"comments").send_keys "abc"
sleep 4
#Click on Submit button
driver.find_element(:xpath,"(//input[@class='btn btn-blue'])[1]").click
sleep 5
#Verify text
Contact=driver.find_element(:xpath,"//div[@class='col col-md-12']").text
puts"#{Contact}"
sleep 3



#Browser close
driver.close