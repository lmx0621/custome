*** Settings ***
Suite Setup       启动App
Suite Teardown    关闭App
Library           AppiumLibrary
Resource          ../../../Lib/常用操作.robot
Resource          ../../../Lib/菜单库.robot
Resource          ../../../Lib/系统按键.robot
Resource          ../../../Lib/配置参数.robot
Resource          ../../../Lib/调试库.robot

*** Test Cases ***
查看商品
    Wait Until Page Contains Element    id=ivDiscover    ${TIMEOUT}
    #Click Element    xpath=//android.view.View//android.widget.LinearLayout[@clickable='true']
    Sleep    2s
    #每日上新
    Click Element    xpath=//android.view.View[@id='com.maishalei.seller.debug:id/flexboxGroupBuyCommodities']/android.widget.LinearLayout[0]
    Sleep    2s
    #Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@id,'com.maishalei.seller:id/centerView')][contains(@text,'拼啥嘞')]    ${TIMEOUT}
    Wait Until Page Contains    拼啥嘞    ${TIMEOUT}
    向上滑动
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@NAF='true']    ${TIMEOUT}
    返回-Text
    #返回键

浏览心愿单商品
    Wait Until Page Contains Element    id=ivDiscover    10
    Sleep    2
    #${el}    Get Elements    xpath=//android.support.v7.widget.RecyclerView/android.widget.FrameLayout[2]
    #Log    ${el}
    :FOR    ${i}    IN RANGE    4
    \    ${e}    Evaluate    ${i}+${1}
    \    Log    The e is: ${e}
    \    Click Element    xpath=//android.support.v7.widget.RecyclerView/android.widget.FrameLayout[${e}]
    \    Sleep    1.5
    \    返回键
    \    Sleep    1
    #Click Element    xpath=//android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]
    Sleep    2
    Capture Page Screenshot
