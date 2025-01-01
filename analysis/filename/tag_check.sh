#!/bin/bash
# check filename with TAG and STRING filtered.
ls | grep -F [TAG] | grep -v -E 'string|STRING|Stringr'
# grep for mixed encoding
grep --text ^12 LogView* | grep --text Gap | wc -l
