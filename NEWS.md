# doppel-cli

## 0.1.8

* Added linting on `analyze.R` and removed dead code (#93)
* Inherited class methods are now accurately handled using `doppel-describe` on Python packages. (#97)
* `print()` on `R6` classes is now treated as a special method equivalent to `__str__()` in Python classes (#97)
* The argument passed to `--kwargs-string` is now respected when describing the signature of R6 classes in `doppel-describe`. (#97)
* function argument comparisons is now accurate and tested (#89)
* `doppel-describe` no longer fails to parse packages which use callable classes as public methods (#87)
* Failures in `doppel-describe` now result in a non-zero exit code. This was always the intended behavior, but was previously broken. (#86)
* Check on whether on object belongs to a Python package or was imported is more accurate (#85)
* Python packages with sub-modules no longer cause `doppel-describe` to hit an infinite recursion problem (#73)

## 0.1.7

* Added constructors to list of public methods for both python and R ([#65](https://github.com/jameslamb/doppel-cli/pull/65))
* Added support for class methods in R6 ([#63](https://github.com/jameslamb/doppel-cli/pull/63))
* Fixed bug with empty R6 classes being excluded in `analyze.R` ([#62](https://github.com/jameslamb/doppel-cli/pull/62))
* Added checks on keyword arguments of public methods ([#58](https://github.com/jameslamb/doppel-cli/pull/58))

## 0.1.6

* Added ability to compare class methods across classes shared in all packages ([#40](https://github.com/jameslamb/doppel-cli/pull/40))
