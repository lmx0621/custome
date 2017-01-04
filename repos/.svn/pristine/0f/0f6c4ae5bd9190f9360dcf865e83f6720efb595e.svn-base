*** Settings ***
Library           Selenium2Library
Resource          配置参数.robot
Resource          功能菜单.robot

*** Keywords ***
登陆
    Open Browser    ${url}    Chrome    #打开浏览器
    界面最大化
    Input Text    id=staff_id    ${username}    #输入用户名
    Input Text    id=password    ${password}    #输入密码
    Input Text    id=captcha    111111    #输入验证码
    Click Button    id=login    #点击登陆

界面最大化
    Maximize Browser Window

关闭浏览器
    Close All Browsers

获取分组名
    登陆
    点击链接菜单    微会员
    点击链接菜单    分组管理    #获取组名    #@{number}    create list    2    3
    ...    # 4    5    6    # 7    8    9
    ...    # 10
    : FOR    ${i}    IN    @{number}
    \    ${title}=    Get Webelements    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div/div/table/tbody
    #${title}    Get Text    xpath=//*[@id="main-container"]/div[1]/div[2]/div[2]/div/div/div/div/table/tbody/tr{j}/td[2]
    sleep    0.1
    LOG    ${title}

等待时间
    [Arguments]    ${time}=1s
    sleep    ${time}

对比校验
    [Arguments]    ${xxx}    ${expect}
    ${text}    Get Text    ${xxx}    #${xxx}是xpath路径
    #Should Contain    ${text}    ${expect}
    Run Keyword If    '${text}'=='${expect}'    log    校验通过
    ...    ELSE    log    校验失败

浏览器返回/后退
    Go Back
