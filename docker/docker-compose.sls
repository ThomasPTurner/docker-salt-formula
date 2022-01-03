docker-software-package-install-deps:
  pip.installed:
    - name: docker
    - reload_modules: true

docker-software-package-install-pkg:
  pkg.installed:
    - name: docker-ce
    - version: latest
    - reload_modules: true
    - refresh: true

docker-compose-package-install-pkgs:
  pkg.installed:
    - names: 
      - docker-compose
    - runas: root
    - reload_packages: true
