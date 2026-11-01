---
name: legacy-parser
description: Use this to parse, process, or analyze a log file located in the hw3 inbox directory.
---

# legacy-parser

Runs legacy_log_parser on a single log file, only if it lives under:

    ~/csce465-group/CSCE-465-HW/inbox/

Any path outside inbox/ is refused by the runner.

## Command
    bash ~/csce465-group/CSCE-465-HW/skills/legacy-parser/run_parser.sh <file-under-inbox>