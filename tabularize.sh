#!/bin/bash

# This script cleans up data on Customs & Border Protection
# facilities published by 2600 magazine on the websites
# https://concentrationcamps.us and https://internmentcamps.us
# in summer of 2019. It outputs the data as a (mostly) clean TSV
# file, which can be opened in a spreadsheet progam.

# This has been tested on Linux with:
# GNU sed 4.4
# GNU awk (gawk) 4.1.4

# the list file is given as the sole argument to the script
list=$1

# remove full state names and empty lines with leading whitespace
sed -E '/^[A-Z]+\s?[A-Z]+?$|^\s$/d' $list |

    # remove empty lines between rows of text
    sed -E '/^\w+|^d+/,/^$/{/^$/d}' |

    # "squeeze" multiple empty lines into one
    cat -s |

    # put cities, states, and ZIP codes on their own line
    sed -E 's/^([a-zA-Z].*), ([A-Z]{2}) ([[:digit:]]{5,}-?[[:digit:]]+?)$/\1\n\2\n\3/g' |
    # put phone and fax numbers on their own line
    sed -E 's/^[a-zA-Z]{3,5}: (\([[:digit:]]{3}\) [[:digit:]]{3}-[[:digit:]]{4})/\1/g' |
    # pipe to awk and output to file
    awk 'BEGIN { RS="" ; FS="\n" ; OFS="\t" }{ $1=$1; print $0 }' > output.tsv
