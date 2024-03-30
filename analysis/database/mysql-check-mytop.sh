#!/bin/bash
# DON'T install mytop package with mariaDB! The latter has its own mytop, which conflicts!
mysqlcheck -a --all-databases
mytop
