// Write(2) docs: https://man7.org/linux/man-pages/man2/write.2.html
#include <unistd.h>
// write(2) is the system call api
ssize_t write(int fd, const void *buf, size_t count);

#define STDOUT  1
#define MSG_LEN 14

char *msg = "Hello, world!\n";

int main()
{
    write(STDOUT, msg, MSG_LEN);
    return 0;
}