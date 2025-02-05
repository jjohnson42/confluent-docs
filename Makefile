all:
	sed -i s/VERSION/users/ _config.yml
	./makeattribdoc
	./makeman
	jekyll b
	sed -i s/users/VERSION/ _config.yml

beta:
	sed -i s/VERSION/beta/ _config.yml
	./makeattribdoc
	./makeman
	jekyll b
	sed -i s/beta/VERSION/ _config.yml

testupload: all
	rsync -a _site/* taurus:/var/www/html/users

produpload: all
	#rsync -a _site/* ru3gkpgr@10.38.87.83:/var/www/html/hpc/users
	rsync -a _site/* ru3gkpgr@10.64.200.36:/data2/hpcsite/users

betaupload: beta
	rsync -a _site/* ru3gkpgr@10.38.87.83:/var/www/html/hpc/beta
