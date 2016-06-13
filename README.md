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

A list of constants is included for the different commands that can be sent to
a robot. These are: 

- 0 SLEEP
    - no properties (properties = empty string)

- 1 WAKEUP
    - no properties

- 2 DO
    - string containing text for the robot to say and/or actions/behaviors for
      the robot to do before, during, or after speaking (or instead of
      speaking)

### Details about the DO command

DO commands should be formatted as a string of text containing the words that
the robot should say, with any actions the robot should be instructed to do
embedded in the string in angle brackets. Here is an example:

`"Speech to say <action> more speech <action>"`

The following message string would instruct a robot to say "Hi I am a robot!",
to smile after saying "Hi", and to wave at the end of the sentence:

`"Hi <smile> I am a robot! <wave>"`

The action commands may contain additional optional flags, such as whether the
action should be blocking or non-blocking, or where to direct the behavior,
next to each action, e.g.:

`"Hi <smile,nb,at-person> I am a robot! <wave,b>"`

A message string can contain only speech or only actions, e.g.:

`"Hi I am a robot!"`

or

`"<smile>"`

Note that this node does not track whether actions or flags you provide in a
message string are recognizable by any specific robot platform. For lists of
available actions or flags, please consult ther specifications for your
specific robot platform or project.

## RobotState

The RobotState message definition includes several flags that can be sent back
by a robot. These flags give status information about the robot's current
activities.

- doing action
    - True when the robot is currently performing an animation or behavior

- is playing sound
    - True when the robot is currently playing back sound

TODO: Define additional status flags that may be useful.

## Version and dependency notes

This node was built and tested with:

- Python 2.7.6
- ROS Indigo
- Ubuntu 14.04 LTS (64-bit)

## Bugs and issues

Please report all bugs and issues on the [sar\_robot\_command\_msgs github
issues
page](https://github.com/personal-robots/sar_robot_command_msgs/issues).
