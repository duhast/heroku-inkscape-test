#!/usr/bin/env bash

ldd $(which inkscape) | grep found
inkscape -z --version