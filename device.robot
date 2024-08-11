*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***
Search Device ID
    Login
    Go To Device
    Sleep    2
    Click Filter Button
    #true input
    Input Text    xpath://div[@class='table-filter']//div[1]//div[1]//div[1]//input[1]    ybn
    Sleep    4
    ${rows}    Get Element Count    //*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr
    Log To Console    ${rows}
    Table Should Contain   xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table    YBNNZGGY
    Sleep    2
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    3
    Input Text    xpath://div[@class='table-filter']//div[1]//div[1]//div[1]//input[1]    abc
    Sleep    4
    Page Should Contain    Sorry, no data available
    Sleep    2
    Close Browser

Search Device Name
    Login
    Go To Device
    Sleep    2
    Click Filter Button
    #true input
    ${input_device_true}    Set Variable    tizen
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[2]/div/div/input    ${input_device_true}
    Sleep    4
    ${capitalized_input_device_true}    Evaluate    "${input_device_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr/td[3]    ${capitalized_input_device_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    3
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[2]/div/div/input    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Check Device Status Filter
    Login
    Go To Device
    Sleep    2
    Click Filter Button
    #filter online
    Click Element    xpath://div[@class='YSelectContainer-group YSelectGroup']//input[@placeholder='Search']
    Click Element    //div[@value='online']
    Sleep    5
    #if all device is offline
    Page Should Contain    Sorry, no data available
    #reload page bcs click filter button not functionable for the 2nd time
    Execute Javascript    location.reload(true)
    Sleep    2
    #filter offline
    Click Filter Button
    Click Element    xpath://div[@class='YSelectContainer-group YSelectGroup']//input[@placeholder='Search']
    Click Element    xpath://div[@value='offline']
    Element Text Should Be    xpath://tr[contains(@aria-label,'enhanced-table-checkbox-0')]//div[@class='badge-content'][normalize-space()='Offline']    Offline
    Close Browser

Search Device Tag
    Login
    Go To Device
    Sleep    2
    Click Filter Button
    #true input
    ${input_tag_true}    Set Variable    android
    Input Text    xpath://input[@name='category']    ${input_tag_true}
    Sleep    4
    ${capitalized_input_tag_true}    Evaluate    "${input_tag_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[5]/td[8]    ${capitalized_input_tag_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    3
    Input Text    xpath://input[@name='category']    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Search Device Location
    Login
    Go To Device
    Sleep    2
    Click Filter Button
    #true input
    ${input_loc_true}    Set Variable    jakarta
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[5]/div/div/input    ${input_loc_true}
    Sleep    4
    ${capitalized_input_loc_true}    Evaluate    "${input_loc_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[5]    ${capitalized_input_loc_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    3
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[5]/div/div/input    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Preview Detail Device
    Login
    Go To Device
    Sleep    2
    Click Element    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[9]/div[1]/span[1]/button[1]
    #verifying pop up preview detail device is showing
    Element Should Be Visible    xpath://div[contains(@class,'YModal-body css-sebl9i')]
    Page Should Contain    Basic Info
    Page Should Contain    System Info
    Click Element    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Sleep    1
    Page Should Contain    Devices
    Close Browser

Detail Device
    Login
    Go To Device
    Sleep    2
    Click Element    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[9]/div[1]/span[2]/button[1]
    Sleep    2
    Wait Until Page Contains        You can change your Device information here    30
    #scroll until end of the page
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2
    Close Browser

Check Pagination
    Login
    Go To Device
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
    Wait Until Page Contains    Discover your experiences with Wowscreen    30
    Page Should Contain    Discover your experiences with Wowscreen
    Sleep    2

Go To Device
    Click Link    //*[@id="__next"]/div[3]/aside/div[2]/div/div[2]/span/a
    Sleep    3
    Wait Until Page Contains    Manage and monitor your Devices    30

Click filter button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button    30
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2

