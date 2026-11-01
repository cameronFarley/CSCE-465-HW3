# AppArmor profile for the VULNERABLE Task 1 parser.
# Load:  sudo apparmor_parser -r policy/apparmor.profile
#include <tunables/global>

profile legacy_log_parser /home/*/csce465-agentsec/hw3/legacy_log_parser {
  # (5) only what's needed to start: dynamic loader, libc, ld.so.cache, locale
  #include <abstractions/base>
  /home/*/csce465-agentsec/hw3/legacy_log_parser mr,

  # (1) read the selected payload file only
  /home/*/csce465-agentsec/hw3/inbox/payload.bin r,

  # (2) write only inside the marker directory
  /home/*/csce465-agentsec/hw3/markers/   rw,
  /home/*/csce465-agentsec/hw3/markers/** rw,

  # (3) the protected decoy: blocked AND logged
  audit deny /opt/agentsec/decoy.txt rwklx,

  # (4) no shells or other programs
  audit deny /{,usr/}bin/** x,
  audit deny /{,usr/}sbin/** x,

  # everything not listed above is denied by default
}
