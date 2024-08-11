*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome
${new_email}    hnrlzhhh@farmoaks.com
${new_name}    Hanaaa
${edit_name}    Hanna Aziza

*** Test Cases ***
#THIS IS AND END TO END TESTING FROM CREATE USER ACCOUNT UNTIL DELETE ACCOUNT
Create User Account
    Login
    Go To User Account
    Sleep    3
    Click Button    xpath://button[normalize-space()='Create']
    #wait until pop up is showing
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[2]    15
    Input Text    xpath://div[@class='split']//input[@placeholder='Insert Username']    hnrlzh
    Input Text    xpath://div[@class='split']//input[@placeholder='Insert Name']    ${new_name}
    Input Text    xpath://div[@class='split']//input[@placeholder='Insert Email']    ${new_email}
    Input Text    xpath://input[@placeholder='Insert Phone Number']    082143556172
    Click Element    xpath://input[@placeholder='Select Role']
    Click Element    xpath://div[@value='17']
    #click anywhere
    Click Element    xpath://p[normalize-space()='Create']
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button[2]
    #verify that pop up is showing
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[1]/div    15
    Element Should Contain    xpath://*[@id="__next"]/div[1]/div    User Account has been created!
    Sleep    5
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/div/div/div    ${new_name}
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[3]    ${new_email}
    Close Browser

Search by Name
    Login
    Go To User Account
    Click Filter Button
    #input true
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/input[1]    ${new_name}
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/div/div    ${new_name}
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/input[1]    olivia
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Search by email
    Login
    Go To User Account
    Click Filter Button
    #input true
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/input[1]    hnrl
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[3]   hnrl
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    #input false
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[1]/input[1]    oliv
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Preview User Account
    Login
    Go To User Account
    Click Filter Button
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/input[1]    ${new_name}
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/div/div    ${new_name}
    Click Element    xpath://div[contains(@class,'page-header')]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[5]/div/span[1]/button
    Wait Until Page Contains    Detail    10
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/dialog[3]/div[2]/div/div[2]        ${new_email}
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/dialog[3]/div[2]/div/div[2]        ${new_name}
    Sleep    2
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[3]/div[2]/div/div[3]/button
    Wait Until Element Is Enabled    xpath://button[normalize-space()='Create']
    Close Browser

Edit User Account
    Login
    Go To User Account
    Click Filter Button
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/input[1]    ${new_name}
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/div/div    ${new_name}
    Click Element    xpath://div[contains(@class,'page-header')]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[5]/div/span[2]/button
    Wait Until Page Contains    Edit    10
    Press Keys    xpath://div[@class='split']//input[@placeholder='Insert Name']    CTRL+A    DELETE
    Input Text    xpath://div[@class='split']//input[@placeholder='Insert Name']    ${edit_name}
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button[2]
    #verify that toast notification is showing
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[1]/div    15
    Element Should Contain    xpath://*[@id="__next"]/div[1]/div    User Account has been updated!
    Click Filter Button
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    5
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/div/div    ${edit_name}
    Close Browser

Delete Account
    Login
    Go To User Account
    Sleep    4
    Click Filter Button
    Input Text    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/input[1]    ${edit_name}
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/div/div    ${edit_name}
    Click Element    xpath://div[contains(@class,'page-header')]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[5]/div/span[3]/button
    Wait Until Page Contains    Are you sure?    15
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/dialog[3]/div/div[2]/button[2]    15
    Click Button    xpath://*[@id="__next"]/dialog[3]/div/div[2]/button[2]
    #verify toast notification is showing
    Wait Until Page Contains    User Account has been deleted!    15
    Click Filter Button
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    7
    Page Should Not Contain    ${edit_name}
    Page Should Not Contain    ${new_email}

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

Go To User Account
    Click Element    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[9]/div/span/div
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[9]/div/div/div[1]/span/a
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[9]/div/div/div[1]/span/a
    Sleep    3
    Wait Until Page Contains    Manage and monitor your User Account    30

Click filter button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button    15
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2