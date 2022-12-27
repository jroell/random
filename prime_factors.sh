#!/bin/bash

# This function returns the smallest prime factor of the given integer n.
# If n is prime, then it returns n itself.
function smallest_prime_factor()
{
  # Store the value of n in a local variable.
  local n=$1

  # Check if n is divisible by 2.
  if (( n % 2 == 0 )); then
    # If it is, then return 2.
    echo 2
    return
  fi

  # Initialize the variable i to 3, which is the first odd integer.
  local i=3

  # Loop while i is less than or equal to the square root of n.
  while (( i * i <= n )); do
    # Check if n is divisible by i.
    if (( n % i == 0 )); then
      # If it is, then return i.
      echo $i
      return
    fi

    # Increment i by 2, since we only want to check odd integers.
    i=$(( i + 2 ))
  done

  # If we reach this point, then n is prime, so return n itself.
  echo $n
}

# This function prints the prime factors of the given integer n.
function print_prime_factors()
{
  # Store the value of n in a local variable.
  local n=$1

  # Check if n is equal to 1.
  if (( n == 1 )); then
    # If it is, then there are no prime factors, so we return.
    return
  fi

  # Compute the smallest prime factor of n.
  local f=$(smallest_prime_factor $n)

  # Print the value of f.
  echo $f

  # Call the print_prime_factors function recursively to compute and print
  # the prime factors of n / f.
  print_prime_factors $(( n / f ))
}

# Read the value of N from the command line.
read -p "Enter a positive integer N: " N

# Print the prime factors of N.

time print_prime_factors $N
