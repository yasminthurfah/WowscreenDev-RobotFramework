*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***
Search by Name
    Login
    Go To Report Device
    Click Filter Button
    ${input_rep_device_true}    Set Variable    baru
    Input Text    xpath://input[@placeholder='Search']    ${input_rep_device_true}
    Sleep    4
    ${capitalized_input_rep_device_true}    Evaluate    "${input_rep_device_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${capitalized_input_rep_device_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    4
    Input Text    xpath://input[@placeholder='Search']    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Preview Device
    Login
    Go To Report Device
    Click Filter Button
    ${input_rep_device_true}    Set Variable    baru
    Input Text    xpath://input[@placeholder='Search']    ${input_rep_device_true}
    Sleep    4
    ${capitalized_input_rep_device_true}    Evaluate    "${input_rep_device_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${capitalized_input_rep_device_true}
    Click Element    xpath://div[@class='page-header']
    Sleep    2
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/div/span[1]/button
    Sleep    3
    Page Should Contain    Detail
    #check maps box is visible
    Element Should Be Visible    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[2]/div[2]/div/div
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[2]/div[3]/div/div[2]/p[2]    ${capitalized_input_rep_device_true}
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Close Browser

Detail Report Device
    Login
    Go To Report Device
    Click Filter Button
    ${input_rep_device_true}    Set Variable    baru
    Input Text    xpath://input[@placeholder='Search']    ${input_rep_device_true}
    Sleep    4
    ${capitalized_input_rep_device_true}    Evaluate    "${input_rep_device_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${capitalized_input_rep_device_true}
    Click Element    xpath://div[@class='page-header']
    Sleep    2
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/div/span[2]/a/button
    Sleep    10
    Page Should Contain    Device Reports
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[2]/div[1]/div/p[2]    ${capitalized_input_rep_device_true}
    #check filter
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    #filter by name
    ${input_name_inside}    Set Variable    long
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[1]/div/div/input    ${input_name_inside}
    Sleep    4
    ${capitalized_input_name_inside}    Evaluate    "${input_name_inside}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[2]    ${capitalized_input_name_inside}
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[1]/div/div/input   paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    #filter by status
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[2]/div[1]/div/input
    Click Element    xpath://div[@value='finished']
    Sleep    4
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/div    finished
    Sleep    2
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[2]/div[1]/div/input
    Click Element    xpath://div[@value='canceled']
    Sleep    4
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/div    canceled
    Sleep    2
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[2]/div[1]/div/input
    Click Element    xpath://div[@value='ready']
    Sleep    4
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/div/div[2]/div[1]/div/div/input    ${input_name_inside}
    Sleep    4
    ${capitalized_input_name_inside}    Evaluate    "${input_name_inside}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[2]    ${capitalized_input_name_inside}
    Click Element    xpath://div[@class='page-header']
    Sleep    2
    Click Button    xpath://tbody//div[1]//span[1]//button[1]
    Sleep    3
    Page Should Contain    Detail
    Page Should Contain    ${capitalized_input_name_inside}
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[8]/div/span[2]/a/button
    Sleep    5
    Page Should Contain    Report Device
    Page Should Contain    ${capitalized_input_rep_device_true}
    Scroll Element Into View    xpath://div[contains(@class,'card chart')]
    Sleep    2
    Close Browser

Check Pagination
    Login
    Go To Report Device
    Sleep    2
    #click next
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[3]
    Sleep    2
    #click jump to first page
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[1]
    Sleep    2
    #click jump to last page
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[4]
    Sleep    2
    #click jump to prev page
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[2]
    Sleep    2
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

Go To Report Device
    Click Element    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[6]/div/span/div
    Sleep    2
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[6]/div/div/div[1]/span/a
    Sleep    3
    Wait Until Page Contains    Display the list of device reports
    Page Should Contain    Display the list of device reports

Click filter button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2