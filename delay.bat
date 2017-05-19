@set sec=1000
@set /a delay=(%1*sec)
@ping 1.1.1.1 -n 1 -w %delay% > nul