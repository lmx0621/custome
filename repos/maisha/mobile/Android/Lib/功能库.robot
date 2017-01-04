*** Settings ***
Resource          系统按键.robot
Resource          常用操作.robot

*** Keywords ***
活动主题检测
    [Arguments]    ${n}=4
    : FOR    ${i}    IN RANGE    ${n}
    \    ${e}    Evaluate    ${i}+${1}
    \    Log    The e is: ${e}
    \    Click Element    xpath=//android.support.v7.widget.RecyclerView/android.widget.FrameLayout[${e}]
    \    Sleep    1.5
    \    返回键
    \    Sleep    1

大家都在拼检测
    [Arguments]    ${n}=3
    : FOR    ${i}    IN RANGE    ${n}
    \    ${e}    Evaluate    ${i}+${1}
    \    Log    The e is: ${e}
    \    Click Element    xpath=//android.view.View[@resource-id='com.maishalei.seller.debug:id/flexboxGroupBuyCommodities']/android.widget.LinearLayout[${e}]
    \    校验等待    分享
    \    Sleep    1.5
    \    返回键
    \    Sleep    1
    #Click Element    xpath=//android.support.v7.widget.RecyclerView/android.widget.FrameLayout[1]
