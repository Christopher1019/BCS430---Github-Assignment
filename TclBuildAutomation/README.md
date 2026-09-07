TclBuildAutomation — CSE321 Project

A simple industry-style build automation system written in TCL.
This project automatically compiles multiple C programs, runs test cases, compares outputs, and generates a final report.

This demonstrates how real build/testing tools work (like CI pipelines) but in a simple and understandable form.

How to Run
Step 1 — Open the correct terminal

You must run this in the MINGW64 terminal inside VS Code (the one where gcc --version works).

Step 2 — Run the automation script
tclsh build_automation.tcl
What the script does automatically
Finds all .c programs inside the programs/ folder
Compiles each program using GCC
Runs every test case for that program
Compares the program output to the expected output
Prints PASS / FAIL results
Displays a final summary report

Example output:

---------------------------------------
      BUILD AUTOMATION SYSTEM (TCL)
---------------------------------------

Processing program: add
Compilation successful.

Running Test Case 1...
Result: PASS

Running Test Case 2...
Result: PASS

Summary for add
Passed: 2
Failed: 0
Project Structure
TclBuildAutomation/
│
├── README.md
│
├── build_automation.tcl      — Main TCL automation script
│
├── programs/                 — All C programs to be compiled
│   ├── add.c
│   └── multiply.c
│
└── tests/
    ├── add/                  — Test cases for add.c
    │   ├── test1.txt
    │   ├── test2.txt
    │   ├── expected1.txt
    │   └── expected2.txt
    │
    └── multiply/             — Test cases for multiply.c
        ├── test1.txt
        ├── test2.txt
        ├── expected1.txt
        └── expected2.txt
How the System Works

Pipeline:

C Programs → GCC Compilation → Executable → Test Input → Program Output → Compare with Expected Output → Report
Example Programs
add.c

Adds two numbers provided as input.

Example input:

5 3

Expected output:

8
multiply.c

Multiplies two numbers provided as input.

Example input:

4 6

Expected output:

24
Test Case Format

Each program has its own folder inside tests/.

For every test case:

test1.txt       → input to the program
expected1.txt   → correct output

Example:

test1.txt

2 3

expected1.txt

5
Features of This Project

This automation system includes:

Automatic detection of multiple programs
Automatic compilation using GCC
Automatic test execution
Output comparison
PASS / FAIL result display
Final report showing total passed and failed tests
Organized project structure (like real software projects)
Why This Project Is Useful

This project simulates how real software companies test programs automatically.

Instead of manually compiling and testing each program, the script does everything in one command:

tclsh build_automation.tcl

This is similar to how tools like CI/CD pipelines, GitHub Actions, and automated build systems work in industry.