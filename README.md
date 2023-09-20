# zone-deed

The tool named zone-deed  is simple to use and aims to be a quick reference tool
This tool is used to enumerate all the authority Name Servers for the domain. Each Name Server is then checked remotely for a zone transfer of the target domain.
And also this tool is an easy way to grab the results of attempted zone transfers, and the full results of the transfer if it is successful.


# Current features

- Can collect name servers of the domain and its count
- zone transfer will be tested against all name servers (NS) for a domain.

### Installation

```sh
$ git clone https://github.com/soufiyasudheer/zone-deed.git
$ cd zone-deed
$ chmod +x zonedeed.sh
```

### Usage

```sh
$ ./zone-deed.sh
$ domain name (example.com)
```
