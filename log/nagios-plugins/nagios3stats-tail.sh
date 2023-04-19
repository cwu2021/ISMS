#!/bin/bash
# https://www.dariawan.com/tutorials/linux/linux-tail-starting-specific-line/
nagios3stats |tail -n +30 | head -22
