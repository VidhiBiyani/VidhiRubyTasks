# load in the webdriver gem to interect with selenium
require 'selenium-webdriver'
#setup firefox plugin
driver=Selenium::WebDriver::Firefox.driver_path='C:\Ruby26-x64\bin\geckodriver.exe'
#this line will start the browser
driver = Selenium::WebDriver.for :firefox
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

def document_initialised(driver)
  driver.execute_script('return initialised')
end
#Navigate to URl
driver.get "https://www.facebook.com/"

#Wait for locator to upto the login
wait.until{|document_initialised| driver}
Login=driver.find_element(:id,"u_0_b").text
"Hello from JavaScript!".eql? Login

#Maximize the window
driver.manage.window.maximize
sleep 6

#Enter Email Id
driver.find_element(:id,"email").send_keys "9753576779"

#Enter password
driver.find_element(:id,"pass").send_keys "abcd@12345"
sleep 5

#Click on Login Button
driver.find_element(:id,"u_0_b").click
sleep 10

#Click on textarea of post
element2=driver.find_element(:css,"textarea[name='xhpc_message']")
driver.action.move_to(element2).perform
sleep 2
element2.click
#Write in Message box
element2.send_keys "Hi friend"
sleep 5

#Click on Post
driver.find_element(:xpath,"//span[text()='Post']").click
sleep 4

#Verify post text is correct or not
status =driver.find_element(:xpath,"(//p[contains(.,'Hi friend')])[1]")
if (status.displayed?)
  puts ("updated status:" + status.text)

end
#Browser close
driver.close
