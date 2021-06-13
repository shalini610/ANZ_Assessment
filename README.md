# RAFT - Reusable Automation Framework For Testing
### Initial Setup:
- Install and configure [Python3](https://www.python.org/downloads/)
- Setup your IDE (Preferably [Pycharm Community Edition](https://www.jetbrains.com/pycharm/download/#section=windows))
- Import cloned repository as project

- Install all required packages in pycharm
    - robotframework==3.2.1
    - robotframework-datadriver==0.3.6
    - robotframework-datetime-tz==1.0.6
    - robotframework-excel==1.0.0b4
    - robotframework-excellib==2.0.0
    - robotframework-httplibrary==0.4.2
    - robotframework-selenium2library==3.0.0
    - robotframework-seleniumlibrary==4.3.0
    - selenium==3.141.0
    - robotframework-metrics==3.1.6
    - robotframework-lint==1.1
    - DateTime==4.3
    - xlrd==1.2.0
    
-  Run this command in Pycharm Terminal

   - robot -d C:/Users/shlnu/PycharmProjects/ANZ_Assessment/UI/Results_output/results --name "ANZ Automation Execution" --report ANZ_Report.html --log ANZ_Log.html --output ANZ_Output.xml  *.robot
