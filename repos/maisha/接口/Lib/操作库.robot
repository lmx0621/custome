*** Settings ***
Library           RequestsLibrary
Library           Collections
Resource          参数配置.robot
Library           json

*** Keywords ***
用户登录
    Create Session    maisha    ${BASEURL}    \    \    \    5
    ...    #http://127.0.0.1:8888
    &{data}=    Create Dictionary    fromapp=android    phone=${PHONE}    password=${PASSWORD}
    #&{headers}    Set Variable    Accept=application/json    Content-Type=application/json
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${resp}    Post Request    maisha    /user/login    data=${data}    headers=${headers}
    #Post Request    maisha    /user/login    ${json}
    Log    Response: ${resp}
    ${respcontent}    Evaluate    ${resp.content}
    Log    Response Content:${resp.content}
    Log    Response Text:${resp.text}
    #Print Json    ${resp}
    #${respjs}    RequestsLibrary.To Json    ${resp}
    ${respdata}    json.Loads    ${resp.content}
    Log    Json Data:${respdata}
    ${msg}    Get From Dictionary    ${respdata}    msg
    ${type}    Get From Dictionary    ${respdata}    type
    ${data}    Get From Dictionary    ${respdata}    data
    ${phone}    Get From Dictionary    ${data}    phone
    ${usersession}    Get From Dictionary    ${data}    usersession
    Set Suite Variable    ${usersession}
