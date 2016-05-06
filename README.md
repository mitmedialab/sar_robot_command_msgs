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

- 1 DO
    - string containing text for the robot to say and/or actions/behaviors for the robot to do before, during, or after speaking (or instead of speaking)
    - TODO example format to come!

