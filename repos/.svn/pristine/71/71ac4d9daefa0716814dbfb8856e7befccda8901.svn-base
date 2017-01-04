*** Settings ***
Suite Setup       启动App
Library           AppiumLibrary
Resource          ../../../Lib/常用操作.robot
Resource          ../../../Lib/功能菜单.robot
Resource          ../../../Lib/系统按键.robot

*** Test Cases ***
每日上新
    Wait Until Page Contains Element    id=ivDiscover
    每日上新
    关闭
    Click Element    xpath=//android.widget.TextView[@NAF='true']

新人领券
    Wait Until Page Contains Element    id=ivDiscover
    新人领券
    Sleep    2s
    返回-Text

全球秒杀
    Wait Until Page Contains Element    id=ivDiscover
    全球秒杀
    Sleep    2s
    返回-Text

韩国馆
    Wait Until Page Contains Element    id=ivDiscover
    韩国馆
    Sleep    2s
    返回-Text
