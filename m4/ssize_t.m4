#serial 1

dnl AC_PREREQ(2.14a)

dnl This is a specialization of AC_CHECK_TYPE applied to `ssize_t' with
dnl the difference that it also includes unistd.h on systems that have it.
dnl On Fujitsu UXP/V systems ssize_t is defined in unistd.h.
AC_DEFUN(GAWK_AC_TYPE_SSIZE_T,
  [
    AC_CHECK_HEADERS(unistd.h)
dnl    AC_CHECK_TYPE(ssize_t, int,
         AC_CHECK_TYPE([ssize_t], , [AC_DEFINE([ssize_t], [int], [?])],
      [
#include <sys/types.h>
#if STDC_HEADERS
# include <stdlib.h>
# include <stddef.h>
#endif
#if HAVE_UNISTD_H
# include <unistd.h>
#endif
      ]
    )
  ]
)
