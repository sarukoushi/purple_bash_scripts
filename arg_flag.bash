#!/bin/bash

keywords_array=( alfa beta gamma delta )
used_keywords=()
argument_flags=()

echo "  Keywords are: [${keywords_array[@]}]"

for i in "${@}";do
  
  if [[ " ${keywords_array[*]} " =~ [[:space:]]${i}[[:space:]] ]]; then
    
    echo "  Keyword [${i}] was used as an argument to this script."
    
    argument_flags+="--${i}=True "
    
    used_keywords+=("${i}")
  
  fi

done

for i in "${keywords_array[@]}";do
  
  if [[ ! " ${used_keywords[*]} " =~ [[:space:]]${i}[[:space:]] ]]; then
  
  argument_flags+="--${i}=False "
  
  fi

done

echo "
  Keywords used as arguments to this script: [${used_keywords[@]}]
  Generated argument's: [${argument_flags[@]}]
"
