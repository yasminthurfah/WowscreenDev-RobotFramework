*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome

*** Test Cases ***
Check Dashboard Button
    Login
    Click Link    xpath://div[@class='content-summaries']//div[1]//div[2]//div[1]//a[1]
    Sleep    3
    Page Should Contain    Manage and monitor your Devices
    Go To Dashboard
    Click Link    xpath://a[@href='/device?status=online']
    Sleep    3
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Sleep    2
    #verify that online filter is on
    Element Should Be Visible    xpath://input[@placeholder='Online']
    Go To Dashboard
    Click Link    xpath://a[@href='/device?status=offline']
    Sleep    3
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Sleep    2
    #verify that offline filter is on
    Element Should Be Visible    xpath://input[@placeholder='Offline']
    Go To Dashboard
    Click Link    //div[@class='content-summaries']//div[2]//div[2]//div[1]//a[1]
    Sleep    3
    Page Should Contain    Display the list of campaign reports
    Go To Dashboard
    Click Link    xpath://a[@href='/campaign-report?status=ongoing']
    Sleep    3
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Sleep    2
    #verify that ongoing campaign filter is on
    Element Should Be Visible    xpath://input[contains(@placeholder,'ongoing')]
    Go To Dashboard
    Click Link    xpath://a[@href='/campaign-report?status=ready']
    Sleep    3
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Sleep    2
    #verify that campaign ready filter is on
    Element Should Be Visible    xpath://input[@placeholder='ready']
    Go To Dashboard
    Click Link    xpath://a[@href='/campaign-report?status=canceled']
    Sleep    3
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Sleep    2
    #verify that campaign canceled filter is on
    Element Should Be Visible    xpath://input[@placeholder='canceled']
    Go To Dashboard
    Click Link    xpath://a[@href='/campaign-report?status=finished']
    Sleep    3
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[1]/div[2]/span/button
    Sleep    2
    #verify that campaign canceled filter is on
    Element Should Be Visible    xpath://input[@placeholder='finished']
    Go To Dashboard
    #campaign calendar (current month : march)
    Click Button    xpath://button[@title='Previous month']
    Sleep    2
    #Click Link    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[3]/div[2]/div[2]/div[2]/div/table/tbody/tr/td/div/div/div/table/tbody/tr[4]/td[4]/div/div[2]/div[6]/a
    #Sleep    2
    #Click Element    xpath://div[@class='content-calendar']
    Click Button    xpath://button[@title='Previous month']
    Click Button    xpath://button[normalize-space()='today']
    Sleep    2
    Click Button    xpath://button[normalize-space()='Expand']
    Sleep    2
    Click Button    xpath://button[normalize-space()='Minimize']
    #scroll until end of the page
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Link    xpath://div[@class='content-campaign-header']//a
    Sleep    4
    Location Should Be    https://tenant-wowscreen.inovasi.top/campaign-report
    Page Should Contain    Display the list of campaign reports
    Go To Dashboard
    Click Link    xpath://*[@id="__next"]/div[3]/section/main/div/div[3]/div[2]/div[2]/div[3]/div/div[1]/a
    Sleep    4
    Element Should Be Visible    xpath://div[@class='right']
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
    Sleep    2

Go To Dashboard
    Click Link    xpath://body/div[@id='__next']/div[@class='css-1o7mqcl']/aside[@class='open css-picsxz']/div[@class='container']/div[@class='menu']/div[1]/span[1]/a[1]
    Sleep    3
    Wait Until Page Contains    Discover your experiences with Wowscreen    30