*** Settings ***
Library           RequestsLibrary
Resource          ./配置参数.robot

*** Keywords ***
登录
    Create Session    wsh    ${URL}
    &{data}=    Create Dictionary    username=20151228    password=123456    captcha=1111
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    wsh    /login/login-ajax    data=${data}    headers=${headers}
