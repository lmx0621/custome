*** Settings ***
Suite Setup       用户登录
Library           RequestsLibrary
Library           Collections
Resource          ../Lib/参数配置.robot
Resource          ../Lib/操作库.robot
Library           OperatingSystem
Library           ApiTest

*** Test Cases ***
图片验证码
    [Tags]    ready
    #Log    app's value:${app}
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /common/generate_captcha?${data}
    Log    common/generate_captcha:${resp.content}

公用配置信息
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /common/public_config?${data}
    Log    common/public_config:${resp.content}

生成二维码
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /common/create_qr?${data}
    Log    common/create_qr:${resp.content}

首页加载广告
    [Tags]    ready
    ${data}    Set Variable    usersession=${usersession}&fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /common/loading_ad?${data}
    Log    common/loading_ad:${resp.content}

App检测更新
    [Tags]    ready
    ${data}    Set Variable    fromapp=${FROMAPP}
    ${resp}    Get Request    maisha    /common/check_up?${data}
    Log    common/check_up:${resp.content}

发送验证码
    [Documentation]    暂无法测试，需要输入图片验证码
    ${app}    Set Variable    ${ANDROID}
    ${action}    Set Variable    req
    ${data}    Set Variable    usersession=${usersession}&fromapp=${app}&action=${action}&phone=${PHONE}
    ${resp}    Get Request    maisha    /common/send_vercode?${data}
    Log    common/send_vercode:${resp.content}

图片上传
    Log    app's value:${app}
    ${filepath}    Join Path    ${CURDIR}    ..    Res    test.png
    ${cnpath}    Join Path    ${CURDIR}    ..    Res    test.txt
    Log    CNpath:${cnpath}
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${txtfile}    Get File    ${cnpath}
    ${uploadfile}    Get Binary File    ${filepath}
    &{file}=    Create Dictionary    file=${uploadfile}
    ${path}    Set Variable    avatar    #图片类型，如头像上传填写avatar，商品图片上传填写item
    ${crop}    Set Variable    200*200    #裁剪尺寸,如200*200，则裁剪为宽高都为200像素
    ${tag}    Set Variable    testing
    &{data}=    Create Dictionary    usersesseion=${usersession}    fromapp=${app}    path=${path}    crop=${crop}    tag=${tag}
    ${resp}    Post Request    maisha    /common/upload_file    data=&{data}    \    headers=&{headers}
    ...    files=&{file}
    Log    common/upload_file:${resp.content}

图片上传-YT
    [Tags]    ready
    ${filepath}    Join Path    ${CURDIR}    ..    Res    test2.png
    Upload File    ${usersession}    ${filepath}
