
#include <rspdlite>

namespace tl {

    template<class... Args>
    void trace(spdlite::format_string_t<Args...> s, Args&&... args) {
        rspdlite::log_trace(s, std::forward<Args>(args)...);
    }

    template<class... Args>
    void debug(spdlite::format_string_t<Args...> s, Args&&... args) {
        rspdlite::log_debug(s, std::forward<Args>(args)...);
    }

    template<class... Args>
    void info(spdlite::format_string_t<Args...> s, Args&&... args) {
        rspdlite::log_info(s, std::forward<Args>(args)...);
    }

    template<class... Args>
    void warn(spdlite::format_string_t<Args...> s, Args&&... args) {
        rspdlite::log_warn(s, std::forward<Args>(args)...);
    }

    template<class... Args>
    void error(spdlite::format_string_t<Args...> s, Args&&... args) {
        rspdlite::log_error(s, std::forward<Args>(args)...);
    }

    template<class... Args>
    void critical(spdlite::format_string_t<Args...> s, Args&&... args) {
        rspdlite::log_critical(s, std::forward<Args>(args)...);
    }

}
