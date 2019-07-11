# CBP Station Data Tabularizer

## What is this?
Amid news reports exposing inhumane treatment of asylum-seekers and other
migrants -- including young children -- at U.S. Customs & Border Protection
(CBP) facilities, [2600 magazine](https://2600.com/) in July 2019 published a
full list of CBP stations in the United States on the websites
https://concentrationcamps.us/ and https://internmentcamps.us/. This repo
contains a shell script that uses `sed` and `awk` to transform the dataset into a
tabular format, making it easier to quickly search, analyze, and augment.

Specifically, it contains:
- `input.txt`: the list of stations copied from the 2600 website
- `output.tsv`: the data reorganized in tab-separated value format
- `ouput_cleaned.tsv`: the output with a header row and with some errant rows
  cleaned up
- `tabularize.sh`: the script used to reorganize the data

I make no claim about the accuracy of the data contained within; my interest is
only in making the data easier to work with. If the list is updated (and in the
same format) you hopefully can use this script to quickly whip the data into a
more usable format.
