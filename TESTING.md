# Testing

Tested using chef-workstation from Homebrew

# Lint and Style

```sh
CHEF_LICENSE=accept-no-persist delivery local lint
```

# Unit specs

```
berks install --except integration
CHEF_LICENSE=accept-no-persist delivery local unit
```

# Integration tests

Check [Test Kitchen](https://kitchen.ci/docs/getting-started/running-test). Consider using the `--concurrency` flag when possible.

## kitchen-vagrant

Tested locally with macOS Monterrey 12.1, VirtualBox 6.1.30, and Vagrant 2.2.19.

```sh
kitchen test
```

## kitchen-dokken

Tested locally with macOS Monterrey 12.1, and Docker Desktop 4.3.1.
Tested remotely with Github Actions.

```sh
KITCHEN_LOCAL_YAML=kitchen.dokken.yml kitchen test
```
