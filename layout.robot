*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***
#Create layout couldn't be automated

Search by Name
    Login
    Go To Layout
    Click Filter Button
    ${input_layout_true}    Set Variable    5
    Input Text    xpath://input[@placeholder='Search']    ${input_layout_true}
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${input_layout_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    4
    Input Text    xpath://input[@placeholder='Search']    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Preview Layout
    Login
    Go To Layout
    Click Filter Button
    ${input_layout_true}    Set Variable    5
    Input Text    xpath://input[@placeholder='Search']    ${input_layout_true}
    Sleep    4
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[2]   ${input_layout_true}
    Click Element    xpath://div[contains(@class,'page-header')]
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[6]/div/span/a/button
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div/table/tbody/tr[1]/td[6]/div/span/a/button
    Wait Until Page Contains    You can change your Layout information here    30
    Sleep    2
    Close Browser

Check Pagination
    Login
    Go To Layout
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

Go To Layout
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[8]/span/a
    Sleep    3
    Wait Until Page Contains   Manage and monitor your Layouts    30
    Page Should Contain    Manage and monitor your Layouts

Click filter button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button    30
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2