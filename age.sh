#!/bin/bash

# Remove leading zero from a number
strip_leading_zero() {
    echo $((10#$1))
}

# Get current date
currentYear=$(date +'%Y')
currentMonth=$(date +'%m')
currentDate=$(date +'%d')

# Prompt user for date of birth
read -p "Enter your date of birth (1-31): " birthDate
read -p "Enter your month of birth (1-12): " birthMonth
read -p "Enter your year of birth (4 digits): " birthYear

# Strip leading zeros
birthDate=$(strip_leading_zero $birthDate)
birthMonth=$(strip_leading_zero $birthMonth)
birthYear=$(strip_leading_zero $birthYear)

# Calculate years
ageYear=$((currentYear - birthYear))

# Calculate months
if ((currentMonth >= birthMonth)); then
    ageMonth=$((currentMonth - birthMonth))
else
    ageMonth=$(((12 + currentMonth) - birthMonth))
    ageYear=$((ageYear - 1))
fi

# Calculate days
if ((currentDate < birthDate)); then
    ageDate=$(((31 + currentDate) - birthDate))
    ageMonth=$((ageMonth - 1))
elif ((currentDate == birthDate)); then
    ageDate=0
else
    ageDate=$((currentDate - birthDate))
fi

# Output age
echo -e "\n\nYour age is $ageYear years $ageMonth months $ageDate days"
