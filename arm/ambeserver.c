#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <errno.h>
#include <termios.h>
#include <string.h>
#include <fcntl.h>

#include <sys/stat.h>
#include <sys/types.h>
#include <sys/select.h>
#include <sys/socket.h>
#include <sys/param.h>

#include <netinet/in.h>

void dump(unsigned char *p, ssize_t n)
{
    int i;
    for (i = 0; i < n; ++i)
        printf("%02x%c", p[i], i % 16 == 15 ? '\n' : ' ');
    if (i % 16)
        printf("\n");
}

int main()
{
    int dspfd, sockfd;
    const ssize_t size_max = 1024;
    ssize_t size_in, size_out;
    char buf_in[size_max], buf_out[size_max];
    socklen_t length = sizeof(struct sockaddr_in);
    struct sockaddr_in sa = { 0 };

    if ((dspfd = open("/dev/dsptask/dstar", O_RDWR)) < 0)
        exit(1);

    if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
        exit(2);

    sa.sin_family = AF_INET;
    sa.sin_port = htons(2460);
    sa.sin_addr.s_addr = htonl(INADDR_ANY);

    if (bind(sockfd, (struct sockaddr *)&sa, sizeof(sa)) < 0)
        exit(3);

    while (1)
    {
        if ((size_in = recvfrom(sockfd, buf_in, size_max,
            0, (struct sockaddr *)&sa, &length)) < 0)
            exit(4);

        if (size_in & 1)
            buf_in[size_in++] = 0;

        if (write(dspfd, buf_in, size_in) != size_in)
            exit(5);

        if ((size_out = read(dspfd, buf_out, size_max)) < 0)
            exit(6);

        if (size_out == 0)
        {
            dump(buf_in, size_in);
            continue; 
        }

        size_out = 4 + ntohs(*(short *)&buf_out[1]);
        if (sendto(sockfd, buf_out, size_out, 0, (struct sockaddr *)&sa,
            sizeof(struct sockaddr_in)) != size_out)
            exit(7);
    }

    return 0;
}
