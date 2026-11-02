---
name: legacy-parser
description: Use this to parse, process, or analyze a log file located in the hw3 inbox directory.
---

# legacy-parser

Runs legacy_log_parser on a single log file, only if it lives under:

    /home/csce465/csce465-agentsec/hw3/inbox/

Any path outside inbox/ is refused by the runner.

## Command
    bash /home/csce465/csce465-agentsec/hw3/skills/legacy-parser/run_parser.sh <file-under-inbox>