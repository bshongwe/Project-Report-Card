#!/bin/bash

# Function to calculate GPA
calculate_gpa() {
    total_credits=0
    total_grade_points=0

    for ((i=0; i<$subject_count; i++)); do
        # Prompt for subject name
        echo "Enter the name of subject $((i+1)): "
        read subject_name

        # Prompt for subject credit hours
        echo "Enter the credit hours for subject $((i+1)): "
        read credit_hours

        # Prompt for subject grade
        echo "Enter the grade for subject $((i+1)): "
        read grade

        # Calculate grade points based on grade
        case $grade in
            "A") grade_points=4 ;;
            "B") grade_points=3 ;;
            "C") grade_points=2 ;;
            "D") grade_points=1 ;;
            *) grade_points=0 ;;
        esac

        # Calculate subject's total grade points
        subject_grade_points=$((credit_hours * grade_points))

        # Accumulate total credits and grade points
        total_credits=$((total_credits + credit_hours))
        total_grade_points=$((total_grade_points + subject_grade_points))
    done

    # Calculate GPA
    gpa=$(awk "BEGIN { printf \"%.2f\", $total_grade_points / $total_credits }")
}

# Prompt for the number of subjects
echo "Enter the number of subjects: "
read subject_count

# Calculate GPA
calculate_gpa

# Display the calculated GPA
echo "Your GPA is: $gpa"

