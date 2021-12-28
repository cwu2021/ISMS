#!/bin/bash
# check filename with TAG and STRING filtered.
ls | grep -F [TAG] | grep -v -E 'string|STRING|Stringr'
