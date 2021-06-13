*** Settings ***
Library     SeleniumLibrary
Resource    ../Recources_Keywords/ANZ_recources.robot

*** Test Cases ***
TC_ANZ_001

    [Documentation]    1.	A person with the all details:

    open anz_much_borrow page
    your earnings (your income (before tax))    ANZ_Data    C2
    your earnings (your other income)    ANZ_Data    D2
    your expenses (living expenses)    ANZ_Data    E2
    your expenses (current home loan repayments)    ANZ_Data    F2
    your expenses (other loan repayments)    ANZ_Data    G2
    your expenses (other commitments)    ANZ_Data    H2
    Your Expenses (Total credit card limits)    ANZ_Data    I2
    click work out how much i could borrow button

TC_ANZ_002

    [Documentation]    2.	Clicking the ‘start over’ button clears the form.

    click start over button

TC_ANZ_003

    [Documentation]    3.	Entering only $1 for Living expenses, and leaving all other fields as zero, clicking ‘Work out how much I could borrow’ returns the following error message:

    your expenses (living expenses)    ANZ_Data    E4
    click work out how much i could borrow button
    close the browser