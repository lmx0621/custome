*** Variables ***
${QQUSER}         3504007366
${QQPASSWD}       8520123456
${TIMEOUT}        15
${LONGTIME}       15
@{desired_caps_avd}    http://localhost:4723/wd/hub    alias=maisha    platformName=Android    platformVersion=4.4.2    deviceName='emulator-5554'    appPackage=com.maishalei.seller.debug    appActivity=com.maishalei.seller.ui.activity.LauncherActivity
...               unicodeKeyboard=True    resetKeyboard=True
&{CAPS}           a=xx    b=x2    c=x3
${PHONE NUM}      13924628477
${PHONE PWD}      2580123456

*** Keywords ***
启动参数_bak
    ${device}    Set Variable    medium    # small/medium/big
    ${mode}    Set Variable    debug    # debug/product
    @{caps_avd}    Set Variable    http://localhost:4722/wd/hub    alias=maisha    platformName=Android    platformVersion=5.1.1    deviceName='emulator-5554'
    ...    appPackage=com.maishalei.seller.debug    appActivity=com.maishalei.seller.ui.activity.LauncherActivity    unicodeKeyboard=True    resetKeyboard=True
    @{caps_h6}    Set Variable    http://localhost:4723/wd/hub    alias=maisha    platformName=Android    platformVersion=4.4.2    deviceName='emulator-5554'
    ...    appPackage=com.maishalei.seller.debug    appActivity=com.maishalei.seller.ui.activity.LauncherActivity    unicodeKeyboard=True    resetKeyboard=True
    @{caps_mt2}    Set Variable    http://localhost:4724/wd/hub    alias=maisha    platformName=Android    platformVersion=5.1.1    deviceName='HUAWEI MT2-L01'
    ...    appPackage=com.maishalei.seller.debug    appActivity=com.maishalei.seller.ui.activity.LauncherActivity    unicodeKeyboard=True    resetKeyboard=True
    @{caps}    Run Keyword If    '${device}'=='medium'    Set Variable    @{caps_mt2}
    ...    ELSE IF    '${device}'=='small'    Set Variable    @{caps_avd}
    ...    ELSE IF    '${device}'=='big'    Set Variable    @{caps_h6}
    ...    ELSE    Log    请输入正确的设备规格。
    Set Global Variable    @{caps}
    #Log Many    @{desired_caps}    --打印完毕--

启动参数
    [Arguments]    ${getdevice}    ${getmode}
    ${device}    Set Variable    ${getdevice}    # small/medium/big
    ${mode}    Set Variable    ${getmode}    # debug/product
    Log    Device is: ${device}
    ${package}    Run Keyword If    '${mode}'=='debug'    Set Variable    com.maishalei.seller.debug
    ...    ELSE IF    '${mode}'=='product'    Set Variable    com.maishalei.seller
    ...    ELSE    Log    请输入正确的运行模式。
    ${activity}    Run Keyword If    '${mode}'=='debug'    Set Variable    com.maishalei.seller.ui.activity.LauncherActivity
    ...    ELSE IF    '${mode}'=='product'    Set Variable    .ui.activity.LauncherActivity
    ...    ELSE    Log    请输入正确的运行模式。
    ${host}    Run Keyword If    '${device}'=='small'    Set Variable    http://localhost:4722/wd/hub
    ...    ELSE IF    '${device}'=='medium'    Set Variable    http://localhost:4723/wd/hub
    ...    ELSE IF    '${device}'=='big'    Set Variable    http://localhost:4734/wd/hub
    ...    ELSE    Log    请输入正确的设备规格。
    &{caps}    Run Keyword If    '${device}'=='small'    Create Dictionary    alias=maisha    platformName=Android    platformVersion=5.1.1
    ...    deviceName='emulator-5554'    appPackage=${package}    appActivity=${activity}    unicodeKeyboard=True    resetKeyboard=True
    ...    ELSE IF    '${device}'=='medium'    Create Dictionary    alias=maisha    platformName=Android    platformVersion=5.1.1
    ...    deviceName='HUAWEI MT2-L01'    appPackage=${package}    appActivity=${activity}    unicodeKeyboard=True    resetKeyboard=True
    ...    ELSE IF    '${device}'=='big'    Create Dictionary    alias=maisha    platformName=Android    platformVersion=4.4.2
    ...    deviceName='emulator-5554'    appPackage=${package}    appActivity=${activity}    unicodeKeyboard=True    resetKeyboard=True
    ...    ELSE    Log    请输入正确的设备规格。
    #Set Global Variable    ${mode}
    Set Global Variable    &{caps}
    Set Global Variable    ${host}
    #Set Global Variable    ${device}
    #Log Many    @{desired_caps}    --打印完毕--
