*** Settings ***
Resource          API.robot

*** Keywords ***
Get_Headers
    [Arguments]    ${type}=json
    ####
    ${headers_json}    Create Dictionary    Accept-Language=zh-CN,zh;q=0.8    Accept-Encoding=gzip, deflate, sdch    Accept=application/json, text/plain, */*    Content-Type=application/json;charset=UTF-8    YT=debuging
    ${headers_form}    Create Dictionary    Accept-Language=zh-CN,zh;q=0.8    Accept-Encoding=gzip, deflate, sdch    Accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8     YT=debuging
    ${headers}    Set Variable If    '${type}'=='json'    ${headers_json}    ${headers_form}
    [Return]    ${headers}

获取近一个月内的随机时间
    ${time_now}    Get Time    epoch
    ${time_30day}    Evaluate    3600*24*30
    ${time1}    Evaluate    ${time_now}-${time_30day}
    Pass Execution    Test
    ${开始时间}    Evaluate    random.randint(${time1},${time_now})    random
    ${结束时间}    Set Variable    ${time_now}
