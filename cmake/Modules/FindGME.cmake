include(LibFindMacros)

libfind_pkg_check_modules(GME_PKGCONF GME)

find_path(GME_INCLUDE_DIR
	NAMES gme.h
	PATHS
		${GME_PKGCONF_INCLUDE_DIRS}
		"/usr/include/gme"
		"/usr/local/include/gme"
)

find_library(GME_LIBRARY
	NAMES gme
	PATHS
		${GME_PKGCONF_LIBRARY_DIRS}
		"/usr/lib"
		"/usr/local/lib"
)

set(GME_PROCESS_INCLUDES GME_INCLUDE_DIR)
set(GME_PROCESS_LIBS GME_LIBRARY)
libfind_process(GME)

if(GME_FOUND AND NOT TARGET gme)
	add_library(gme UNKNOWN IMPORTED)
	set_target_properties(
		gme
		PROPERTIES
		IMPORTED_LOCATION "${GME_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES "${GME_INCLUDE_DIR}"
	)
endif()
