*** Settings ***
Suite Setup       启动App
Suite Teardown    关闭App
Test Teardown     失败重启
Library           SongzAppiumLibrary
Resource          ../../Lib/常用操作.robot
Resource          ../../Lib/菜单库.robot
Resource          ../../Lib/系统按键.robot
Resource          ../../Lib/配置参数.robot
Resource          ../../Lib/调试库.robot
Resource          ../../Lib/功能库.robot

*** Test Cases ***
活动主题检查
    [Tags]    ready
    校验等待
    Sleep    2
    活动主题检测    4
    Sleep    2
    Log    ------活动主题检查-测试完成------

大家都在拼检查
    [Tags]    ready
    校验等待
    Sleep    2
    #${el}    Get Elements    xpath=//android.view.View[@resource-id='com.maishalei.seller:id/flexboxGroupBuyCommodities']/android.widget.LinearLayout
    #Log    ${el}
    大家都在拼检测
    Sleep    2
    Log    ------大家都在拼-测试完成------

搜索功能
    [Tags]    ready
    校验等待
    点击搜索
    Sleep    3s
    Input Text    xpath=//android.widget.EditText[@index='0']    儿童
    回车
    返回
    返回键
    取消
    Log    ------搜索功能-测试完成------

查看产品分类
    [Tags]    Smoke    ready
    #启动参数    ${model}    ${mode}
    Wait Until Page Contains Element    id=ivDiscover    ${TIMEOUT}
    Sleep    1
    点击分类
    #Log    开始分类检查...
    #Log To Console    开始分类检查...
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='母婴用品']    ${TIMEOUT}
    Run Keyword If    '${mode}'=='debug'    分类菜单检测-测试
    ...    ELSE IF    '${mode}'=='product'    分类菜单检测-生产
    ...    ELSE    Log    请输入正确的运行模式。
    Log    分类检查完成...
    Click Element    xpath=//android.widget.ImageView[@NAF='true']
    Log    ------查看产品分类-测试完成------

首页页面滑动
    [Tags]    Smoke    ready
    Wait Until Page Contains Element    id=ivDiscover    ${TIMEOUT}
    Sleep    1
    #${device}    Set Variable    medium
    向上滑动    3    500
    Sleep    1
    向下滑动    1    400
    Sleep    2
    返回顶部
    Sleep    2
    Log    ------首页页面滑动-测试完成------

封面产品检查
    [Tags]    ready
    校验等待
    Click Element    id=view_pager
    校验等待    标题
    Sleep    2
    向上滑动    2    400
    Sleep    1
    返回键
    Sleep    2
    Log    ------封面产品检查-测试完成------
