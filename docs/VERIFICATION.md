# Verification

Created 12 November 2026 on macOS.

## Git demo

The automated rehearsal checks a real recursive clone, pin preservation after
fetch, deliberate adoption and committed gitlink, restoring a stale submodule
checkout from the app pin, and rollback. It only modifies temporary clones.

Result: **all five rehearsal assertions passed**, including recursive clone,
fetch/pin stability, adoption, restoration and rollback. `bash -n` passed.

Both source repositories use a repository-local demo Git identity; no global Git
configuration changes. The app starts at `policy-v1` while governance main is
`policy-v2`. Both source working trees should be clean.

## Gleam app

Gleam **1.19.2** was installed via Homebrew at the user's request. Node **26.0.0**
is used for the JavaScript target. Formatting passed; the test suite passed
(**1 test, 0 failures**); running the app printed the expected greeting. The
resolved dependency manifest is committed (`gleam_stdlib` 1.0.5, `gleeunit` 1.11.0).

Homebrew installed its required dependencies too. Its Erlang linking step reported
an existing `typer` executable conflict. That existing file was **not overwritten**.
Gleam itself is installed and the JavaScript target works; this demo does not
require Erlang. No global Git configuration was changed.

## Hosted repositories

Both repos are private on GitHub under `spik3r`. Governance tags v1/v2 are
published before the app pointer. The submodule uses a token-free HTTPS URL.
Fresh recursive clone, formatting, tests, app run and the Git rehearsal are
verified after publication. Collaborators require access to both repositories.
