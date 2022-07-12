#!/bin/bash

# Task a. Create copy of `passwd` file to `passwd_new`. :exclamation: Do all modifications on `passwd_new` file
cp -f passwd passwd_new

# Task b. Change shell for user `saned` from `/usr/sbin/nologin` to `/bin/bash` using **AWK**
awk -F: '{OFS=":"; if ($1=="saned") $7="/bin/bash"; print}' passwd_new > ./tmp.file
mv tmp.file passwd_new

# Task c. Change shell for user `avahi` from `/usr/sbin/nologin` to `/bin/bash` using **SED**
sed -i '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/' passwd_new

# Task d. Save only 1-st 3-th 5-th 7-th columns of each string based on `:` delimiter 
awk -F: '{OFS=":"; print $1,$3,$5,$7}' passwd_new > ./tmp.file
mv tmp.file passwd_new

# Task e. Remove all lines from file containing word `daemon`
awk '{if ($0 !~ "daemon") print}' passwd_new > ./tmp.file
mv tmp.file passwd_new

# Task f. Change shell for all users with **even** `UID` to `/bin/zsh`
awk -F: '{OFS=":"; if ($2 % 2 == 0) $4="/bin/zsh"; print}' passwd_new > ./tmp.file
mv tmp.file passwd_new

# Put you code here
