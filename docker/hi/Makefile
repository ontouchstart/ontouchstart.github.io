all:src;ls -lR src
	docker compose run --rm --remove-orphans say-hi
src:src/scratch src/hi src/say-hi;
src/scratch:scratch;docker compose build scratch&&docker create --name inspect hi-scratch /bin/true&& mkdir -p src/scratch&&docker export inspect | tar -xC src/scratch&& docker rm /inspect
src/hi:hi;docker compose build hi&&docker create --name inspect hi-hi /bin/true&& mkdir -p src/hi&&docker export inspect | tar -xC src/hi&& docker rm /inspect
src/say-hi:hi;docker compose build say-hi&&docker create --name inspect hi-say-hi /bin/true&& mkdir -p src/say-hi&&docker export inspect | tar -xC src/say-hi&& docker rm /inspect
clean:;rm -rf *.tar src

