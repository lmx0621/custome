*** Settings ***
Suite Setup       启动App
Suite Teardown    关闭App
Library           AppiumLibrary
Resource          ../../../Lib/常用操作.robot
Resource          ../../../Lib/菜单库.robot
Resource          ../../../Lib/系统按键.robot
Resource          ../../../Lib/配置参数.robot

*** Test Cases ***
每日上新
    Wait Until Page Contains Element    id=ivDiscover    ${TIMEOUT}
    Sleep    3s
    ${result}=    Run Keyword And Return Status    每日上新
    Log    运行结果：${result}
    #Run Keyword If    '${status}' == 'PASS'    Log    Passed
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='关闭']    ${TIMEOUT}
    关闭
    Click Element    xpath=//android.widget.TextView[@NAF='true']

新人领券
    Wait Until Page Contains Element    id=ivDiscover    ${TIMEOUT}
    Sleep    1.5s
    新人领券
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@NAF='true']    ${TIMEOUT}
    Sleep    4s
    ${a}    Get Contexts
    Log    Contexts: ${a}
    ${b}    Get Current Context
    Log    Current Context is: ${b}
    Switch To Context    ${a[1]}
    Click Element    id=btn-start
    Switch To Context    ${a[0]}
    返回-Text

全球秒杀
    Wait Until Page Contains Element    id=ivDiscover    ${TIMEOUT}
    等待
    全球秒杀
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@NAF='true']    ${TIMEOUT}
    Sleep    2s
    向上滑动    3
    向左滑动
    返回-Text

韩国馆
    Wait Until Page Contains Element    id=ivDiscover    ${TIMEOUT}
    Sleep    2s
    韩国馆
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@NAF='true']    ${LONGTIME}
    Sleep    2s
    返回-Text
