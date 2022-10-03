all:
	cat -n /etc/os-release 
	dpkg --list --no-pager 

supabase:
	git clone --depth 1 https://github.com/supabase/supabase

# https://supabase.com/docs/guides/hosting/docker
dev:	supabase
	cp .env supabase/docker
	cd supabase/docker && docker-compose up

clean:
	rm -rf supabase
