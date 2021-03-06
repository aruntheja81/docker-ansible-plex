Repo Info
=========
Builds a [Docker] image to run [Plex].

Building
--------
If you need to build the image:
```
docker build -t plex .
```
Usage
-----
Setup volumes for exposing to your host. The actual NFS/SMB mounts must exist
on your Docker host
```
VOLUME [ "/var/lib/plexmediaserver","/movies","/music","/pictures","/tv_shows","/videos"]
```
Exposes the following ports
* `1900/udp`
* `5353/udp`
* `32400`
* `32400/udp`
* `32469`
* `32469/udp`

Spin up example:
```
docker run --net=host -d -v plex_config:/var/lib/plexmediaserver \
  -v /mnt/movies:/movies -v /mnt/music:/music \
  -p 1900:1900/udp -p 5353:5353/udp -p 32400:32400 \
  -p 32400:32400/udp -p 32469:32469 \
  -p 32469:32469/udp mrlesmithjr/plex
```

Docker-compose example:
```
docker-compose up -d
```

Requirements:
Ensure that your host has the correct mounts mounted as in the example above:
- /mnt/movies
- /mnt/music

License
-------

BSD

Author Information
------------------

Larry Smith Jr.
- [@mrlesmithjr]
- [everythingshouldbevirtual.com]
- [mrlesmithjr@gmail.com]


[Ansible]: <https://www.ansible.com/>
[Docker]: <https://www.docker.com>
[Plex]: <https://www.plex.tv/>
[@mrlesmithjr]: <https://twitter.com/mrlesmithjr>
[everythingshouldbevirtual.com]: <http://everythingshouldbevirtual.com>
[mrlesmithjr@gmail.com]: <mailto:mrlesmithjr@gmail.com>
