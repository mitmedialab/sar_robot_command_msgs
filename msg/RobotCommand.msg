# Message for requesting actions from a robot
Header header

# which command will be sent
int8 command 

# some robots require DO commands to be tagged with a unique ID 
# leave empty if no unique ID is needed
string id

# properties of command, such as:
#   string containing speech to play and actions to do
#   empty if no extra properties needed
string properties

# Commands
int8 SLEEP = 0
int8 WAKEUP = 1
int8 DO = 2
