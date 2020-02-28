if(USE_NETWORK STREQUAL "CURL")
    # Find if libcURL was compiled with OpenSSL.
    if(CURL_STATIC_LDFLAGS MATCHES "-lssl")
        set(USE_NETWORK_CURL_OPENSSL TRUE)
        mark_as_advanced(USE_NETWORK_CURL_OPENSSL)
    endif(CURL_STATIC_LDFLAGS MATCHES "-lssl")
 
    set(USE_NETWORK_CURL TRUE)
    mark_as_advanced(USE_NETWORK_CURL)
    set(DEB_PACKAGE_DEPENDS "${DEB_PACKAGE_DEPENDS}, libcurl3 (>= 7.19.5-1ubuntu2)")
endif(USE_NETWORK STREQUAL "CURL")

if(USE_NETWORK STREQUAL "QT")
    pkg_check_modules(QTNETWORK REQUIRED QtNetwork)
    pkg_check_modules(QTCORE REQUIRED QtCore)
    set(NETWORK_INCLUDE_DIRS ${QTNETWORK_INCLUDE_DIRS} ${QTCORE_INCLUDE_DIRS} ${REQUIRED_FOR_DNSPREFECTH})
    set(NETWORK_LIBRARIES ${QTNETWORK_LIBRARIES} ${QTCORE_LIBRARIES})

    set(USE_NETWORK_QT TRUE)
    mark_as_advanced(USE_NETWORK_QT)
    set(DEB_PACKAGE_DEPENDS "${DEB_PACKAGE_DEPENDS}, libqtcore4 (>= 4.5.3really4.5.2-0ubuntu1), libqt4-network (>= 4.5.3really4.5.2-0ubuntu1)")

    # This option was added but we do not have the right header so just disable it for now.
    set(ENABLE_QT_BEARER FALSE)

endif(USE_NETWORK STREQUAL "QT")

if(USE_NETWORK STREQUAL "SOUP")
    pkg_check_modules(SOUP REQUIRED libsoup-2.4>=2.28.2)
    set(NETWORK_INCLUDE_DIRS ${SOUP_INCLUDE_DIRS})
    set(NETWORK_LIBRARIES ${SOUP_LIBRARIES})

    set(USE_NETWORK_SOUP TRUE)
    mark_as_advanced(USE_NETWORK_SOUP)
    set(DEB_PACKAGE_DEPENDS "${DEB_PACKAGE_DEPENDS}, libsoup2.4-1 (>= 2.28.2)")
endif(USE_NETWORK STREQUAL "SOUP")
