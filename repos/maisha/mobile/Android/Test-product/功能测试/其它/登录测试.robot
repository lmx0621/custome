*** Settings ***
Library           SongzAppiumLibrary
Resource          ../../../Lib/常用操作.robot
Library           String

*** Test Cases ***
QQ登录
    启动App
    Wait Until Page Contains Element    id=ivDiscover    10
    Sleep    2
    Click Element    id=ivMine
    Sleep    1
    ${status}    状态判断-不应该包含    //android.widget.TextView[@text='我的订单']
    Run Keyword If    '${status}'=='False'    退出登录
    Click Element After Find It    id=ivQQLogin
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='QQ登录']    8
    Sleep    1
    #Click Element    xpath=//android.widget.Button[@text='登录']
    Click Element    xpath=//android.widget.Button[contains(@clickable,'true')][contains(@index,'1')]
    Sleep    5
    Page Should Contain Element    xpath=//android.widget.TextView[@text='我的订单']
    Page Should Contain Text    日志
    Log    ---Over---
    Sleep    2
    Close All Applications

微博登录
    Click Element    xpath=//android.widget.Button[@text='确定']
    Sleep    2
    Input Text    id=etLoginUsername    ${微博账号}
    Input Password    id=etPwd    ${微博密码}
    Click Element    id=bnLogin
    Sleep    5

微信登录

手机密码登录
    ${status}    状态判断-不应该包含    //android.widget.TextView[@text='我的订单']
    Run Keyword If    '${status}'=='False'    退出登录
    Input Text    id=etPhoneByPwd    ${phone num}
    Input Password    id=etPwdByPwd    ${phone pwd}

手机验证码登录
    启动App    #Open Application    http://localhost:4723/wd/hub    alias=memo    platformName=Android    platformVersion=5.1.1    deviceName='emulator-5554'
    ...    # appPackage=com.maishalei.seller    # appActivity=.ui.activity.LauncherActivity    unicodeKeyboard=True    resetKeyboard=True
    Wait Until Page Contains Element    id=ivDiscover    10
    #Start Activity    com.maishalei.seller    .ui.activity.LauncherActivity
    Sleep    2
    Click Element    id=ivMine
    Sleep    1
    ${status}    状态判断-不应该包含    //android.widget.TextView[@text='我的订单']
    Run Keyword If    '${status}'=='False'    退出登录
    Click Element    id=tvLoginHeaderBySMSCode
    Sleep    2
    Input Text    id=etPhoneBySMSCode    13924628477
    Click Element    id=btnResendBySMSCode
    Sleep    18
    #-------------------------------------
    Start Activity    com.android.contacts    com.android.mms.ui.ConversationList
    Sleep    2
    Click Element    xpath=//huawei.android.widget.TimeAxisWidget//android.widget.TextView[@text='通知信息']
    Sleep    1
    Click Element    xpath=//android.widget.TextView[@text='1069036572380227']
    Sleep    1
    @{el}    Get Elements    xpath=//huawei.android.widget.TimeAxisWidget
    Log    '@{el}'
    ${num}=    Get Count    '@{el}'    element=
    Log    Length is: '@{el}'
    Log    Num is : ${num}
    ${message}    Get Element Attribute    xpath=//huawei.android.widget.TimeAxisWidget[${num}]//android.widget.TextView[@resource-id='com.android.contacts:id/text_view']    text
    Log    Message: ${message}
    ${code}    Get Regexp Matches    ${message}    \\d{4,}
    Log    Code is: ${code}[0]
    ${code0}    Evaluate    ${code}[0]
    Log    Code[0] is: ${code0}
    ${codeint}    Evaluate    int(${code}[0])
    Log    Code Int is: ${codeint}
    #${codenum}    Convert To Integer    ${code}[0]
    ${code2}    Get Substring    ${message}    7    11
    Log    Code2 is: ${code2}
    ${time}    Get Time
    ${memo}=    Set Variable    ${time} 验证码：${code0}    #-----------------------------------    #Open Application    http://localhost:4723/wd/hub    alias=memo
    ...    # platformName=Android    platformVersion=5.1.1    deviceName='emulator-5554'    appPackage=com.maishalei.seller    # appActivity=.ui.activity.LauncherActivity    unicodeKeyboard=True
    ...    # resetKeyboard=True
    #Wait Until Page Contains Element    id=ivDiscover    10
    Start Activity    com.maishalei.seller    .ui.activity.LauncherActivity
    Wait Until Page Contains Element    id=ivDiscover    10
    Sleep    2
    Click Element    id=ivMine
    Sleep    1
    Click Element    id=tvLoginHeaderBySMSCode
    Sleep    1
    Capture Page Screenshot
    Input Text    id=etPhoneBySMSCode    13924628477
    Input Text    id=etCodeBySMSCode    ${code0}
    Click Element    id=btnLoginBySMSCode
    #Input Text    xpath=//android.widget.EditText[@NAF='true']    ${memo}
    Sleep    5
    Capture Page Screenshot
    Close All Applications

退出登录
    #Open Application    http://localhost:4723/wd/hub    alias=memo    platformName=Android    platformVersion=5.1.1    deviceName='emulator-5554'    appPackage=com.maishalei.seller
    # appActivity=.ui.activity.LauncherActivity    unicodeKeyboard=True    resetKeyboard=True
    启动App
    Wait Until Page Contains Element    id=ivDiscover    10
    #Start Activity    com.maishalei.seller    .ui.activity.LauncherActivity
    Sleep    2
    Click Element    id=ivMine
    Sleep    1
    Click Element    id=layoutUserLogined
    向上滑动    1
    Sleep    2
    Click Element    id=btnLogout
    Sleep    3
    Close All Applications

*** Keywords ***
退出登录
    Click Element After Find It    id=layoutUserLogined
    Sleep    1
    向上滑动    1
    Sleep    2
    Click Element    id=btnLogout
    Sleep    3
    Click Element    id=ivMine
    Sleep    1
