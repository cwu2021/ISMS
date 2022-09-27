// https://stackoverflow.com/questions/73058917/time-sensitive-notifications-not-being-received
// https://gist.github.com/gdeglin/98aeda28035b45cef04bb6c2cb41a4aa
// https://stackoverflow.com/questions/38725622/android-delay-in-receiving-message-in-fcmonmessagereceived
import requests
import json

serverToken = <server_token>
deviceToken = <device_token>

headers = {
'Content-Type': 'application/json',
'Authorization': 'key=' + serverToken,
}

body = {
"notification":{
"title":"My web app name",
"body":"message",
"badge" : 1,
"sound" : "chime.aiff",
"interruption-level": "time-sensitive",
"content_available" : "true"
},

"to": deviceToken
}

response = requests.post("https://fcm.googleapis.com/fcm/send",headers = headers, data=json.dumps(body),)
print(response.status_code)

print(response.json())
