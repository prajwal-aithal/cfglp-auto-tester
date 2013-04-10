CFGLP Auto-Tester
===========
Tester for the compilers lab (CS 306) assignment at IIT Bombay.

---
This script helps you organize your testing (against the standard implementation) for the compilers Lab (CS 306) assignments.

Requirements
------------
This script needs `meld` to be installed. `meld` is a GUI version of command-line `diff`.

Usage
-----
1. Populate the paths-list file in the root folder (of this script) following the format given in the respective docs file.
2. If you are using the script for the first time, give the script executable permission by executing the command (after 
entering the directory of the script).
   `$ chmod +x cfglp-auto-tester.sh`
3. Execute the script using the command
   `$ ./cfglp-auto-tester.sh`

Output Format
-------------
The format of the output displayed in the terminal is as follows. For each file, all the options are executed and for each option the output format is - 

```
Running cfglp on file - file1.cfg
>> Executing option - Option 1
===========================
Stdout output of your version for option 1
---------------------------
Stdout output of the reference version for option 1
===========================
>> Executing option - Option 2
===========================
Stdout output of your version for option 2
---------------------------
Stdout output of the reference version for option 2
===========================
...
>> Executing option - Option n
===========================
Stdout output of your version for option n
---------------------------
Stdout output of the reference version for option n
===========================
Running cfglp on file - file2.cfg
```