#!/bin/bash
read N
strength=()
# check constrains
int_re='^[0-9]+$'
if ! [[ $N =~ $int_re ]]; then
   echo "error: Not a number" >&2; exit 1
fi

if ! [[ $N -gt 1 ]] && [[ $N -lt 100000 ]]; then
   echo "error: Set the number more than 1 and less than 100000" >&2; exit 1
fi
# check constrains
for (( i=0; i<N; i++ )); do
    read Pi
    # check constrains
    if ! [[ $Pi =~ $int_re ]]; then
      echo "error: Not a number" >&2; exit 1
    fi

    if ! [[ $Pi -gt 0 ]] && [[ $Pi -le 10000000 ]]; then
      echo "error: Set the number from 0 to 10000000" >&2; exit 1
    fi
    # create an array of strengths
    strength+=( "${arr[@]}" ${Pi} )
done

# create reverse sorted array
sorted_strength=($(echo "${strength[@]}" | tr ' ' '\n' | sort -n -r | tr '\n' ' '))
# set the maximum difference
D=10000000
# use loop to compare a pair of numbers
for index in ${!sorted_strength[*]};
do
    if ! [[ $index -eq ${#sorted_strength[*]}-1 ]]; then	
      DELTA=$((${sorted_strength[$index]}-${sorted_strength[$index+1]}))
      if [[ ${DELTA} -lt $D ]]; then
      	# set the new D if the result id less than a previous
      	D=$DELTA
      fi
    fi
done

echo $D
