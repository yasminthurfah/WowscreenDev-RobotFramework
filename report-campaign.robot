*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***
Check Timeline
    Login
    Go To Report Campaign
    Wait Until Element Is Enabled   xpath://button[normalize-space()='Timeline']    15 
    Click Button    xpath://button[normalize-space()='Timeline']
    Sleep    2
    Wait Until Element Is Enabled    xpath://button[contains(@title,'Previous month')]    15
    Click Button    xpath://button[contains(@title,'Previous month')]
    Sleep    2
    Wait Until Element Is Enabled    xpath://button[contains(@title,'Previous month')]    15
    Click Button    xpath://button[contains(@title,'Previous month')]
    Sleep    2
    Wait Until Element Is Enabled    xpath://button[@title='Next month']    15
    Click Button    xpath://button[@title='Next month']
    Sleep    2
    Wait Until Element Is Enabled    xpath://button[normalize-space()='today']    15
    Click Button    xpath://button[normalize-space()='today']
    Sleep    2
    Wait Until Element Is Enabled    xpath://button[normalize-space()='Expand']    15
    Click Button    xpath://button[normalize-space()='Expand']
    Sleep    2
    Wait Until Element Is Enabled    xpath://button[normalize-space()='Minimize']    15
    Click Button    xpath://button[normalize-space()='Minimize']
    Sleep    2
    Wait Until Element Is Enabled    xpath://button[normalize-space()='Week']   15
    Click Button    xpath://button[normalize-space()='Week']
    Sleep    2
    Wait Until Element Is Enabled    xpath://button[normalize-space()='List']   15
    Click Button    xpath://button[normalize-space()='List']
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    2
    Wait Until Element Is Enabled    xpath://button[normalize-space()='Table View']   15
    Click Button    xpath://button[normalize-space()='Table View']
    Sleep    2
    Wait Until Page Contains    All Campaigns    15
    Close Browser

Search by Name
    Login
    Go To Report Campaign
    Click Filter Button
    ${input_rep_campaign_true}    Set Variable    hello
    Input Text    xpath://input[@placeholder='Search']    ${input_rep_campaign_true}
    Sleep    4
    ${capitalized_input_rep_device_true}    Evaluate    "${input_rep_campaign_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${capitalized_input_rep_device_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    4
    Input Text    xpath://input[@placeholder='Search']    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Filter by Ratio
    Login
    Go To Report Campaign
    Click Filter Button
    Click Element    xpath://input[@placeholder='Select Ratio']
    #filter 16:9
    Wait Until Element Is Enabled    xpath://div[@value='3']    15
    Click Element    xpath://div[@value='3']
    Sleep    5
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[7]/td[5]    16:9
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    4
    #filter 3:1
    Click Element    xpath://input[@placeholder='Select Ratio']
    Wait Until Element Is Enabled    xpath://div[@value='2']    15
    Click Element    xpath://div[@value='2']
    Sleep    5
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[7]/td[5]    3:1
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    4
    #filter 2:1
    Click Element    xpath://input[@placeholder='Select Ratio']
    Wait Until Element Is Enabled    xpath://div[@value='1']    15
    Click Element    xpath://div[@value='1']
    Sleep    5
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    Close Browser

Filter by Status
    Login
    Go To Report Campaign
    Sleep    10
    Click Filter Button
    Click Element    xpath://div[@class='action']//div[3]//div[1]//div[1]
    #filter finished
    Click Element    xpath://div[@value='finished']
    Sleep    5
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[4]/div/div    finished
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    4
    #filter canceled
    Click Element    xpath://div[@class='action']//div[3]//div[1]//div[1]
    Click Element    xpath://div[@value='canceled']
    Sleep    5
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[4]/div/div    canceled
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    4
    #filter ready
    Click Element    xpath://div[@class='action']//div[3]//div[1]//div[1]
    Click Element    xpath://div[@value='ready']
    Sleep    5
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    Close Browser

Check Pagination
    Login
    Go To Report Campaign
    Sleep    2
    #click next
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[3]
    Sleep    2
    #click jump to first page
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[1]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[1]
    Sleep    2
    #click jump to last page
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[4]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[4]
    Sleep    2
    #click jump to prev page
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[2]
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/button[2]
    Sleep    2
    Close Browser

Preview Campaign Schedule
    Login
    Go To Report Campaign
    Click Filter Button
    ${input_rep_campaign_true}    Set Variable    hello
    Input Text    xpath://input[@placeholder='Search']    ${input_rep_campaign_true}
    Sleep    4
    ${capitalized_input_rep_device_true}    Evaluate    "${input_rep_campaign_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${capitalized_input_rep_device_true}
    Click Element    xpath://div[@class='page-header']
    Wait Until Element Is Enabled    xpath://tbody//div[1]//span[1]//button[1]
    Click Button    xpath://tbody//div[1]//span[1]//button[1]
    Sleep    4
    Wait Until Page Contains    Detail    15
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[2]/div/div[1]/div[1]/div[3]/div[1]/p[2]    ${capitalized_input_rep_device_true}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    #verify that pop up is closed properly
    Sleep    3
    Wait Until Page Contains    Display the list of campaign reports    15
    Close Browser

Detail Report Campaign
    Login
    Go To Report Campaign
    Click Filter Button
    ${input_rep_campaign_true}    Set Variable    hello
    Input Text    xpath://input[@placeholder='Search']    ${input_rep_campaign_true}
    Sleep    4
    ${capitalized_input_rep_device_true}    Evaluate    "${input_rep_campaign_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${capitalized_input_rep_device_true}
    Click Element    xpath://div[@class='page-header']
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[8]/div/span[2]/a/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[8]/div/span[2]/a/button
    Sleep    5
    Page Should Contain    Campaign Reports
    Page Should Contain    ${capitalized_input_rep_device_true}
    #check filter inside
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/span/button
    #check device ID filter
    Input Text    xpath://input[@name='serial']    W9I
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[2]    W9I
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Input Text    xpath://input[@name='serial']    ABC
    Sleep    4
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    #check device name filter
    Input Text    xpath://input[contains(@name,'alias')]   Tizen
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[3]    Tizen
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Input Text    xpath://input[contains(@name,'alias')]    ABC
    Sleep    4
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    #check device tags filter
    Input Text    xpath://input[contains(@name,'category')]   Samsung
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[9]    Samsung
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    3
    Input Text    xpath://input[contains(@name,'category')]   ABC
    Sleep    4
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    #check device location filter
    Input Text    xpath://input[@name='location']   Indonesia
    Sleep    4
    Click button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[2]/div/table/tbody/tr[1]/td[10]/div/span/a/button
    Sleep    4
    Page Should Contain    Indonesia
    Go Back
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/span/button    30
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div/div[1]/div[2]/span/button
    Input Text    xpath://input[@name='location']  ABC
    Sleep    4
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    #click anywhere to close filter textbox
    Click Element    xpath://div[contains(@class,'action-left')]
    #check download success
    Click Button    xpath://button[normalize-space()='Devices']
    #pop up success export pdf visible
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[1]/div    30
    Sleep    2
    Click Button    xpath://button[normalize-space()='Summaries']
    #pop up success export pdf visible
    Wait Until Element Is Visible    xpath://*[@id="__next"]/div[1]/div    30
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

Go To Report Campaign
    Click Element    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[6]/div/span/div
    Sleep    2
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[6]/div/div/div[3]/span/a
    Sleep    3
    Wait Until Location Is    https://tenant-wowscreen.inovasi.top/campaign-report
    Wait Until Page Contains    Display the list of campaign reports    30

Click filter button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button    30    
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2