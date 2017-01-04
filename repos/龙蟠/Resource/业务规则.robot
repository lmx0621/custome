*** Keywords ***
向下取整
    [Arguments]    ${num}
    ${match_digits}    Evaluate    re.findall(r'(?<=\\d\\.)\\d*\\d','${num}')    re    #获取小数位数
    ${digits_len}    Run Keyword If    ${match_digits}    Get Length    ${match_digits[0]}
    ...    ELSE    Set Variable    ${0}
    ${match}    Run Keyword If    ${digits_len}>2    Evaluate    re.findall(r'\\d*\\d\\.\\d{2}','${num}')[0]    re
    ...    ELSE    Set Variable    ${num}
    ${price}    Evaluate    float(${match})
    [Return]    ${price}
