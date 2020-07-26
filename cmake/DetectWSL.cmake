# Detects if we're running on WSL.
function(_detect_wsl)
    file(READ /proc/sys/kernel/osrelease OSRELEASE)
    string(TOLOWER "${OSRELEASE}" OSRELEASE)
    if (OSRELEASE MATCHES "^.*(microsoft|wsl).*$")
        set(WSL ON PARENT_SCOPE)
    else()
        set(WSL OFF PARENT_SCOPE)
    endif()
endfunction()

_detect_wsl()
message(STATUS "Executing inside WSL: ${WSL}")
