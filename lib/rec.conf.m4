m4_divert(-1)
m4_include(`misc.m4')

m4_define(`M4_PREFIX', `')
m4_define(`M4_INDENT', `')
m4_define(`M4_FIRST', `true')

m4_define(
    `M4_TYPE_INT',
    `m4_print(`$1')'
)

m4_define(
    `M4_TYPE_STRING',
    `m4_print(`"$1"')'
)

m4_define(
    `M4_TYPE_BOOL',
    `m4_print(`$1')'
)

m4_define(
    `M4_TYPE_CHOICE',
    `m4_print(`"$1"')'
)

m4_define(
    `M4_PARAM',
    `
        m4_ifelse(
            `$1',
            M4_PREFIX(),
            `
                m4_ifelse(
                    `$7',
                    `file',
                    `
                        m4_ifelse(
                            M4_FIRST(),
                            `true',
                            `m4_define(`M4_FIRST', `false')',
                            `m4_printl(`,', `')'
                        )
                        m4_printl(M4_INDENT()`// $8')
                        m4_print(M4_INDENT())
                        m4_ifelse(
                            `$6',
                            `true',
                            ,
                            `m4_print(`// ')'
                        )
                        m4_print(`"$2" : ')$5
                    '
                )
            '
        )
    '
)

m4_define(
    `M4_CONTAINER',
    `
        m4_ifelse(
            `$1',
            M4_PREFIX(),
            `
                m4_ifelse(
                    M4_FIRST(),
                    `true',
                    `m4_define(`M4_FIRST', `false')',
                    `m4_printl(`,', `')'
                )
                m4_ifelse(
                    `$2',
                    `',
                    `m4_printl(M4_INDENT()`{')',
                    `
                        m4_printl(M4_INDENT()`// $3')
                        m4_printl(M4_INDENT()`"m4_substr(`$2', 1)": {')
                    '
                )
                m4_pushdef(`M4_PREFIX', M4_PREFIX()`$2')
                m4_pushdef(`M4_INDENT', M4_INDENT()`    ')
                m4_pushdef(`M4_FIRST', `true')

                m4_include(`rec_conf_struct.m4')

                m4_popdef(`M4_FIRST')
                m4_popdef(`M4_INDENT')
                m4_popdef(`M4_PREFIX')
                m4_printl(`')
                m4_print(M4_INDENT()`}')
            '
        )
    '
)

M4_CONTAINER(`', `', `')
