# -------------------------------------------------
# FINAL MULTI-PROGRAM BUILD AUTOMATION SCRIPT (TCL)
# Works with MSYS2 / MinGW64
# -------------------------------------------------

puts "---------------------------------------"
puts "      BUILD AUTOMATION SYSTEM (TCL)    "
puts "---------------------------------------\n"

# Get the folder where this script is located
set base_dir [file dirname [info script]]

# Define program and test folders
set program_folder "$base_dir/programs"
set test_folder "$base_dir/tests"

puts "Using program folder: $program_folder"
puts "Using test folder: $test_folder\n"

# Get all C programs
set programs [glob -nocomplain "$program_folder/*.c"]

if {[llength $programs] == 0} {
    puts "No C programs found in programs folder!"
    exit
}

set total_pass 0
set total_fail 0

# Loop through each program
foreach prog $programs {

    # Extract program name (remove path + .c)
    set name [file rootname [file tail $prog]]

    puts "---------------------------------------"
    puts "Processing program: $name"
    puts "---------------------------------------"

    # Output executable
    set exe "$base_dir/$name.exe"

    puts "Compiling: gcc $prog -o $exe"

    catch {exec gcc $prog -o $exe} compile_error

    if {![file exists $exe]} {
        puts "Compilation FAILED for $name"
        puts "Error message:"
        puts $compile_error
        puts ""
        continue
    }

    puts "Compilation successful.\n"

    # Test folder for this program
    set current_test_folder "$test_folder/$name"

    if {![file exists $current_test_folder]} {
        puts "No test folder found for $name\n"
        continue
    }

    # Get test files
    set tests [glob -nocomplain "$current_test_folder/test*.txt"]

    set pass 0
    set fail 0

    foreach t $tests {

        # Extract test number
        set num [string range [file tail $t] 4 end-4]

        set expected "$current_test_folder/expected${num}.txt"

        puts "Running Test Case $num..."

        # Run program using input redirection
        set output [exec $exe < $t]

        # Read expected result
        set f [open $expected r]
        set expected_output [string trim [read $f]]
        close $f

        if {[string trim $output] eq $expected_output} {
            puts "Result: PASS\n"
            incr pass
            incr total_pass
        } else {
            puts "Result: FAIL\n"
            incr fail
            incr total_fail
        }
    }

    puts "Summary for $name"
    puts "Passed: $pass"
    puts "Failed: $fail\n"
}

# Final report
puts "======================================="
puts "            FINAL REPORT               "
puts "======================================="
puts "Total Passed: $total_pass"
puts "Total Failed: $total_fail"
puts "======================================="
puts "Automation completed successfully!"