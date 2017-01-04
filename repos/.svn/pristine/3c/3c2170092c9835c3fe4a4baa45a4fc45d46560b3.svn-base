*** Settings ***
Suite Setup       用户登录
Library           RequestsLibrary
Library           json
Library           Collections
Library           OperatingSystem
Resource          ../Lib/参数配置.robot
Resource          ../Lib/操作库.robot

*** Variables ***

*** Test Cases ***
获取用户信息
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /user/get_info?${data}
    Log    user/get_info:${resp.content}

账户资金
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /user/get_money_info?${data}
    Log    user/get_money_info:${resp.content}

检测手机号
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}&phone=${PHONE}
    ${resp}    Get Request    maisha    /user/check_phone?${data}
    Log    user/check_phone:${resp.content}

获取店铺信息
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /user/get_store_info?${data}
    Log    user/get_store_info:${resp.content}

更新用户昵称
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}&nickname=YYTT
    ${resp}    Get Request    maisha    /user/update_nickname?${data}
    Log    user/update_nickname:${resp.content}

检测登录
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /user/check_login?${data}
    Log    user/check_login:${resp.content}

设置用户标签
    &{data}=    Create Dictionary    usersesseion=${usersession}    fromapp=${app}    tag_ids=${tag}
    ${resp}    Post Request    maisha    /user/update_nickname?${data}
    Log    user/set_tag:${resp.content}

是否设置店铺信息
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /user/is_already_set_store?${data}
    Log    user/is_already_set_store:${resp.content}

更新个性签名
    [Tags]    ready
    ${signature}    Set Variable    Y_T
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}&signature=${signature}
    ${resp}    Get Request    maisha    /user/update_signature?${data}
    Log    user/update_signature:${resp.content}

*** Keywords ***
