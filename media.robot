*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://tenant-wowscreen.inovasi.top/login
${browser}    chrome
${programmatic_name}    Test Create Vast
${input_programmatic}    https://insight.adsrvr.org/enduser/vast/?t=1&iid=1117e108-0fc8-4deb-bb39-269ccd21ac43&crid=6qp28kls&wp=1E3C474A7388FC3B&aid=1&wpc=USD&sfe=1546abda&puid=&tdid=&pid=tdpartnerid&ag=gbfodsu&adv=cxpowqgj&sig=109qcfqi4iunOv7j1IDUuxJRfPicUfsWuGOXE7ZGwrBw.&bp=3&cf=2470078&fq=0&td_s=api.signage.co.id&rcats=&mcat=&mste=&mfld=4&mssi=&mfsi=&uhow=14&agsa=&rgz=&svbttd=1&dt=OutOfHome&osf=Windows&os=Windows10&br=Chrome&rlangs=en&mlang=&svpid=22398&did=TRD-22398-0000a&rcxt=Other&lat=&lon=&tmpc=&daid=&vp=0&osi=&osv=&mk=Google&mdl=Chrome%20-%20Windows&vpb=MidRoll&dc=14&vcc=CA8QFBgUMgIIAjoECAEIAkABUAWIAQKgAawCqAFkyAEB0AED6AEDgAIDigIECAIIA5oCAKACAqgCALACALgCAMACAQ..&sv=rubicon&pidi=1&advi=17926&cmpi=1834903&agi=12749614&cridi=25403313&svi=5&tid=1&cmp=3106zl5&vrtd=14,15&srca=1&rurl=https%3a%2f%2fapi.signage.co.id%2fapi%2frubicon&tsig=-DTGhWa8q-mSC4oq2UdhGLIoSmqezL1t-EPWv1nSQT4.&c=MAU4AEgAUAFYAYABAIgBApABALABALoBBAgUGAY.&dur=&durs=UJSBm-&crrelr=&ipl=2172486&pcm=3&ppif=1&said=35104812d3a212043e5984869ee1cef268fb1f0c&ict=Unknown&impx=2&auct=3&im=1&mc=18c74e02-a796-47ff-86ff-24b95bb7a25f&tail=1
${edit_programmatic_name}    Test Edit Name
${edit_input_programmatic}    https://pub.lmx.ai/ssp-project/api/v2/rest/dv/a?refId=MYS-MOV-D-00000-10802&deal=GD-00000-02776&lineItemId=656989667badf712811ec94a
${edit_duration}    30

*** Test Cases ***
#pre-condition : upload 1 media image before running test case (for delete media test case)
#upload image couldn't be automated
Search Media by Name
    Login
    Go To Media
    Click Filter Button
    #true input
    ${input_name_true}    Set Variable    avatar
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[2]/div/div[2]/div[1]/div/div/input    ${input_name_true}
    Sleep    4
    ${capitalized_input_name_true}    Evaluate    "${input_name_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[3]/td[2]    ${capitalized_input_name_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    3
    Input Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[2]/div/div[2]/div[1]/div/div/input    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Filter by Type
    Login
    Go To Media
    Click Filter Button
    #image filter
    Click Element    xpath://input[@placeholder='Select Type']
    Click Element    xpath://div[@value='image']
    Sleep    5
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[1]/td[3]    image
    #video filter
    Click Element    xpath://div[@value='video']
    Sleep    5
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[1]/td[3]    video
    #text filter
    Click Element    xpath://div[@value='text']
    Sleep    5
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[1]/td[3]    text
    Close Browser

Search by Tag
    Login
    Go To Media
    Click Filter Button
    #true input
    ${input_tag_true}    Set Variable    agus
    Input Text    xpath://input[contains(@name,'category')]   ${input_tag_true}
    Sleep    4
    ${capitalized_input_tag_true}    Evaluate    "${input_tag_true}".capitalize()
    Table Should Contain    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[1]/td[5]   ${capitalized_input_tag_true}
    #false input
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    Sleep    3
    Input Text    xpath://input[contains(@name,'category')]    paris
    Sleep    4
    Page Should Contain    Sorry, no data available
    Close Browser

Preview Media
    Login
    Go To Media
    Click Button    xpath://tbody/tr[@aria-label='enhanced-table-checkbox-0']/td/div/span/button[1]
    Sleep    5
    Click Element    xpath://div[@class='YBox-root close css-87s48d']
    Close Browser

Edit Media
    Login
    Go To Media
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[11]/td[6]/div/div/span/button
    #click edit button
    Click Element    //*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[11]/td[6]/div/div/div/div[1]
    Page Should Contain    Update
    Press Keys    xpath://input[contains(@placeholder,'Input here..')]    CTRL+A    DELETE
    Input Text    xpath://input[contains(@placeholder,'Input here..')]    Halo ini Testing
    ${input_edit_media}    Get Value    xpath://input[contains(@placeholder,'Input here..')]
    Log To Console    ${input_edit_media}
    Click Button    xpath://button[normalize-space()='Save Changes']
    Sleep    2
    Page Should Contain    ${input_edit_media}
    Sleep    2
    Close Browser

Delete Media
    Login
    Go To Media
    Click Filter Button
    Click Element    xpath://input[@placeholder='Select Type']
    Click Element    xpath://div[@value='image']
    Sleep    5
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[3]/div[2]/button[4]
    Sleep    3
    ${deleted_media}    Get Text    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[3]/td[2]/div
    Log To Console    ${deleted_media}
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[3]/td[6]/div/div/span/button
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/div/table/tbody/tr[3]/td[6]/div/div/div/div[2]
    Sleep    2
    Click Button    xpath://button[normalize-space()='Confirm']
    Sleep    4
    Page Should Not Contain    ${deleted_media}
    Close Browser

(Programmatic) Create Media Programmatic
    Login
    Go To Media
    Click Button    xpath://button[normalize-space()='Programmatic']
    Sleep    4
    Click Button    xpath://button[normalize-space()='Create']
    Sleep    2
    Click Element    xpath://input[@placeholder='Select Type']
    Click Element    xpath://div[@value='1']
    Input Text    xpath://input[@placeholder='ex: Vast ']    ${programmatic_name}
    Press Keys    xpath://input[@placeholder='ex: 15']   CTRL+A    DELETE
    Input Text    xpath://input[@placeholder='ex: 15']    20
    Input Text    xpath://input[@placeholder='Input Here..']    ${input_programmatic}
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[3]/div[2]/div/div[3]/button[2]
    Sleep    2
    Page Should Contain    ${programmatic_name}
    Close Browser

(Programmatic) Preview Media Programmatic
    Login
    Go To Media
    Click Button    xpath://button[normalize-space()='Programmatic']
    Sleep    4
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/table/tbody/tr[1]/td[4]/div/span/button
    Sleep    2
    Page Should Contain    ${programmatic_name}
    Page Should Contain    ${input_programmatic}
    Scroll Element Into View    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Sleep    3
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Page Should Contain    Manage and monitor your Media Programmatic
    Close Browser

(Programmatic) Edit Media Programmatic
    Login
    Go To Media
    Click Button    xpath://button[normalize-space()='Programmatic']
    Sleep    4
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/table/tbody/tr[1]/td[4]/div/div/span/button
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/table/tbody/tr[1]/td[4]/div/div/div/div[1]
    Page Should Contain    Update
    Press Keys    xpath://input[@placeholder='ex: Vast ']    CTRL+A    DELETE
    Input Text    xpath://input[@placeholder='ex: Vast ']    ${edit_programmatic_name}
    Press Keys    xpath://input[@placeholder='ex: 15']   CTRL+A    DELETE
    Input Text    xpath://input[@placeholder='ex: 15']    ${edit_duration}
    Press Keys    xpath://input[@placeholder='Input Here..']    CTRL+A    DELETE
    Input Text    xpath://input[@placeholder='Input Here..']    ${edit_input_programmatic}
    Click Button    xpath://button[normalize-space()='Save Changes']
    Sleep    4
    Page Should Contain    ${edit_programmatic_name}
    #verify edit result
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/table/tbody/tr[1]/td[4]/div/span/button
    Page Should Contain    ${edit_programmatic_name}
    Page Should Contain    ${edit_duration}
    Page Should Contain    ${edit_input_programmatic}
    Click Button    xpath://*[@id="__next"]/div[3]/section/dialog[2]/div[2]/div/div[3]/button
    Close Browser

(Programmatic Delete Media)
    Login
    Go To Media
    Click Button    xpath://button[normalize-space()='Programmatic']
    Sleep    4
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/table/tbody/tr[1]/td[4]/div/div/span/button
    Click Element    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/table/tbody/tr[1]/td[4]/div/div/div/div[2]
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/dialog[3]/div/div[2]/button[2]
    Click Button    xpath://*[@id="__next"]/dialog[3]/div/div[2]/button[2]
    Sleep    4
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/table/tbody/tr[1]/td[4]/div/span/button
    Page Should Not Contain    ${edit_programmatic_name}
    Close Browser

(Programmatic) Search Media
    Login
    Go To Media
    Click Button    xpath://button[normalize-space()='Programmatic']
    Sleep    4
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/span[2]/div/span/button
    #true input
    Input Text    xpath://input[@placeholder='Search']    IDN
    Sleep    3
    Element Text Should Be    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[2]/div/table/tbody/tr[1]/td[2]    IDN
    Click Element    xpath://div[@class='badge css-1m78xyz']//div[@class='badge']
    #false input
    Input Text    xpath://input[@placeholder='Search']    paris
    Sleep    3
    Page Should Contain    Sorry, no data available
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

Go To Media
    Click Link    xpath://*[@id="__next"]/div[3]/aside/div[2]/div/div[3]/span/a
    Sleep    3
    Wait Until Page Contains    Manage and monitor your Media    15

Click filter button
    Wait Until Element Is Enabled    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[2]/span/button    15
    Click Button    xpath://*[@id="__next"]/div[3]/section/main/div/div[4]/div[1]/div[2]/span/button
    Page Should Contain    FILTERS
    Sleep    2