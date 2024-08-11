*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***
#Creating campaigns cannot be automated because when creating a schedule, XPath cannot retrieve the content of one cell in the schedule table (one row only)

Search by Name
    Login
    Go To Campaign
    Click Filter Button
    ${input_campaign_true}    Set Variable    timezone
    Input Text    xpath://input[@placeholder='Search']    ${input_campaign_true}
    Sleep    4
    ${capitalized_input_campaign_true}    Evaluate    "${input_campaign_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]    ${capitalized_input_campaign_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    4
    Input Text    xpath://input[@placeholder='Search']    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Search by Ratio
    Login
    Go To Campaign
    Click Filter Button
    Click Element    xpath://input[contains(@placeholder,'Select Ratio')]
    Click Element    xpath://div[@value='3']
    Sleep    4
    #${ratio_chosen}    Get Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[2]/div[2]/div[3]
    #Log To Console    ${ratio_chosen}
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[5]/td[5]    16:9
    Sleep    3
    #reset
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    5
    Click Element    xpath://input[contains(@placeholder,'Select Ratio')]
    Click Element    xpath://div[@value='2']
    Sleep    4
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[5]    3:1
    Close Browser

Search by Status
    Login
    Go To Campaign
    Click Filter Button
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[3]/div[1]/div/input
    #filter campaign ready
    Click Element    xpath://div[@value='ready']
    Sleep    5
    Wait Until Element Is Visible    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/div[1]/div[1]    15  
    Element Text Should Be    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/div[1]/div[1]    ready
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    4
    #filter ongoing
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[3]/div[1]/div/input
    Click Element    xpath://div[@value='ongoing']
    Sleep    5
    Wait Until Element Is Visible    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/div[1]/div[1]    15  
    Element Text Should Be    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/div[1]/div[1]    ongoing
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    4
    #filter finished
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[3]/div[1]/div/input
    Click Element    xpath://div[contains(@value,'finished')]
    Sleep    5
    Wait Until Element Is Visible    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/div[1]/div[1]    15  
    Element Text Should Be    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/div[1]/div[1]    finished
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    4
    #filter canceled
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[3]/div[1]/div/input
    Click Element    xpath://div[@value='canceled']
    Sleep    5
    Wait Until Element Is Visible    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/div[1]/div[1]    15    
    Element Text Should Be    xpath://body[1]/div[1]/div[3]/section[1]/main[1]/div[1]/div[3]/div[2]/div[1]/table[1]/tbody[1]/tr[1]/td[4]/div[1]/div[1]    canceled
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    4
    #filter pending
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[3]/div[1]/div/input
    Click Element    xpath://div[@value='pending']
    Sleep    5
    Wait Until Page Contains  Sorry, no data available    15
    Page Should Contain    Sorry, no data available
    Click Element    xpath://div[contains(text(),'Reset')]
    Sleep    4
    #filter reject
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/div/div[2]/div[3]/div[1]/div/input
    Click Element    xpath://div[@value='rejected']
    Sleep    5
    Wait Until Page Contains  Sorry, no data available    15
    Page Should Contain    Sorry, no data available
    Close Browser

Preview Campaign
    Login
    Go To Campaign
    Click Filter Button
    ${input_campaign_true}    Set Variable    timezone
    Input Text    xpath://input[@placeholder='Search']    ${input_campaign_true}
    Sleep    4
    ${capitalized_input_campaign_true}    Evaluate    "${input_campaign_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]    ${capitalized_input_campaign_true}
    Click Element    xpath://div[contains(@class,'page-header')]//div//div
    Sleep    2
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[7]/div/span/button
    Sleep    4
    Element Should Contain    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[2]/div/div[1]/div[1]/div[3]/div[1]/p[2]    ${capitalized_input_campaign_true}
    Page Should Contain    Your Selection
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Sleep    2

Check Pagination
    Login
    Go To Campaign
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

Go To Campaign
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[5]/span/a
    Sleep    3
    Wait Until Page Contains    Manage and monitor your Campaigns    15

Click filter button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button    30
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2