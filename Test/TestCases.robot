*** Setting ***
Documentation     Register New users, login and review user details
Library           SeleniumLibrary
Library           FakerLibrary
Resource          ../Resources/Keywords.robot
Resource          ../Resources/Variables.robot


*** Test Cases ***

Create new Login User
     Navigate To Homepage
     Click Register Button
     Enter user info
     Assert that new user is registered successfully

Check user information
    [Tags]     Femi
    Navigate To Homepage
    Check user info
    Assert user info is displayed on main menu

Register New user and Login to check user Details
     Navigate To Homepage
     Click Register Button
     Register New user and Login to check user info
     Assert user info is displayed on main menu