
#include <rspdlite>

namespace tl {

// In order to survive on CRAN, we have to cope with non-C++20 compilation
#if  __cplusplus >= 202002L

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

    inline void        set_level(const std::string& s) { rspdlite::set_level(s);       }
    inline std::string get_level()                     { return rspdlite::get_level(); }

    inline void        set_name(const std::string& s) { rspdlite::set_name(s);       }
    inline std::string get_name()                     { return rspdlite::get_name(); }

#else

    // C++17 and below fallback to permit compilation
    #if defined(__GNUC__) || defined(__clang__)
        #pragma message("You need to enable C++20 to for tl / rspdlite / spdlite logging.")
    #endif

    inline void trace(std::string, ...) {}
    inline void debug(std::string, ...) {}
    inline void info(std::string, ...) {}
    inline void warn(std::string, ...) {}
    inline void error(std::string, ...) {}
    inline void critical(std::string, ...) {}
    inline void set_level(std::string, ...) {}
    inline std::string get_level() { return std::string(); }
    inline void set_name(std::string) {}
    inline std::string get_name() { return std::string(); }

#endif
}
