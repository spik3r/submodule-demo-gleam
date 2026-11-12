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

Gleam and Erlang were not installed on the selected Mac when this demo was
created. Node is available. **The Gleam app has not been compiled or tested.**
No software was installed. Once Gleam is available, run the three commands in
the main README; they compile/test the JavaScript target using Node. Packages
are declared in `gleam.toml`; the first dependency resolution will create a
manifest, which a real application would then commit for reproducibility.

The Git demonstration does not depend on Gleam being installed.
