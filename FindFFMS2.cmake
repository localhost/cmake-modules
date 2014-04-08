#
# Try to find the FFMS2 (https://github.com/FFMS/ffms2) library.
#
# On success this will define:
#
#   FFMS2_FOUND         - true if ffms2 is found
#   FFMS2_INCLUDE_DIR   - where to find ffms.h, etc.
#   FFMS2_LIBRARY       - compile flags for libffms2 and its include path
#

if(FFMS2_INCLUDE_DIR AND FFMS2_LIBRARY)
  set(FFMS2_FIND_QUIETLY TRUE)
else(FFMS2_INCLUDE_DIR AND FFMS2_LIBRARY)
  find_package(PkgConfig)
  if(PKG_CONFIG_FOUND)
    pkg_check_modules(_FFMS2 ffms2)
  endif(PKG_CONFIG_FOUND)

  find_path(FFMS2_INCLUDE_DIR
    NAMES ffms.h
    HINTS ${_FFMS2_INCLUDE_DIRS} ${_FFMS2_PREFIX}/include
    PATHS /opt/local/include /usr/local/include /usr/include
  )

  find_library(FFMS2_LIBRARY
    NAMES ffms2
    HINTS ${_FFMS2_LIBRARY_DIRS} ${_FFMS2_PREFIX}/lib
    PATHS /opt/local/lib /usr/local/lib /usr/lib
  )

  if(FFMS2_INCLUDE_DIR AND FFMS2_LIBRARY)
    set(FFMS2_FOUND TRUE)
  endif(FFMS2_INCLUDE_DIR AND FFMS2_LIBRARY)

  if(FFMS2_FOUND)
    mark_as_advanced(FFMS2_INCLUDE_DIR FFMS2_LIBRARY)

    if(NOT FFMS2_FIND_QUIETLY)
      message(STATUS "Found ffms2: ${FFMS2_LIBRARY}")
    endif(NOT FFMS2_FIND_QUIETLY)
  else(FFMS2_FOUND)
    message(STATUS "Looked for ffms2 library:")
    message(STATUS "    Include file detected: [${FFMS2_INCLUDE_DIR}].")
    message(STATUS "    Library file detected: [${FFMS2_LIBRARY}].")
    message(FATAL_ERROR "Could not find ffms2 library")
  endif(FFMS2_FOUND)
endif(FFMS2_INCLUDE_DIR AND FFMS2_LIBRARY)
