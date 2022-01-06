docker-software-package-install-pkg:
  pkg.installed:
    - names:
      - python3-docker
      - ca-certificates
      - curl
      - gnupg
      - lsb-release
    - reload_modules: true
    - refresh: true

add-docker-gpg-key:
  cmd.run:
    - name: curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

set-stable-repo:
  cmd.run: 
    - name: echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

docker-package-install-pkgs:
  pkg.installed:
    - names:
      - docker-ce
      - docker-ce-cli
      - containerd.io
    - refresh: true

docker-service-running:
  service.running:
    - name: docker
    - enable: true

install-compose:
  cmd.run:
    - names:
      - curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      - chmod +x /usr/local/bin/docker-compose