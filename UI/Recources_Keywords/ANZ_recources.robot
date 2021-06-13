*** Settings ***
Library    SeleniumLibrary
Library    Collections
Variables    ../PageObjectModel/ANZ_locators.py
Library    String
Library    ExcelRobot
Library    DateTime
Resource    ../Utils/utils.robot

*** Variables ***
${CURDIR}
${workBook}    ${CURDIR}${/}..\\testdata\\TestDataResults.xlsx
${URL_var}
${current_URL}    https://www.anz.com.au/personal/home-loans/calculators-tools/much-borrow/
${SPACE}
${errorResult_exp}    Based on the details you've entered, we're unable to give you an estimate of your borrowing power with this calculator.
${now}    Evaluate  '{dt:%B}-{dt.day}-{dt.year}'.format(dt=datetime.datetime.now())    modules=datetime
*** Keywords ***

Open ANZ_much_borrow page

    open browser   ${current_URL}  Chrome

    maximize browser window

    ${condition} =     Run keyword And Return Status    Wait Until Page Contains Element    ${page_borrow_hedingText_xpath}    timeout=5   error=false

    ${pageHeaderText}=    get text    ${page_borrow_hedingText_xpath}

    run keyword if    '${pageHeaderText}'=='How much could I borrow?'    log    *****'${pageHeaderText}', Page open successfully****
    ...    ELSE    fail    *****'${pageHeaderText}', Page NOT opened *****

    log to console    *****'${pageHeaderText}', Page open successfully****

    screenshot    Open_ANZ_application_SS

Your Earnings (Your income (before tax))
    open excel    ${workBook}
    [Arguments]    ${sheetname}    ${your_income}

    ${your_income_exp}=    read cell data by name    ${sheetname}    ${your_income}

    clear element text    ${your_income_beforetax_textbox_xpath}
    sleep    2s
    input text    ${your_income_beforetax_textbox_xpath}    ${your_income_exp}
    sleep    5s
    log to console    *****'${your_income_exp}', entered successfully in Your income (before tax) field****

    screenshot    YourIncome(before tax)Details_SS

Your Earnings (Your other income)
    open excel    ${workBook}
    [Arguments]    ${sheetname}    ${your_other_income}

    ${your_other_income_exp}=    read cell data by name    ${sheetname}    ${your_other_income}

    clear element text    ${Your_other_income_textbox_xpath}
    sleep    2s
    input text    ${Your_other_income_textbox_xpath}    ${your_other_income_exp}
    sleep    5s
    log to console    *****'${your_other_income_exp}', entered successfully in Your other income field****

    screenshot  YourOtherIncomeDeails_SS

Your Expenses (Living expenses)
    open excel    ${workBook}
    [Arguments]    ${sheetname}    ${living_expenses}

    ${living_expenses_exp}=    read cell data by name    ${sheetname}    ${living_expenses}

    clear element text    ${living_expenses_textbox_xpath}
    sleep    2s
    input text    ${living_expenses_textbox_xpath}    ${living_expenses_exp}
    sleep    5s
    log to console    *****'${living_expenses_exp}', entered successfully in Living expenses field****

    screenshot    LivingExpensesDeatils_SS

Your Expenses (Current home loan repayments)

    execute javascript  window.scrollTo(0, 600)
    sleep    2s
    open excel    ${workBook}
    [Arguments]    ${sheetname}    ${Current_home_loan_repayments}

    ${Current_home_loan_repayments_exp}=    read cell data by name    ${sheetname}    ${Current_home_loan_repayments}

    clear element text    ${current_home_loan_repayments_textbox_xpath}
    sleep    2s
    input text    ${current_home_loan_repayments_textbox_xpath}    ${Current_home_loan_repayments_exp}
    sleep    5s

    log to console    *****'${Current_home_loan_repayments_exp}', entered successfully in Current home loan repayments field****

    screenshot    CurrentHomeLoanRepaymentsDetails_SS

Your Expenses (Other loan repayments)
    open excel    ${workBook}
    [Arguments]    ${sheetname}    ${other_loan_repayments}

    ${other_loan_repayments_exp}=    read cell data by name    ${sheetname}    ${other_loan_repayments}

    clear element text    ${other_loan_repayments_textbox_xpath}
    sleep    2s
    input text    ${other_loan_repayments_textbox_xpath}    ${other_loan_repayments_exp}
    sleep    5s

    log to console    *****'${other_loan_repayments_exp}', entered successfully in Other loan repayments field****

    screenshot    OtherLoanRepaymentsDetails_SS

Your Expenses (Other commitments)
    open excel    ${workBook}
    [Arguments]    ${sheetname}    ${other_commitments}

    ${other_commitments_exp}=    read cell data by name    ${sheetname}    ${other_commitments}

    clear element text    ${other_commitments_textbox_xpath}
    sleep    2s
    input text    ${other_commitments_textbox_xpath}    ${other_commitments_exp}
    sleep    5s
    log to console    *****'${other_commitments_exp}', entered successfully in Other commitments field****

    screenshot    OtherCommitmentsDetails_SS

Your Expenses (Total credit card limits)
    open excel    ${workBook}
    [Arguments]    ${sheetname}    ${Total_credit_card_limits}

    ${Total_credit_card_limits_exp}=    read cell data by name    ${sheetname}    ${Total_credit_card_limits}

    clear element text    ${total_credit_card_limits_textbox_xpath}
    sleep    2s
    input text    ${total_credit_card_limits_textbox_xpath}    ${Total_credit_card_limits_exp}
    sleep    5s

    log to console    *****'${Total_credit_card_limits_exp}', entered successfully in Total credit card limits field****

    screenshot    TotalCreditCardLimitsDetails_SS

Click Work Out How Much I Could Borrow button

    ${errorResult_exp}    set variable    Based on the details you've entered, we're unable to give you an estimate of your borrowing power with this calculator.

    click element    ${workoutHowMuchIcouldborrow_button_xpath}
    sleep    5s

    ${status_estimateAmmount}=    run keyword and return status    element should be visible    ${borrowResultText_xpath}
    ${status_errorResult}=    run keyword and return status    element should be visible    ${borrowErrorText_xpath}

    ${estimateAmmount_act}=    run keyword if  '${status_estimateAmmount}'=='True'    get text    ${borrowResultText_xpath}
    ${errorResult_act}=    run keyword if  '${status_errorResult}'=='True'    get text    ${borrowErrorText_xpath}

    run keyword if  '${status_estimateAmmount}'=='True'    log to console    **** has a borrowing estimate of '${estimateAmmount_act}'****

    screenshot    WorkOutHowMuchICouldBorrowbutton_SS

    run keyword if  '${status_errorResult}'=='True' and """${errorResult_exp}""" in """${errorResult_act}"""    log to console    ****Some deatils are missing. Error message is displaying, ${errorResult_act}****

    screenshot    WorkOutHowMuchICouldBorrowbutton_SS

Click Start over button

    click element    ${startover_button_xpath}
    sleep    3s
    ${status}=    run keyword and return status    element should be visible    ${workoutHowMuchIcouldborrow_button_xpath}

    run keyword if    '${status}'=='True'    log    ****** Start over button clicked and form cleared successfully ******
    ...    ELSE    fail    ****** Start over button clicked  and form NOT cleared ******

    log to console    ****** Start over button clicked  and form cleared successfully ******

    screenshot    StartOverButton_SS

Close the browser
    close browser