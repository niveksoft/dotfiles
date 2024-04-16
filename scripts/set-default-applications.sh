#!/bin/bash

# A script to set the default xdg applications

set -ex

xdg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http
