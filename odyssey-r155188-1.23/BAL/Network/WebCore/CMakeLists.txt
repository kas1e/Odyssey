##################################################
# Network support part.                          #
##################################################

create_include_link(${BAL_DIR}/Network/WebCore/WK BAL)

if(USE_NETWORK_CURL)
    create_include_link(${BAL_DIR}/Network/WebCore/Curl BAL)
    aux_source_directory(${BAL_DIR}/Network/WebCore/Curl WEBCORE_SRC)
endif(USE_NETWORK_CURL)

aux_source_directory(${BAL_DIR}/Network/WebCore/WK WEBCORE_SRC)
