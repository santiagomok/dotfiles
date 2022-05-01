#!/usr/bin/env bash
fd makefile.gmake --max-depth 1 --type f $(fd -t d --max-depth 2) -exec echo {//}
