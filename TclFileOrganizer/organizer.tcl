puts "---------------------------------------"
puts "        TCL FILE ORGANIZER TOOL        "
puts "---------------------------------------"

# Ask user for folder name
puts -nonewline "Enter the folder name to organize: "
flush stdout
gets stdin folder

# Check if folder exists
if {![file exists $folder]} {
    puts "\nError: Folder '$folder' does not exist!"
    exit
}

# Move inside the folder
cd $folder

# Create folders
file mkdir Documents
file mkdir Images
file mkdir Data
file mkdir Logs
file mkdir Others

# Counters
set doc_count 0
set img_count 0
set img_count 0
set data_count 0
set log_count 0
set other_count 0

# Get list of files
set files [glob -nocomplain *]

puts "\nStarting file organization...\n"

foreach f $files {

    # Skip directories
    if {[file isdirectory $f]} {
        continue
    }

    # Get file extension (lowercase)
    set ext [string tolower [file extension $f]]

    if {$ext eq ".txt" || $ext eq ".pdf" || $ext eq ".docx"} {
        file rename -force $f Documents/
        incr doc_count
        puts "Moved: $f -> Documents"

    } elseif {$ext eq ".jpg" || $ext eq ".png" || $ext eq ".jpeg"} {
        file rename -force $f Images/
        incr img_count
        puts "Moved: $f -> Images"

    } elseif {$ext eq ".csv" || $ext eq ".xlsx"} {
        file rename -force $f Data/
        incr data_count
        puts "Moved: $f -> Data"

    } elseif {$ext eq ".log"} {
        file rename -force $f Logs/
        incr log_count
        puts "Moved: $f -> Logs"

    } else {
        file rename -force $f Others/
        incr other_count
        puts "Moved: $f -> Others"
    }
}

# Total files
set total [expr $doc_count + $img_count + $data_count + $log_count + $other_count]

# Summary
puts "\n---------------------------------------"
puts "        FILE ORGANIZATION SUMMARY      "
puts "---------------------------------------"
puts "Documents : $doc_count files"
puts "Images    : $img_count files"
puts "Data      : $data_count files"
puts "Logs      : $log_count files"
puts "Others    : $other_count files"
puts "---------------------------------------"
puts "Total Files Organized: $total"
puts "---------------------------------------"

puts "\nOrganization Completed Successfully!"