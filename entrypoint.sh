#!/bin/sh

godep restore && sh -c "$*"
