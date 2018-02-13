LICENSE="MIT"

require test.inc

do_compile() {
    bbplain "PN=\"${PN}\""
    bbplain "PV=\"${PV}\""
    bbplain "S=\"${S}\""
    bbplain "MACHINE=\"${MACHINE}\""
    bbplain "value: $A"
    bbplain "shell: $SHELL"
    bbwarn "test warning msg"
    bbplain "test plain msg"
    bbnote "test note msg"
    bbdebug 1 "test log lvl 1 msg"
    bbdebug 2 "test log lvl 2 msg"
    bbwarn "number of CPU: ${@oe.utils.cpu_count()}"
}