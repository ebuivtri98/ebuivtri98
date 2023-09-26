#!/bin/bash

# Define a function to calculate the factorial
calculate_factorial() {
  if [ $1 -le 1 ]; then
    echo 1
  else
    local sub_factorial
    sub_factorial=$(calculate_factorial $(( $1 - 1 )))
    echo $(( $1 * $sub_factorial ))
  fi
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <number>"
  exit 1
fi

# Input validation
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "Error: Please provide a valid positive integer."
  exit 1
fi

# Calculate and display the factorial
number=$1
result=$(calculate_factorial $number)
echo "Factorial of $number is: $result"
