# sar\_robot\_command

A ROS package containing custom ROS messages for communication with SAR
robots.

## RobotCommand

The RobotCommand message definition includes constants for the different
commands that can be sent to a robot. Some commands must be accompanied by a
set of properties, such as a string containing text for the robot to say and
actions/behaviors for the robot to do.

- 0 SLEEP
    - no properties (properties = null)

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
