#include <stdio.h>
#include <time.h>

int main() {
  struct timespec ts;
  ts.tv_sec = 0;
  ts.tv_nsec = 603960400;

  char buf[255];
  FILE *f = fopen("2222.txt", "r");

  while (fgets(buf, 255, f) != NULL) {
    fputs(buf, stdout);
    nanosleep(&ts, &ts);
  }

  fputs("\n", stdout);
  fclose(f);
  return 0;
}
