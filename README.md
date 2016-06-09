# sar\_robot\_command

A ROS package containing custom ROS messages for communication with SAR
robots.

## RobotCommand

The RobotCommand message definition includes a standard ROS message header and
the command to send. Some commands, such as DO, must be accompanied by a set of
properties, such as a string containing text for the robot to say and
actions/behaviors for the robot to do. 

For some robots, DO commands must be also tagged with a unique ID, which should
be put in the "id" field. Note that RobotCommand messages do not check nor
ensure that anything placed in the "id" field is in fact unique.

If a command does not require properties or an ID, set these fields as empty strings.

A list of constants is included for the different commands
that can be sent to a robot. These are: 

- 0 SLEEP
    - no properties (properties = empty string)

- 1 WAKEUP
    - no properties

- 2 DO
    - string containing text for the robot to say and/or actions/behaviors for
      the robot to do before, during, or after speaking (or instead of
      speaking)


### Details about the DO command

The exact format of this command's argument is yet to be determined, but may be
a string of the format:

`"Hi <smile> I am a robot! <wave>"`

where the string contains text that the robot should say, with embedded
actions that the robot should do. We could add additional optional flags,
such as whether the action should be blocking or non-blocking, or where to
direct the behavior, next to each action, e.g.:

`"Hi <smile,nb,at-person> I am a robot! <wave,b>"`

These arguments would not have to contain both speech and actions, e.g.:

`"Hi I am a robot!"`

or

`"<smile>"`

TODO: Define the exact format, provide a list of optional flags.

## RobotState

The RobotState message definition includes several flags that can be sent back
by a robot. These flags give status information about the robot's current
activities.

- doing action
    - True when the robot is currently performing an animation or behavior

- is playing sound
    - True when the robot is currently playing back sound

TODO: Define additional status flags that may be useful.
