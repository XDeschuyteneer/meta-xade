do_compile_prepend() {
    do_pouet 1
    A=1
}

do_compile_append() {
    do_pouet 2
}

do_pouet() {
    bbplain "pouet task : $1"
}

do_frigo[doc] = "ma documentation"
do_frigo() {
    bbplain "frigo task"
}

do_pouet() {
    bbplain "pouet task"
}

addtask frigo after compile
addtask pouet after frigo