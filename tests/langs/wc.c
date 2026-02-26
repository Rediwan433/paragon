#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int count;
  char *name;
} Counter;

int compare(const void *a, const void *b) { return (*(int *)a - *(int *)b); }

int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("Usage: %s <file>\n", argv[0]);
    return 1;
  }

  FILE *fp = fopen(argv[1], "r");
  if (!fp) {
    perror("Error opening file");
    return 1;
  }

  int ch;
  int chars = 0, words = 0, lines = 0;
  int in_word = 0;

  while ((ch = fgetc(fp)) != EOF) {
    chars++;
    if (ch == '\n')
      lines++;
    if (ch == ' ' || ch == '\n' || ch == '\t') {
      in_word = 0;
    } else if (!in_word) {
      in_word = 1;
      words++;
    }
  }

  fclose(fp);
  printf("%d %d %d\n", lines, words, chars);
  return 0;
}
