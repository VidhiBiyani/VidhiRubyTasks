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
driver.get "http://automationpractice.com/index.php?controller=authentication&back=my-account"
#Maximize the window
driver.manage.window.maximize

wait.until{|document_initialised| driver}
search= driver.find_element(:xpath,"//a[@title='Log in to your customer account']").text
"Hello from JavaScript!".eql? search
driver.action.key_down(:enter).perform
sleep 5

puts "enter the email id"
email_id=gets.chomp
puts "enter the password"
password=gets.chomp
#Enter email id
driver.find_element(:id,"email_create").send_keys(email_id)
sleep 5
#Click on Submit
driver.find_element(:id,"SubmitCreate").click
sleep 4
#Press enter
driver.action.key_down(:enter).perform

#Check that the radio button exists
puts "Test Passed: Radio button found" if wait.until {
  driver.find_element(:id,"uniform-id_gender2").displayed?
}

#Change the state of the Radio Buttons
cb1 = wait.until {
  element1 = driver.find_element(:id,"uniform-id_gender1")
  element1 if element1.displayed?
}
cb1.click if cb1.selected? == false

cb3 = wait.until {
  element2 = driver.find_element(:id,"uniform-id_gender2")
  element2 if element2.displayed?
}
cb3.click if cb3.selected? == false
sleep 4
#Enter FirstName
driver.find_element(:id,"customer_firstname").send_keys "demo"
sleep 3
#Enter Lastname
driver.find_element(:id,"customer_lastname").send_keys "user"
sleep 5

#Enter password
 driver.find_element(:id,"passwd").send_keys(password)
sleep 4

#Select day from dropdown list
if driver.find_element(:id,"uniform-days").displayed?
  puts "Days dropdown is displayed.."
  select = driver.find_element(:id,"uniform-days")
  alloptions = select.find_elements(:tag_name,"option")
  puts alloptions.size

  alloptions.each do  |option|
    puts "Value is.."+option.attribute("value")
    if option.attribute("value")=="20"
      option.click
      puts "Value has been selected.."
      sleep 5
      break
    end
  end
end
#Select Months from dropdown list
month_dropdown = driver.find_element(:id,"months")
months=Selenium::WebDriver::Support::Select.new(month_dropdown)
months.select_by(:text,"April ")
puts driver.find_element(:id,"months").text.include?("April")

#Select Years from dropdown list
years_dropdown = driver.find_element(:id,"years")
years=Selenium::WebDriver::Support::Select.new(years_dropdown)
years.select_by(:index,28)
sleep 3

#Enter Address
driver.find_element(:id,"address1").send_keys "45 calony A"
sleep 4

if driver.find_element(:id,"uniform-id_state").displayed?
  puts "State dropdown is displayed.."
  select = driver.find_element(:id,"uniform-id_state")
  alloptions = select.find_elements(:tag_name,"option")
  puts alloptions.size

  alloptions.each do  |option|
    puts "Text is.."+option.attribute("text")
    if option.attribute("text")=="California"
      option.click
      puts "text has been selected.."
      sleep 5
      break
    end
  end
end
#Enter city
driver.find_element(:id,"city").send_keys "Los Angeles"
sleep 4
#Enter postcode
driver.find_element(:id,"postcode").send_keys "23654"
#Select Country
country_dropdown =driver.find_element(:id,"id_country")
country=Selenium::WebDriver::Support::Select.new(country_dropdown)
country.select_by(:index,1)
sleep 5

#Input Mobile Number
driver.find_element(:id,"phone_mobile").send_keys "985256238"
sleep 5

#Click on Submit button
driver.find_element(:id,"submitAccount").click
sleep 5
puts "Page Title is #{driver.title}"
#Click on logout
driver.find_element(:xpath,("//a[@class='logout']")).click
sleep 5
