#  _____________________________________________________________________________
#  Copyright (c) <2020> <copyright Steven Varga, Toronto, On>
#  _____________________________________________________________________________


all: try-prefix conversion-prefix

# clean target will remove it, so create on demand
setup-dir:
	@mkdir -p build
# 
remove_prefix = $(shell echo '$1' | cut -d'-' -f2)

conversion-src = ConversionTests.c
conversion-dump:
	@grep -Rn "#ifdef" $(conversion-src) |cut -d' ' -f2 | sort -f | tr '\n' ' '; echo '\n'
conversion-list = H5_LDOUBLE_TO_LONG_SPECIAL_TEST H5_LONG_TO_LDOUBLE_SPECIAL_TEST H5_LDOUBLE_TO_LLONG_ACCURATE_TEST 	H5_LLONG_TO_LDOUBLE_CORRECT_TEST H5_NO_ALIGNMENT_RESTRICTIONS_TEST H5_DISABLE_SOME_LDOUBLE_CONV_TEST
conversion-prefix: $(foreach var,$(conversion-list), conversion-$(var))
conversion-%: $(conversion-src) setup-dir
	$(eval value=$(call remove_prefix,$@))
	@$(CC) -o build/$(value) -D$(value) $(conversion-src)
	@./build/$(value) ; echo $(value) $$?

try-src = HDFTests.c
try-dump:
	@grep -Rn "#ifdef" $(try-src) |cut -d' ' -f2 | sort -f | tr '\n' ' '; echo '\n'
try-list = DEV_T_IS_SCALAR FC_DUMMY_MAIN FC_DUMMY_MAIN FC_DUMMY_MAIN GETTIMEOFDAY_GIVES_TZ __GLIBC_PREREQ HAVE_ATTRIBUTE HAVE_C99_DESIGNATED_INITIALIZER HAVE_C99_FUNC HAVE_DEFAULT_SOURCE HAVE_DIRECT HAVE_FUNCTION HAVE_IOEO HAVE_LONG_LONG HAVE_OFF64_T HAVE_SOCKLEN_T HAVE_STAT64_STRUCT HAVE_STAT_ST_BLOCKS HAVE_STRUCT_TEXT_INFO HAVE_STRUCT_TIMEZONE HAVE_STRUCT_VIDEOCONFIG HAVE_SYS_SOCKET_H HAVE_SYS_TIME_H HAVE_SYS_TIME_H HAVE_SYS_TIME_H HAVE_SYS_TIME_H HAVE_SYS_TIME_H HAVE_SYS_TYPES_H HAVE_SYS_TYPES_H HAVE_TIMEZONE HAVE___TM_GMTOFF HAVE_TM_GMTOFF HAVE_UNISTD_H PRINTF_LL_WIDTH STDC_HEADERS SYSTEM_SCOPE_THREADS TEST_DIRECT_VFD_WORKS TEST_LFS_WORKS TIME_WITH_SYS_TIME VSNPRINTF_WORKS
try-prefix: $(foreach var,$(try-list), try-$(var))
try-%: $(try-src) setup-dir
	$(eval value=$(call remove_prefix,$@))
	@$(CC) -o build/$(value) -D$(value) $(try-src) > /dev/null 2>&1; echo $(value) $$?

clean: 
	@rm -rf build 

.PHONY: all try-prefix conversion-prefix 
