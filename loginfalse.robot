*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Resources.robot
Suite Setup    Opening Browser
Suite Teardown    Closing Browser
Test Template    Invalid Login

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***                   alias        email                  password
right alias right email wrong pwd    inovasi    nandamehisa@gmail.com    nandd0561
right alias wrong email right pwd    inovasi    nanda@gmail.com          nanda05!!!
wrong alias right email wrong pwd    inonasi    nandamehisa@gmail.com    nanda0506
right alias right email empty pwd    inovasi    nandamehisa@gmail.com    ${EMPTY}
right alias empty email right pwd    inovasi    ${EMPTY}                 nanda05!!!
empty alias right email right pwd    ${EMPTY}   nandamehisa@gmail.com    nanda05!!!
empty alias empty email right pwd    ${EMPTY}   ${EMPTY}                 nanda05!!!
empty alias empty email empty pwd    ${EMPTY}   ${EMPTY}                 ${EMPTY}

*** Keywords ***
Invalid Login
    [Arguments]    ${alias}    ${email}    ${password}
    Inputing Alias ID    ${alias}
    Inputing Email    ${email}
    Inputing Password    ${password}
    Click Login Button
    Error Message Should Be Visible
    CLear Input
