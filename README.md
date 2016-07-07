# sar\_robot\_command

A ROS package containing custom ROS messages for communication with SAR
robots.

## RobotCommand

The RobotCommand message definition includes a standard ROS message `header`
and the `command` to send. Some commands, such as `DO`, must be accompanied by
a set of `properties`, such as a string containing text for the robot to say
and actions/behaviors for the robot to do.

For some robots, `DO` commands must be also tagged with a unique ID, which
should be put in the `id` field. Note that RobotCommand messages do not check
nor ensure that anything placed in the "id" field is in fact unique.

If a command does not require properties or an ID, set these fields as empty
strings.

A command may also be tagged to interrupt any previously running behaviors on
the robot using the `interrupt` field. It is up to the specific robot platform
to monitor this field and interrupt or replace any command that was already
running on the robot.

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

#### General format

`DO` commands should be formatted as a string of text containing the words that
the robot should say, with any actions the robot should be instructed to do
embedded in the string in angle brackets. Here is an example:

`"Speech to say <action> more speech <action>"`

The following message string would instruct a robot to say "Hi I am a robot!",
to smile after saying "Hi", and to wave at the end of the sentence:

`"Hi <smile> I am a robot! <wave>"`

A message string can contain only speech or only actions, e.g.:

`"Hi I am a robot!"`

or

`"<smile>"`

#### Action flags

The action commands may contain additional optional flags, e.g.:

`"Hi <smile,flag1> I am a robot! <wave,flag2>"`

One use of these flags would be to indicate that specific robot animations or
actions, such as a "smile" or a "happy bounce", should be blocking or
non-blocking. For example, given the `DO` command `"Hi <happy bounce> I am a
robot!"`, if you tagged the action command as blocking, e.g., 

`"Hi <happy bounce,b> I am a robot!"`

then the robot would say "Hi", do a happy bounce, then say "I am a robot!".

If you tagged the action as non-blocking, e.g., 

`"Hi <happy bounce, nb> I am a robot!"`

then the robot would say "Hi", then do its happy bounce while saying "I am a
robot!"

For clarification, these flags would only change the attributes of a particular
action within the `DO` string. So flagging an action as "blocking" and
"non-blocking" flags would only change that particular action. As stated
earlier, if you want to interrupt and replace the currently running behavior on
the robot with your new command, you can use the `interrupt` field to indicate
this.

Note that this package does not track whether actions or flags you provide in a
message string are recognizable by any specific robot platform. For lists of
available actions or flags, please consult their specifications for your
specific robot platform or project. E.g., you would need to check your specific
robot platform or project's specifications regarding what flag to provide for
"blocking" vs. "non-blocking" actions.

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
