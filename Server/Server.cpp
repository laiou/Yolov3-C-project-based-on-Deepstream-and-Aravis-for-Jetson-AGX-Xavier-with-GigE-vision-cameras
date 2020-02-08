#include <iostream>
#include <strings.h>
#include <string.h>
#include <sys/types.h>     
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
using namespace std;
 
int main()
{
	int sockfd;
	struct sockaddr_in saddr;
	int r;
	char recvline[1025];
	struct sockaddr_in presaddr;
	socklen_t len;
	
	sockfd = socket(AF_INET, SOCK_DGRAM, 0);
	bzero(&saddr, sizeof(saddr));
	saddr.sin_family = AF_INET;
	saddr.sin_addr.s_addr = htonl(INADDR_ANY);
	saddr.sin_port = htons(9999);
	bind(sockfd, (struct sockaddr*)&saddr, sizeof(saddr));
	while (1)
	{
		r = recvfrom(sockfd, recvline, sizeof(recvline), 0 , (struct sockaddr*)&presaddr, &len);
		if (r <= 0)
		{
			perror("");
			exit(-1);
		}
		recvline[r] = 0;
		cout <<"recvfrom "<< inet_ntoa(presaddr.sin_addr) <<" " << recvline << endl;
	}
	return 0;
}
