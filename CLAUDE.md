This is the morestd library's own source repository, distributed as a haxelib library (see `haxelib.json`).

`morestd` is a small collection of universal, platform-agnostic Haxe utilities with no dependencies of its own: timers (`RefreshableTimer`, `BackoffDelayTimer`), iterators (`EnumeratingIterator`, `StringIterator`), a `Counter`, `DateTime`, a `Detachable` handle abstraction, JSON canonicalization (`Json`), math helpers (`MathTools`), a `StringSetMap`, and extension methods for `Array`/`Map`/`String`. All source lives under `src/morestd` (`morestd` package and its subpackages, e.g. `morestd.extensions`).

ANY AMBIGUITY OR MANUAL GAP SURFACING DURING IMPLEMENTATION SHOULD NOT BE RESOLVED SILENTLY. Instead, explicitly ask the question.

If told to take a dubious or possibly suboptimal approach (whether from the UI/UX or technical standpoint), also ask a question, providing details on why you're uncertain about this and what are the better practices or better ways to solve the problem.

# Code style conventions

See `code_style.md`.

# Dependencies

None - see `haxelib.json`'s `dependencies` for the authoritative (empty) list.
