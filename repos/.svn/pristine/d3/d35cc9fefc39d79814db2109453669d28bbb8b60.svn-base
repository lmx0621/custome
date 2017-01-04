*** Settings ***
Suite Setup       用户登录
Library           RequestsLibrary
Library           json
Library           Collections
Library           OperatingSystem
Library           ApiTest

*** Test Cases ***
获取用户信息
    Maisha User Getinfo    ${session}    android

生成二维码
    Maisha Get Qrcode    ${session}    android    test

获取图片验证码
    Maisha Generate Captcha    ${session}    android

获取用户公共信息
    Maisha Public Config    ${session}    android

检查版本更新
    Maisha Check Up    android

*** Keywords ***
用户登录
    ${session}    Maisha User Login    android    13828821487    2580123456
    Set Suite Variable    ${session}
