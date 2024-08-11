*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome
${new_key}    role_edited
${new_desc}    Hello This is Edit Role

*** Test Cases ***
#Need to change 1st list key and desc to run edit access role test. Edit Desc menjadi Halo
Search by Key
    Login
    Go To Access Control
    Click Filter Button
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/input[1]    test
    Sleep    5
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]    test
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/input[1]    olivia
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Search By Description
    Login
    Go To Access Control
    Click Filter Button
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/input[1]    free
    Sleep    5
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[3]    free
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/input[1]    olivia
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Edit Role
    Login
    Go To Access Control
    Click Filter Button
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/input[1]    Halo
    Sleep    5
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[3]    Halo
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[4]/div/span/button
    Sleep    4
    Press Keys    xpath://input[contains(@placeholder,'Insert Key')]    CTRL+A    DELETE
    Input Text    xpath://input[contains(@placeholder,'Insert Key')]    ${new_key}
    Press Keys    xpath://input[@placeholder='Insert Description']    CTRL+A    DELETE
    Input Text    xpath://input[@placeholder='Insert Description']    ${new_desc}
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button[2]
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button[2]
    #wait until toast notif is showing
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[1]/div    15
    Element Should Contain    xpath://*[@id="__next"]/div[1]/div    Access Control has been updated!
    Click Filter Button
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    5
    Page Should Contain    ${new_key}
    Page Should Contain    ${new_desc}
    Close Browser

*** Keywords ***
Login
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    xpath://input[@placeholder='ex: inovasi']    inovasi
    Input Text    xpath://input[@placeholder='ex: johnsmith@xxxxx.xxx']    nandamehisa@gmail.com
    Input Text    xpath://input[@placeholder='*****']    nanda05!!!
    Click Button    xpath://button[normalize-space()='Login']
    Sleep    8
    Wait Until Page Contains   Discover your experiences with Wowscreen    30
    Page Should Contain    Discover your experiences with Wowscreen
    Sleep    2

Go To Access Control
    Click Element    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[9]/div/span/div
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[9]/div/div/div[2]/span/a
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[9]/div/div/div[2]/span/a
    Sleep    3
    Wait Until Page Contains    Manage and monitor your Access Control    30

Click filter button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button    15
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2