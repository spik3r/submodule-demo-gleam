#!/usr/bin/env bash
set -euo pipefail
SOURCE=$(cd "$(dirname "$0")/.." && pwd)
SANDBOX=$(mktemp -d "${TMPDIR:-/tmp}/submodule-rehearsal.XXXXXX")
echo "Rehearsal workspace: $SANDBOX (retained for inspection)"
git -c protocol.file.allow=always clone --recurse-submodules "$SOURCE" "$SANDBOX/app"
cd "$SANDBOX/app"
git config user.name 'Submodule Demo'
git config user.email 'demo@example.invalid'
v1=$(git -C governance rev-parse policy-v1)
v2=$(git -C governance rev-parse policy-v2)
test "$v1" != "$v2"
test "$(git -C governance rev-parse HEAD)" = "$v1"
test "$(git ls-tree HEAD governance | awk '{print $1}')" = 160000
echo 'PASS: fresh clone uses recorded v1, not latest v2'
git -C governance fetch origin --tags
test "$(git -C governance rev-parse HEAD)" = "$v1"
echo 'PASS: fetch does not move the pinned working version'
git -C governance checkout --detach policy-v2
test "$(git ls-tree HEAD governance | awk '{print $3}')" = "$v1"
git diff --submodule=log
git add governance
git commit -m 'Adopt governance policy v2'
test "$(git ls-tree HEAD governance | awk '{print $3}')" = "$v2"
echo 'PASS: app commit records v2 only after deliberate adoption'
git -C governance checkout --detach policy-v1
git -c protocol.file.allow=always submodule update --init --recursive
test "$(git -C governance rev-parse HEAD)" = "$v2"
echo 'PASS: update restores the recorded pin rather than a moving branch'
git -C governance checkout --detach policy-v1
git add governance
git commit -m 'Return to governance policy v1'
test "$(git ls-tree HEAD governance | awk '{print $3}')" = "$v1"
test -z "$(git status --porcelain)"
test "$(git -C "$SOURCE/governance" rev-parse HEAD)" = "$v1"
echo 'PASS: rollback recorded; original demo still at v1'
echo 'All five Git demonstrations passed. No compiler required.'
