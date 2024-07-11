*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Library    DataDriver    file=../resources/data_images.csv    dialect=excel    encoding=UTF-8
Test Template    Query And Write To File Template    
Suite Teardown    Disconnect From Database

*** Variables ***
${DBHost}         internal-rds-uat.cluster-cthn4dylzmeq.ap-southeast-1.rds.amazonaws.com
${DBName}         dh_article_master
${DBPass}         D4IlqPv0Yy
${DBPort}         5432
${DBUser}         postgres
${OUTPUT_FILE}    resources/output.csv




*** Test Cases ***
Query And Write To File    ${sku}    


*** Keywords ***
Query And Write To File Template
    [Arguments]    ${sku}
    Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
    ${queryResults} =    Query    select article_id,name_th,name_en from products where article_id = '${sku}' ;
    #Log To Console   ${queryResults}
    FOR    ${row}    IN    @{query_results}
        Append To File    ${OUTPUT_FILE}    ${row[0]}, ${row[1]}, ${row[2]}\n
    END