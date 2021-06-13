*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    OperatingSystem
Library    urllib3
Library    Collections
*** Variables ***
${CURDIR}
${EXECDIR}
${screenshot_path}    ../screenshots
${TYPE OF FILE}    png
${\n}
#${token}    hiro48m4ktlnutvf
${browser}
${URL}  https://www.anz.com.au/personal/home-loans/calculators-tools/much-borrow/
*** Keywords ***

Screenshot
  [Arguments]  ${filename}
  SeleniumLibrary.Set Screenshot Directory  ${screenshot_path}
  ${now}    Evaluate  '{dt:%B}-{dt.day}-{dt.year}_{dt:%H}:{dt:%M}:{dt:%S}'.format(dt=datetime.datetime.now())    modules=datetime
  Capture Page Screenshot  EMBED
  Capture Page Screenshot  ${filename}.${TYPE OF FILE}
  Log To Console  ${\n}${filename}.${TYPE OF FILE} screenshot

