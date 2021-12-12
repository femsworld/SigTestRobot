*** Setting ***
Documentation     Register New users, login and review user details
Library           SeleniumLibrary
Library           FakerLibrary
Resource          ../Resources/Variables.robot


*** Keywords ***

Navigate To Homepage
    Open Browser     ${URL}    ${BROWSER}
    Maximize Browser Window
    wait until element is visible       ${REGISTER_USER}

Assert user is on the HomePage
     Page should contain     Demo app
     Page should contain     index page
     [Teardown]              Close Browser

Click Register Button
    Click element   ${REGISTER_USER}
    Wait until element is visible   ${REGISTER_Logo}

Check user info
    Click element     ${LOGIN}
    Input text        ${USERNAME}     ${USER}
    Input text        ${USERNAME_PASSWORD}     ${USER_PASSWORD}
    click element     ${LOGIN_1}

Assert user info is displayed on main menu
    Page should contain     User Information
    [Teardown]              Close Browser

Enter user info
    ${name}=  FakerLibrary.Name
    log     ${name}
    Set Test Variable    ${name}
    Input text  ${USERNAME}     ${name}
    Input text  ${USERNAME_PASSWORD}     testing
    Input text  ${FIRSTNAME}       Tommy
    Input text  ${FAMILYNAME}       Smith
    Input text  ${PHONE}          1234567890
    Click element   ${REGISTER_BUTTON}

Register New user and Login to check user info
    ${name}=  FakerLibrary.Name
    log     ${name}
    Set Test Variable    ${name}
    Input text  ${USERNAME}     ${name}
    Input text  ${USERNAME_PASSWORD}     ${USER_PASSWORD}
    Input text  ${FIRSTNAME}       Tommy
    Input text  ${FAMILYNAME}       Smith
    Input text  ${PHONE}          1234567890
    Click element   ${REGISTER_BUTTON}
    wait until element is enabled      ${LOGIN}
    Input text        ${USERNAME}     ${name}
    Input text        ${USERNAME_PASSWORD}     ${USER_PASSWORD}
    click element     ${LOGIN_1}

Assert that new user is registered successfully
    Page should contain     Demo app
    Page should contain     Log In
    Page should contain     Username
    Page should contain     Password
    [Teardown]              Close Browser