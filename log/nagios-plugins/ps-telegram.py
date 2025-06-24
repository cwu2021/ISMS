# https://www.linux-magazine.com/Issues/2025/294/Automated-Process-Monitoring
while True:
     found=False
     for process in psutil.process_iter():
       if(process.name()==args.process_name):
         print(args.process_name +" up and running at " +str(datetime.now()))
         found=True

     if(found==False):
       message = "Process " +args.process_name + " is currently down"
       print(message)
       url = f"https://api.telegram.org/bot{args.token}/sendMessage?chat_id={args.user_id}&text={message}"
       requests.get(url).json()
       quit()

     time.sleep(args.interval * 60)

 except Exception as e:
   print(f"Error {type(e)}")
