*** Settings ***
Library           AppiumLibrary

*** Keywords ***
切换Web视图
    ${contexts}    Get Contexts
    Log    Contexts: ${contexts}
    ${cur}    Get Current Context
    Log    Current Context is: ${cur}
    Switch To Context    ${contexts[1]}
    ${cur}    Get Current Context
    Log    Now,the context is: ${cur}

打开微信
    Open Application    http://localhost:4723/wd/hub    alias=wechat    platformName=Android    platformVersion=5.1.1    deviceName='emulator-5554'    appPackage=com.tencent.mm
    ...    appActivity=com.tencent.mm.ui.LauncherUI    unicodeKeyboard=True    resetKeyboard=True
    Wait Until Page Contains    微信    20s    等待超时
