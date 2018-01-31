Test
# Contributing to Tlog
The Tlog project welcomes new contributors. This document will guide you through the process.

## Pull Requests
We actively welcome your pull requests. There are a few guidelines that we need
contributors to follow so that we can try to keep the codebase consistent and clean.

* Fork the main repository and clone it to your local machine.
* Create a topic branch from master. Please avoid working directly on the ```master``` branch.
* Make commits of logical units, and make sure to follow the CODINGSTYLE.
* Submit the Pull Request(PR) on Github.

## Issues
We use GitHub [issues tracker](https://github.com/Scribery/tlog/issues) to track public bugs.
Please ensure your description is clear and has sufficient instructions to be able to reproduce the issue.

## Coding Style guidelines

* Spaces are used for indentation, should not use tabs.

* Lines should be at most 78 chars.

* Do not leave trailing whitespaces at the end of line.

* Braces open on the same line as the for/while/if/else/etc. Closing
  braces are put on a line of their own, except in the else of an if statement
  or in a while of a do-while statement. Always use braces for if and while.

```c
if (a == b) {
  	...
}

if (a == b) {
    ...
    ...
} else if (a > b) {
    ...
    ...
}

if (a == b) {
  	...
} else {
  	do_something_else ();
}

do {
    do_something ();
} while (cond);

```

* In general, should not use `goto`. The goto statement only comes in handy when a
  function exits from multiple locations and some common work such as cleanup
  has to be done. If there is no cleanup needed then just return directly.

* The rest of functions should be static, to avoid polluting the global space.
  `static` and `return type` are put on the same line. Name's function is put on a
  line of its own.

```c
static tlog_grc
tlog_play_run(struct tlog_errs **perrs, int *psignal)
{
              ...
              ...
}
```

* Avoid using global variables because they are evil. Placing a comment explaining the reason
  when using them.

* For regular comments, use C style (`/*` `*/`) comments, even for one-line.

* For doc-comments (Doxygen comments), use the `/**` `*/` style featured.

* For stringizing (`\`) of Macro, make sure to follow:

```c
#define CMP_BOOL(_name) \
    do {                                                        \
        if (_name != t._name##_out) {                           \
            FAIL(#_name " %s != %s",                            \
                 BOOL_STR(_name), BOOL_STR(t._name##_out));     \
        }                                                       \
    } while (0)
```

## Directories
Tlog source is organized as followings.

```
.                   <- Core tlog + README + CONFIGURE etc
├── doc             <- Documentation.
├── include         <- API headers in C language (*.h).
│   ├── tlog
│   ├── tltest
├── lib             <- Library API in C language (*.c).
│   ├── tlog
│   ├── tltest
├── src             <- Core handling tlog.
│   ├── tlog
│   ├── tltest
├── m4              <- Unix macro processor.
│   ├── autotools
│   ├── tlog
└── man             <- Man page tlog.
```

Follow instructions in [README](README.md) for how to compile and run test code.

## License
By contributing to Tlog, you agree that your contributions will be licensed
under the [COPYING](COPYING) file in the root directory of this source tree.
