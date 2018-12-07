#!/bin/sh

release_ctl eval --mfa "Wisefish.ReleaseTasks.migrate/1" --argv -- "$@"
