*** Settings ***
Library           SeleniumLibrary    run_on_failure=None        
Library    DataDriver    file=../resources/data_images.csv  dialect=excel    encoding=utf-8
Test Template     Save image     
Test Teardown    Close Browser       

*** Test Cases ***
Save image magento v1   ${sku}    ${image}    ${unit}    ${order_by} 
    
    

*** Keywords ***
Save image 
    [Arguments]    ${sku}    ${url}    ${unit}    ${order_by}
    Open Browser    ${url}    headlesschrome
    Capture Page Screenshot    
    Element Should Be Visible    xpath=//*[@src="${url}"]    
    Capture Element Screenshot    xpath=//*[@src="${url}"]    filename=C:\\Automate_WEB\\Save_image\\pictures\\${sku}_${unit}(${order_by}).png