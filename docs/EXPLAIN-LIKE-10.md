# Explain it like I’m 10

Imagine your class builds lots of LEGO projects. Everyone follows the same
**club rulebook**, but the rulebook gets new editions.

Your spaceship’s instruction sheet says: “Use rulebook edition 1.” It has a
bookmark pointing to that exact edition. Even when edition 2 comes out, your
spaceship does not secretly start following new rules overnight.

1. The club writes edition 2: a commit in the governance repository.
2. You get a copy to look at: fetch.
3. You check whether it suits your spaceship: review the difference.
4. You move your bookmark: check out edition 2 inside the submodule.
5. You save the new bookmark in the spaceship’s instructions: commit the
   submodule pointer in the app repository.
6. A friend gets your spaceship: Git retrieves exactly the bookmarked edition.

**Two notebooks, two saves:** saving the new rulebook is one commit; recording
which rulebook the spaceship uses is a different commit in a different repo.

```text
Club rulebook                   Spaceship instructions
edition 1 ──► edition 2          bookmark ──► edition 1
                                      review, then move
                                bookmark ──► edition 2
```

The bookmark is actually a long commit ID, not an edition number. `policy-v1`
and `policy-v2` are readable labels for the demo. The files are available in
`governance/`, so you can read them without jumping between projects.

## Three approaches

- **Copy and paste:** each spaceship has its own loose photocopy. Changes drift.
- **Always grab newest:** the rulebook can change during your build. Surprise!
- **Submodule:** share one rulebook, but each project chooses a reproducible
  edition. A bot can remind you with an update PR, not silently move the bookmark.
