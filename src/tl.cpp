
#include <rspdlite.h>

// [[Rcpp::export]]
std::string formatter(const std::string s, std::vector<std::string> v) {
  rspdlite::formatter(s, v);
}

// [[Rcpp::export]]
void trace(std::string s) { rspdlite::trace_(s); }

// [[Rcpp::export]]
void debug(std::string s) { rspdlite::debug_(s); }

// [[Rcpp::export]]
void info(std::string s) { rspdlite::info_(s); }

// [[Rcpp::export]]
void warn(std::string s) { rspdlite::warn_(s); }

// [[Rcpp::export]]
void error(std::string s) { rspdlite::error_(s); }

// [[Rcpp::export]]
void critical(std::string s) { rspdlite::critical_(s); }

  
