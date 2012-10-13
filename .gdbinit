define state
printf "\n"
printf "---------------------------------------------------\n"
info registers
printf "---------------------------------------------------\n"
disassemble $pc
printf "---------------------------------------------------\n"
end

define stack
printf "--------------------------------------------------------------------------\n"
x/16xw $fp-64
printf "--------------------------------------------------------------------------\n"
x/16xw $fp
printf "--------------------------------------------------------------------------\n"
end

define stackb
	printf "-----------\n"
	set $_c = $fp - $sp
	while ($_c > 0)
		printf "%p: 0x%02X\n", \
			(unsigned char*)($fp - $_c), \
			*(unsigned char*)($fp - $_c)
		set $_c--
	end
	printf "-----------\n"
end

define stackw
	printf "-----------\n"
	set $_c = ($fp - $sp) / sizeof(unsigned int)
	while ($_c > 0)
		printf "%p: 0x%08X\n", \
			((unsigned int*)$fp - $_c), \
			*((unsigned int*)$fp - $_c)
		set $_c--
	end
	printf "-----------\n"
end

define stackg
	printf "-----------\n"
	set $_c = ($fp - $sp) / sizeof(unsigned long long int)
	while ($_c > 0)
		printf "%p: 0x%016llX\n", \
			((unsigned long long int*)$fp - $_c), \
			*((unsigned long long int*)$fp - $_c)
		set $_c--
	end
	printf "-----------\n"
end

define n
si
state
end

define upsa
break *_start
run
state
end

define upsf
break _start
run
state
end

define upma
break *main
run
state
end

define upmf
break main
run
state
end

define s_intel
set disassembly-flavor intel
end

define s_att
set disassembly-flavor att
end
