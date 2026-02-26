#include <algorithm>
#include <fstream>
#include <iostream>
#include <map>
#include <sstream>
#include <string>
#include <vector>

class Tokenizer {
public:
  struct Token {
    std::string type;
    std::string value;
    size_t line;
    size_t column;
  };

private:
  std::vector<Token> tokens;
  size_t currentLine;
  size_t currentColumn;

  bool isWhitespace(char c) const {
    return c == ' ' || c == '\t' || c == '\n' || c == '\r';
  }

  bool isAlpha(char c) const {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_';
  }

  bool isDigit(char c) const { return c >= '0' && c <= '9'; }

public:
  std::vector<Token> tokenize(const std::string &source) {
    tokens.clear();
    currentLine = 1;
    currentColumn = 0;

    for (size_t i = 0; i < source.length(); ++i) {
      char c = source[i];
      currentColumn++;

      if (isWhitespace(c)) {
        if (c == '\n') {
          currentLine++;
          currentColumn = 0;
        }
        continue;
      }

      if (isAlpha(c)) {
        std::string value;
        while (i < source.length() && isAlpha(source[i])) {
          value += source[i++];
        }
        i--;

        std::string type = "identifier";
        if (value == "int" || value == "void" || value == "return") {
          type = "keyword";
        } else if (value == "true" || value == "false") {
          type = "boolean";
        }

        tokens.push_back({type, value, currentLine, currentColumn});
        continue;
      }

      if (isDigit(c)) {
        std::string value;
        while (i < source.length() && isDigit(source[i])) {
          value += source[i++];
        }
        i--;
        tokens.push_back({"number", value, currentLine, currentColumn});
        continue;
      }

      if (c == '"') {
        std::string value;
        while (++i < source.length() && source[i] != '"') {
          value += source[i];
        }
        tokens.push_back({"string", value, currentLine, currentColumn});
        continue;
      }

      tokens.push_back(
          {"punctuation", std::string(1, c), currentLine, currentColumn});
    }

    return tokens;
  }
};

int main(int argc, char *argv[]) {
  if (argc < 2) {
    std::cerr << "Usage: " << argv[0] << " <source_file>" << std::endl;
    return 1;
  }

  std::ifstream file(argv[1]);
  if (!file.is_open()) {
    std::cerr << "Error: Could not open file " << argv[1] << std::endl;

    return 1;
  }

  std::stringstream buffer;
  buffer << file.rdbuf();
  std::string source = buffer.str();

  Tokenizer tokenizer;
  auto tokens = tokenizer.tokenize(source);

  for (const auto &token : tokens) {
    std::cout << token.line << ":" << token.column << " " << token.type << " "
              << token.value << std::endl;
  }

  return 0;
}
