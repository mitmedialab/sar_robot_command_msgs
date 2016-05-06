# Message for requesting actions from a robot

# which command will be sent
int8 command 

# properties of command, such as:
#   string containing speech to play and actions to do
#   null if no extra properties needed
string properties

# Commands
int8 SLEEP = 0
int8 DO = 1
