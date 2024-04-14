# Monitoring wallboard https://www.admin-magazine.com/Archive/2023/78/What-s-your-status-page
# https://www.section.io/engineering-education/how-to-execute-linux-commands-in-python/
import subprocess  
  
def ping(servers):
    
    # The command you want to execute   
    cmd = 'ping'
  
    # send one packet of data to the host 
    # this is specified by '-c 1' in the argument list 
    outputlist = []
    # Iterate over all the servers in the list and ping each server
    for server in servers:
        temp = subprocess.Popen([cmd, '-c 1', server], stdout = subprocess.PIPE) 
        # get the output as a string
        output = str(temp.communicate()) 
    # store the output in the list
        outputlist.append(output)
    return outputlist
  
if __name__ == '__main__': 
    
    # Get the list of servers from the text file
    servers = list(open('servers.txt'))
    # Iterate over all the servers that we read from the text file
    # and remove all the extra lines. This is just a preprocessing step
    # to make sure there aren't any unnecessary lines.
    for i in range(len(servers)):
        servers[i] = servers[i].strip('\n')
    outputlist = ping(servers) 
    
    # Uncomment the following lines to print the output of successful servers
    # print(outputlist)
