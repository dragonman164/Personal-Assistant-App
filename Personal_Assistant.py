import pyttsx3
import getpass
import datetime
import webbrowser
import subprocess
import time
import os
import random
import cv2
import psutil
import shutil
import requests
import json
import random
import string





engine = pyttsx3.init('sapi5')
voices = engine.getProperty('voices')
engine.setProperty('voice',voices[0].id)

# Home Variables 
USERNAME = getpass.getuser()
url = 'http://127.0.0.1:8000/'

# Pass String to this function to make your computer to speak something
def speak(audio):
    print(audio)
    engine.say(audio)
    engine.runAndWait()




# This function will tell current time to the user
def currTime():
    strTime = datetime.datetime.now().strftime("%H:%M:%S")
    speak(f"The Time is {strTime}")

# Play any random music from folder
def music():
    songs = os.listdir('music')
    select_index = random.randint(0,len(songs)-1)
    os.startfile(os.path.join('music',songs[select_index]))


# Capture Webcam Picture

def takePicture(handle_request):
    
    if not handle_request:
        speak("Please use your remote device to use this feature")
        return 
    
    ans = [elem for elem in string.ascii_lowercase]+ [elem for elem in string.digits]
    random.shuffle(ans)
    length = 10
    file_name =""
    for elem in range(0,min(length,len(ans))):
        file_name += ans[elem]
    file_name+= ".jpg"
    
    videoCaptureObject = cv2.VideoCapture(0)
    result = True

    while(result):
        ret,frame = videoCaptureObject.read()
        cv2.imwrite(file_name,frame)
        result = False
    videoCaptureObject.release()
    cv2.destroyAllWindows()
    print("Hello")
    files=[
    ('file',(file_name,open(file_name,'rb'),'image/jpeg'))
        ]
    headers = {
  'Authorization': 'Basic YWRtaW46YWRtaW4='
    }
    requests.request("POST", url + "api3/", headers=headers,files=files)




# Show Laptop Details 
def details(handle_request):
    battery = psutil.sensors_battery()
    print("Battery Percentage: ",battery.percent)
    print("CPU Usage Percentage: ",psutil.cpu_percent())
    print("Main Memory Usage Percentage: ",psutil.virtual_memory().percent) 
    path = "C:"
    stat = shutil.disk_usage(path) 
    ans = stat[1]/stat[0]
    print("Disk usage in Percentage: ",ans)
    if handle_request:
        payload={'battery_percentage': battery.percent,
                'cpu_usage': psutil.cpu_percent(),
                'ram_usage': psutil.virtual_memory().percent,
                'disk_usage': ans*100}
        headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic YWRtaW46YWRtaW4='
    }
    requests.request("POST", url + "api2/", headers=headers, data=json.dumps(payload),)
    time.sleep(2)


# Handle Computer Events (This function will work in Windows Only)
# Linux users should change these commands to make it work on linux as well

def computerEvents(query):
    if "shutdown" in query.lower():
        speak("Are you sure you want to shutdown your computer")
        ans = input() 
        if "y" in ans.lower():
            os.system("shutdown /s /t 1")
    
    elif "restart" in query.lower():
        speak("Are you sure you want to restart this computer?")
        ans = input() 
        if "y" in ans.lower():
            os.system("shutdown /r /t 1")

    elif "logout" in query.lower():
        speak("Are you sure you want to logout?")
        ans = input()
        if "y" in ans.lower():
            os.system("shutdown -l")


# This Function will open a specific URL
def handlesurfing(handle_request):
    speak("What would you like to surf on the Internet?")
    if handle_request:
        time.sleep(10)
        query = requests.get(url + "api1/").json()['query']
    else:
        query = input() 
    
    if "google" in query.lower():
        speak("Opening Google Search Engine for you")
        webbrowser.open_new_tab("https://www.google.com")
    
    elif "youtube" in query.lower() or "entertainment" in query.lower() or "video" in query.lower() or "movie" in query.lower():
        speak("Opening Youtube for you")
        webbrowser.open_new_tab("https://www.youtube.com")
    
    elif "coding" in query.lower() or "code" in query.lower():
        speak("Wow!! All the best for CP !! Opening Codeforces for you")
        webbrowser.open_new_tab("https://codeforces.com")
    
    elif "news" in query.lower():
        speak("Have a look at what's going around the world")
        webbrowser.open_new_tab("https://news.google.com")

    else:
        speak("Sorry, I can't understand what you are trying to say")
    



# This Function will greet the user
def greet():
    hours = datetime.datetime.now().hour
    
    if hours >= 0 and hours <= 12:
        speak("Good Morning")
    
    elif hours >12 and hours <18:
        speak("Good Afternoon")
    
    elif hours >= 18 and hours < 21:
        speak("Good Evening")
    
    else:
        speak("Good Night")


# This function will handle user queries
def handleQuery(query,handle_request):

    if "code" in query.lower() or "coding" in query.lower() or "develop" in query.lower():
        speak("Opening VS Code for you...")
        subprocess.Popen('code')
        speak(f"Let's Develop Something fresh {USERNAME}")

    elif "internet" in query.lower() or "surfing" in query.lower() :
        speak("Opening Browser for you...")
        handlesurfing(handle_request)

    elif "notepad" in query.lower():
        speak("Opening Notepad for you")
        subprocess.Popen("notepad")

    elif "exit" in query.lower() or "bye" in query.lower() or "quit" in query.lower():
        speak("Bye Bye User, See you around")
        exit(0)
    
    elif "time" in query.lower():
        currTime()
    
    elif "music" in query.lower() or "song" in query.lower():
        music()
    
    elif "shutdown" in query.lower() or "restart" in query.lower() or "logout" in query.lower():
        computerEvents(query)

    elif "photo" in query.lower() or "capture" in query.lower() or "who" in query.lower():
        speak("We are monitoring who is using your computer")
        takePicture(handle_request)

    elif "details" in query.lower() or "usage" in query.lower() or "battery" in query.lower() or "laptop" in query.lower():
        speak("We are telling you desired details")
        details(handle_request)
    
    else:
        speak("I cannot understand what you want me to do. Please say that again")


try:
    handle_request_from_remote_device = not requests.get(url + "api4/").json()['mobile']
except:
    print("Make sure you are connected to the Internet")
    exit(1)

prevquery = -1
id = -1
query=""
greet()
speak(USERNAME)
while True:
    speak("What you want me to do Sir?")
    if handle_request_from_remote_device:
        # Handle Request Here
        print("Using Server...")
        while prevquery == id:
            time.sleep(5)
            data = requests.get(url + "api1/").json()
            query = data['query']
            id = data['id']
        prevquery = id
    else:
        query = input()

    print(" ")
   
    
    if query != None:
        handleQuery(query,handle_request_from_remote_device)


